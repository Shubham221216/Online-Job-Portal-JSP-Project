package com.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB1.DBConnect1;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/add_user")

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try
		{
			HttpSession session = req.getSession();
			
			String userOTP = req.getParameter("userOTP");
			
			String name = (String)session.getAttribute("userName");
			String qua = (String)session.getAttribute("userQua");
			String email = (String)session.getAttribute("userEmail");
			String ps = (String)session.getAttribute("userPassword");
			String address = (String)session.getAttribute("userAddress");
			String genOTP = (String)session.getAttribute("genOTP");
			String gender = (String)session.getAttribute("userGender");
			
			if(userOTP.equals(genOTP)) {
				UserDAO dao = new UserDAO(DBConnect1.getConn());
				
				User u = new User(name,email,ps,qua,"User",address,gender);
				
				boolean f = dao.addUser(u);
				
				if(f)
				{
					session.setAttribute("succMsg", "Resistration Successful..");
					resp.sendRedirect("login.jsp");
				}
				else
				{
					session.setAttribute("succMsg", "Something went Wrong");
					resp.sendRedirect("signup.jsp");
				}
				
			}else {
				session.setAttribute("succMsg", "OTP Invalid!");
				resp.sendRedirect("OTPValidation.jsp");
			}
			
			
			
			
			}catch(Exception e){
			
		}
		
		
		
	}

}
