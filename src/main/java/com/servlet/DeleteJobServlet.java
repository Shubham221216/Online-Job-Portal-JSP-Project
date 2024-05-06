package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB1.DBConnect1;
import com.dao.jobDAO;
@WebServlet("/delete")


public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int id =Integer.parseInt(req.getParameter("id"));
			
			jobDAO dao = new jobDAO(DBConnect1.getConn());
			boolean f = dao.deleteJobs(id);
			
			
			
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("succMsg", "Job Delete Successfully..");
				resp.sendRedirect("view_job.jsp");
				
			}else {
				session.setAttribute("succMsg", "Something went wrong..");
				resp.sendRedirect("view_job.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
	}
	
	

}
