package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB1.DBConnect1;
import com.dao.*;
import com.entity.*;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try 
		{
			
			String nm=req.getParameter("name");
			String ps=req.getParameter("password");
			User u = new User();
			Company c= new Company();
			companyDAO dao2= new companyDAO(DBConnect1.getConn());
			
			HttpSession session = req.getSession();
			
			/*if("admin22@gmail.com".equals(nm)&& "admin@123".equals(ps) ){
				session.setAttribute("user", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}
			
			
			 * else if (company != null) { // Creating a User object for consistency in
			 * setting role session.setAttribute("user", u); u.setRole("company");
			 * 
			 * // Store company User-Name and name in session
			 * //session.setAttribute("companyUsername", company.getName());
			 * session.setAttribute("companyName", company.getName());
			 * 
			 * resp.sendRedirect("admin.jsp");
			 * 
			 * 
			 * 
			 * }
			 

			else {
				*/
				
				UserDAO dao = new UserDAO(DBConnect1.getConn());
				User  user = dao.login(nm, ps);
				
				
				
				if(user!=null)
				{
					session.setAttribute("user", user);
					resp.sendRedirect("home.jsp");
				}
				
				else  
				{
					
					session.setAttribute("succMsg", "Invalid Credentials");
					resp.sendRedirect("login.jsp");
				}
				
				
				
					
			
			
			
		}

	catch(Exception e)
	{
		e.printStackTrace();

	}
}

}
