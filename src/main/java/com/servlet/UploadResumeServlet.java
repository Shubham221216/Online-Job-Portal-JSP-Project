package com.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.DB1.DBConnect1;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadResumeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "Downloads"; // Change this to your desired upload directory name

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        int id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            session.setAttribute("errMsg", "Invalid user ID");
            response.sendRedirect("home.jsp");
            return; // Terminate the method execution
        }
        
        Part filePart = request.getPart("fileUpload");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        if (fileName == null || fileName.trim().isEmpty()) {
            session.setAttribute("errMsg", "No file selected");
            response.sendRedirect("home.jsp");
            return; // Terminate the method execution
        }

        try {
            // Save the uploaded file
            String realPath = request.getServletContext().getRealPath("");
            File uploadDir = new File(realPath + File.separator + UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            Files.copy(filePart.getInputStream(), Paths.get(realPath, filePath));

            // Store the file path in the database
            try (Connection conn = DBConnect1.getConn()) {
                String sql = "UPDATE user SET resume = ? WHERE id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, filePath);
                pstmt.setInt(2, id);
                int rows = pstmt.executeUpdate();
                
                if (rows > 0) {
                    // Resume uploaded successfully
                    session.setAttribute("succMsg", "Resume uploaded successfully");
                } else {
                    // Failed to upload resume
                    session.setAttribute("errMsg", "Failed to upload resume");
                }
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            session.setAttribute("errMsg", "Error uploading resume");
        }
        
        response.sendRedirect("home.jsp");
    }
}
