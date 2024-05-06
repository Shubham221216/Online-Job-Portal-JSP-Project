package com.dao;

import java.sql.*;
import java.util.*;

import com.entity.Company;
import com.entity.Jobs;
import com.entity.User;

import java.util.List;

public class jobDAO {

	private Connection conn;

	public jobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

//	public boolean addJobs(Jobs j) {
//		boolean f = false;
//
//		try {
//			String sql = "insert into jobs(title,description,category,status,location,criteria,contact,company) values(?,?,?,?,?,?,?,?)";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setString(1, j.getTitle());
//			ps.setString(2, j.getDescription());
//			ps.setString(3, j.getCategory());
//			ps.setString(4, j.getStatus());
//			ps.setString(5, j.getLocation());
//			ps.setString(6, j.getCriteria());
//			ps.setString(7, j.getContact());
//			ps.setString(8, j.getCompany());
//
//			int i = ps.executeUpdate();
//
//			if (i == 1) {
//				f = true;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return f;
//	}
	
	
	//To Add/Post Jobs
	public boolean addJobs2(Jobs j) {
		boolean f = false;

		try {
			//  category=role_category, criteria=eligibility
			
			String sql = "insert into jobs2(title,qualification,company_name,"
					+ "experience,Package,location,openings,description,roles_responsibilities,"
					+ "eligibility,role,industry,department,employment_time,role_category,"
					+ "key_skills,about_company,company_address,contact,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getQualification());
			ps.setString(3, j.getCompany());
			ps.setString(4, j.getExperience());
			ps.setString(5, j.getPackage());
			ps.setString(6, j.getLocation());
			ps.setString(7, j.getOpenings());
			ps.setString(8, j.getDescription());
			ps.setString(9, j.getRoles_resposibility());
			ps.setString(10, j.getCriteria());
			ps.setString(11, j.getRole());
			ps.setString(12, j.getIndustry());
			ps.setString(13, j.getDepartment());
			ps.setString(14, j.getEmployment());
			ps.setString(15, j.getCategory());
			ps.setString(16, j.getKey_skills());
			ps.setString(17, j.getAbout_company());
			ps.setString(18, j.getCompany_address());
			ps.setString(19, j.getContact());
			ps.setString(20, j.getStatus());
			
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	

//	public List<Jobs> getAllJobs() {
//		List<Jobs> list = new ArrayList<Jobs>();
//		Jobs j = null;
//		try {
//			String sql = "select * from jobs order by id desc";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				j = new Jobs();
//				j.setId(rs.getInt(1));
//				j.setTitle(rs.getString(2));
//				j.setDescription(rs.getString(3));
//				j.setCategory(rs.getString(4));
//				j.setStatus(rs.getString(5));
//				j.setLocation(rs.getString(6));
//				j.setCriteria(rs.getString(7));
//				j.setPdate(rs.getTimestamp(8) + "");
//				j.setContact(rs.getString(9));
//				j.setCompany(rs.getString(10));
//				list.add(j);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return list;
//	}
//	
	
	
	//To view all jobs for Admin
	public List<Jobs> getAllJobs2(String companyName) {
	    List<Jobs> list = new ArrayList<>();
	    Jobs j = null;
	    try {
	        String sql = "SELECT * FROM jobs2 WHERE company_name = ? ORDER BY id DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, companyName);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            j = new Jobs();
	            j.setId(rs.getInt(1));
	            j.setTitle(rs.getString(2));
	            j.setQualification(rs.getString(3));
	            j.setCompany(rs.getString(4));
	            j.setExperience(rs.getString(5));
	            j.setPackage(rs.getString(6));
	            j.setLocation(rs.getString(7));
	            j.setPdate(rs.getTimestamp(8) + "");
	            j.setOpenings(rs.getString(9));
	            j.setDescription(rs.getString(10));
	            j.setRoles_resposibility(rs.getString(11));
	            j.setCriteria(rs.getString(12));
	            j.setRole(rs.getString(13));
	            j.setIndustry(rs.getString(14));
	            j.setDepartment(rs.getString(15));
	            j.setEmployment(rs.getString(16));
	            j.setCategory(rs.getString(17));
	            j.setKey_skills(rs.getString(18));
	            j.setAbout_company(rs.getString(19));
	            j.setCompany_address(rs.getString(20));
	            j.setContact(rs.getString(21));
	            j.setStatus(rs.getString(22));

	            list.add(j);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}



	
	
	//To view all the jobs for User
	
	public List<Jobs> getAllJobsForUser() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String sql = "select * from jobs2 where status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setQualification(rs.getString(3));
				j.setCompany(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setPackage(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				j.setOpenings(rs.getString(9));
				j.setDescription(rs.getString(10));
				j.setRoles_resposibility(rs.getString(11));
				j.setCriteria(rs.getString(12));
				j.setRole(rs.getString(13));
				j.setIndustry(rs.getString(14));
				j.setDepartment(rs.getString(15));
				j.setEmployment(rs.getString(16));
				j.setCategory(rs.getString(17));
				j.setKey_skills(rs.getString(18));
				j.setAbout_company(rs.getString(19));
				j.setCompany_address(rs.getString(20));
				j.setContact(rs.getString(21));
				j.setStatus(rs.getString(22));
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	//To view the Job after clicking edit
	
	public Jobs getJobById(int id) {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			String sql = "select * from jobs2 where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setQualification(rs.getString(3));
				j.setCompany(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setPackage(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				j.setOpenings(rs.getString(9));
				j.setDescription(rs.getString(10));
				j.setRoles_resposibility(rs.getString(11));
				j.setCriteria(rs.getString(12));
				j.setRole(rs.getString(13));
				j.setIndustry(rs.getString(14));
				j.setDepartment(rs.getString(15));
				j.setEmployment(rs.getString(16));
				j.setCategory(rs.getString(17));
				j.setKey_skills(rs.getString(18));
				j.setAbout_company(rs.getString(19));
				j.setCompany_address(rs.getString(20));
				j.setContact(rs.getString(21));
				j.setStatus(rs.getString(22));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return j;
	}

	
	//To update the Job 
	
	public boolean updateJob(Jobs j) {
		boolean f = false;

		try {
			String sql = "update jobs2 set title=?,qualification=?,company_name=?,experience=?,"
					+ "Package=?,location=?,openings=?,description=?,roles_responsibilities=?,"
					+ "eligibility=?,role=?,industry=?,department=?,employment_time=?"
					+ ",role_category=?,key_skills=?,about_company=?,company_address=?,"
					+ "contact=?,status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getQualification());
			ps.setString(3, j.getCompany());
			ps.setString(4, j.getExperience());
			ps.setString(5, j.getPackage());
			ps.setString(6, j.getLocation());
			ps.setString(7, j.getOpenings());
			ps.setString(8, j.getDescription());
			ps.setString(9, j.getRoles_resposibility());
			ps.setString(10, j.getCriteria());
			ps.setString(11, j.getRole());
			ps.setString(12, j.getIndustry());
			ps.setString(13, j.getDepartment());
			ps.setString(14, j.getEmployment());
			ps.setString(15, j.getCategory());
			ps.setString(16, j.getKey_skills());
			ps.setString(17, j.getAbout_company());
			ps.setString(18, j.getCompany_address());
			ps.setString(19, j.getContact());
			ps.setString(20, j.getStatus());
			ps.setInt(21, j.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean deleteJobs(int id) {
		boolean f = false;

		try {
			String sql = "delete from jobs2 where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	// To select Jobs either by Category or by Location
	public List<Jobs> getJobsORLocationAndCate(String category, String location) {
		List<Jobs> list = new ArrayList<Jobs>();

		Jobs j = null;

		try {
			String sql = "select * from jobs2 where role_category=? or location=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, location);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setQualification(rs.getString(3));
				j.setCompany(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setPackage(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				j.setOpenings(rs.getString(9));
				j.setDescription(rs.getString(10));
				j.setRoles_resposibility(rs.getString(11));
				j.setCriteria(rs.getString(12));
				j.setRole(rs.getString(13));
				j.setIndustry(rs.getString(14));
				j.setDepartment(rs.getString(15));
				j.setEmployment(rs.getString(16));
				j.setCategory(rs.getString(17));
				j.setKey_skills(rs.getString(18));
				j.setAbout_company(rs.getString(19));
				j.setCompany_address(rs.getString(20));
				j.setContact(rs.getString(21));
				j.setStatus(rs.getString(22));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

	// To select Jobs by Category and Location
	public List<Jobs> getJobsAndLocationAndCate(String category, String location) {
		List<Jobs> list = new ArrayList<Jobs>();

		Jobs j = null;
		
		try {
			String sql="select * from jobs2 where role_category=? and location=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, category);
			ps.setString(2, location);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setQualification(rs.getString(3));
				j.setCompany(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setPackage(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				j.setOpenings(rs.getString(9));
				j.setDescription(rs.getString(10));
				j.setRoles_resposibility(rs.getString(11));
				j.setCriteria(rs.getString(12));
				j.setRole(rs.getString(13));
				j.setIndustry(rs.getString(14));
				j.setDepartment(rs.getString(15));
				j.setEmployment(rs.getString(16));
				j.setCategory(rs.getString(17));
				j.setKey_skills(rs.getString(18));
				j.setAbout_company(rs.getString(19));
				j.setCompany_address(rs.getString(20));
				j.setContact(rs.getString(21));
				j.setStatus(rs.getString(22));
				list.add(j);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		User j = null;
		try {
			String sql = "select * from user order by id ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new User();
				j.setId(rs.getInt(1));
				j.setName(rs.getString(2));
				j.setQualification(rs.getString(3));
				j.setEmail(rs.getString(4));
				j.setAddress(rs.getString(7));
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}



