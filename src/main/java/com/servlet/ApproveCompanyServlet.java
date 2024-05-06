package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB1.DBConnect1;
import com.dao.companyDAO;
import com.entity.Company;



@WebServlet("/approve")

public class ApproveCompanyServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
            int id = Integer.parseInt(req.getParameter("id"));
            String approve = req.getParameter("approve");

            Company j = new Company();
            j.setId(id);
            j.setApprove(approve);

            HttpSession session = req.getSession();

            companyDAO dao = new companyDAO(DBConnect1.getConn());
            boolean f = dao.ApproveCompany(j);

            if (f) {
                session.setAttribute("succMsg", "Company Approved Successfully..");
            } else {
                session.setAttribute("succMsg", "Something went wrong..");
            }

            resp.sendRedirect("view_company.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("view_company.jsp"); // Redirect to view_company.jsp in case of any error
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Handle GET requests if needed
        resp.sendRedirect("view_company.jsp"); // Redirect to view_company.jsp if GET method is used
    
    }
	
	

}
