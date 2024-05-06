package com.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB1.DBConnect1;
import com.dao.*;
import com.entity.*;
import java.sql.*;


@WebServlet("/login2")
public class LoginCompanyServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try 
		{
			
			
			/*
			 * Connection
			 * conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal",
			 * "root","Naruto@123"); Statement stmt = conn.createStatement(); ResultSet rs =
			 * stmt.executeQuery("select approve from company_register");
			 */
			
			String nm=req.getParameter("name");
			String ps=req.getParameter("password");
			
			/*
			 * if(rs.next()=="True") { String app="True"; }
			 */
			
			
			Company c= new Company();
			companyDAO dao2= new companyDAO(DBConnect1.getConn());
			
			Company company = dao2.loginCompany(nm, ps,"True");
			HttpSession session = req.getSession();
			
			
			
			if (company != null) {
			    // Creating a User object for consistency in setting role
			    session.setAttribute("company", c);
			    c.setRole("company");
			    
			    // Store company User-Name and name in session
			    //session.setAttribute("companyUsername", company.getName());
			    session.setAttribute("companyName", company.getName());
			    
				/* session.setAttribute("address",company.getAddress()); */
			    
			    resp.sendRedirect("admin.jsp");
			}
			
			
			 
			else {
				session.setAttribute("succMsg", "Invalid Credentials <br> OR<br> Not Approved by the admin yet");
				resp.sendRedirect("login_company.jsp");
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	}
	
	

}
