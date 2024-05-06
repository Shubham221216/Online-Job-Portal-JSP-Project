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

@WebServlet("/add_company")

public class RegisterCompanyServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try
		{
			HttpSession session = req.getSession();	
			String COTP = req.getParameter("COTP");
			
			
			
			String name = (String)session.getAttribute("CName");
			String email = (String)session.getAttribute("CEmail");
			String ps = (String)session.getAttribute("CPassword");
			String address = (String)session.getAttribute("CAddress");
			String website = (String)session.getAttribute("website");
			String genOTP = (String)session.getAttribute("genOTP");
			
			
			
			if(COTP.equals(genOTP)) {
				
				companyDAO dao = new companyDAO(DBConnect1.getConn());
				
				Company u = new Company(name,email,ps,"company",address,website,"False");
				
				boolean f = dao.addCompany(u);
				
				if(f)
				{
					session.setAttribute("succMsg", "Resistration Successful wait for Admin Approval");
					resp.sendRedirect("login_company.jsp");
				}
				else
				{
					session.setAttribute("succMsg", "Something went Wrong");
					resp.sendRedirect("signup_company.jsp");
				}
				
			}else {
				session.setAttribute("succMsg", "OTP Invalid!");
				resp.sendRedirect("OTPValidation2.jsp");
			}

			
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}
	
	}
	
	
	

