package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB1.DBConnect1;
import com.dao.jobDAO;
import com.entity.Jobs;

@WebServlet("/add_job2")

public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("desc");
			String criteria=req.getParameter("criteria");
			String contact=req.getParameter("contact");
			String company=req.getParameter("company");
			String experience=req.getParameter("experience");
			String Package=req.getParameter("Package");
			String openings=req.getParameter("openings");
			String roles_resposibility=req.getParameter("roles_resposibility");
			String role=req.getParameter("role");
			String industry=req.getParameter("industry");
			String department=req.getParameter("department");
			String employment=req.getParameter("employment");
			String key_skills=req.getParameter("key_skills");
			String about_company=req.getParameter("about_company");
			String company_address=req.getParameter("company_address");
		    String qualification=req.getParameter("qualification");
			
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);
			j.setCriteria(criteria);
			j.setContact(contact);
			j.setCompany(company);
			j.setExperience(experience);
			j.setPackage(Package);
			j.setOpenings(openings);
			j.setRoles_resposibility(roles_resposibility);
			j.setRole(role);
			j.setIndustry(industry);
			j.setDepartment(department);
			j.setEmployment(employment);
			j.setKey_skills(key_skills);
			j.setAbout_company(about_company);
			j.setCompany_address(company_address);
			j.setQualification(qualification);		
			
			HttpSession session=req.getSession();
			
			jobDAO dao = new jobDAO(DBConnect1.getConn());
			boolean f= dao.addJobs2(j);
			
			if(f)
			{
				session.setAttribute("succMsg", "Job Post Successfully..");
				resp.sendRedirect("add_job2.jsp");
				
			}else {
				session.setAttribute("succMsg", "Something went wrong..");
				resp.sendRedirect("add_job2.jsp");
			}
			
		}
		catch(Exception e) {
			
		}
	}
	

}
