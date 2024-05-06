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


@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String qua = req.getParameter("qua");
			String email = req.getParameter("email");
			String ps = req.getParameter("ps");
			String address = req.getParameter("address");
			String gender = req.getParameter("gender");
			
			UserDAO dao = new UserDAO(DBConnect1.getConn());
			
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qua);
			u.setPassword(ps);
			u.setEmail(email);
			u.setAddress(address);
			u.setGender(gender);
			
			boolean f = dao.updateUser(u);
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Profile Updated Successfully");
				resp.sendRedirect("home.jsp");
				
			}
			else {
				session.setAttribute("succMsg", "Something went Wrong");
				resp.sendRedirect("home.jsp");
			}
			
		}
			
		
			
			
		
		catch(Exception e)
		{
			e.printStackTrace();;
		}
	
	
}
}