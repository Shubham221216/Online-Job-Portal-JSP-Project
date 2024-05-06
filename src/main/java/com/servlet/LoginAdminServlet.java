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

@WebServlet("/loginadmin")

public class LoginAdminServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String nm = req.getParameter("name");
			String ps = req.getParameter("password");
			User u = new User();
			Company c = new Company();
			companyDAO dao2 = new companyDAO(DBConnect1.getConn());
			
			HttpSession session = req.getSession();

			if ("admin".equals(nm) && "admin".equals(ps)) {
				session.setAttribute("admin", u);
				u.setRole("admin");
				resp.sendRedirect("adminDashboard.jsp");
			} else {

				session.setAttribute("succMsg", "Invalid Credentials");
				resp.sendRedirect("adminPortal.jsp");

			}

		}

		catch (Exception e) {
			e.printStackTrace();

		}
	}

}
