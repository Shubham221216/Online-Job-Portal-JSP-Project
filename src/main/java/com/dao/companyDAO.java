package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;


public class companyDAO {

	String name;
		private Connection conn;

		public companyDAO(Connection conn) {
			super();
			this.conn = conn;
		}

		
		public boolean addCompany(Company u)
		{
			boolean f= false;
			
			try
			{
				String sql ="insert into company_register(name,email,password,role,address,website,approve) values (?,?,?,?,?,?,?)";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, u.getName());
				ps.setString(2, u.getEmail());
				ps.setString(3, u.getPassword());
				ps.setString(4, "company");
				ps.setString(5, u.getAddress());
				ps.setString(6, u.getQualification());
				ps.setString(7,"False");
				int i = ps.executeUpdate();
				
				if(i==1)
				{ 
					f=true;
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return f;
			
		}
		
		
		public Company loginCompany(String nm,String psw,String app)
		{
			Company u = null;
			
			try
			{
				String sql="select * from company_register where name=? and password=? and approve=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, nm);
				ps.setString(2, psw);
				ps.setString(3, app);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					u = new Company();
					u.setId(rs.getInt(1));
					u.setName(rs.getString(2));
					u.setEmail(rs.getString(3));
					u.setPassword(rs.getString(4));
					u.setRole(rs.getString(5));
					u.setAddress(rs.getString(6));
					u.setQualification(rs.getString(7));
					u.setApprove(rs.getString(8));
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
			return u;
			
		}
		
		public boolean ApproveCompany(Company j) {
		    boolean f = false;

		    try {
		        String sql = "UPDATE company_register SET approve=? WHERE id=?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        // Set the parameters
		        ps.setString(1, j.getApprove());
		        ps.setInt(2, j.getId());
		        
		        int i = ps.executeUpdate();

		        if (i == 1) {
		            f = true;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return f;
		}
		
		
		
		public boolean DisApproveCompany(Company u)
		{
			boolean f=false;
			
			try {
				String sql="update company_register set approve=False where id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				
				ps.setString(1, u.getApprove());
				ps.setInt(2, u.getId());
				
				int i=ps.executeUpdate();
				
				if(i==1)
				{
					f=true;
				}
				
			}
			catch(Exception e)
			{
				
			}
			return f;
		}
		
		public Company getCompanyByID(int id) {
			List<Company> list = new ArrayList<Company>();
		    Company company = null;
		    try {
		        String sql = "SELECT * FROM company_register WHERE id=?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) { // Check if there are any results
		            company = new Company();
		            company.setId(rs.getInt(1));
		            company.setName(rs.getString(2));
		            company.setEmail(rs.getString(3));
		            company.setPassword(rs.getString(4));
		            company.setRole(rs.getString(5));
		            company.setAddress(rs.getString(6));
		            company.setQualification(rs.getString(7));
		            company.setApprove(rs.getString(8));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return company;
		}
		
		
		//To view all the companies for Admin
		
		public List<Company> getAllCompany(){
			List<Company> list = new ArrayList<Company>();
			Company c = null;
			
			try {
				String sql="select * from company_register order by id ";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					c = new Company();
					c.setId(rs.getInt(1));
					c.setName(rs.getString(2));
					c.setEmail(rs.getString(3));
					c.setPassword(rs.getString(4));
					c.setRole(rs.getString(5));
					c.setAddress(rs.getString(6));
					c.setQualification(rs.getString(7));
					c.setApprove(rs.getString(8));
					list.add(c);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		
		public List<Company> getAllApprovedCompany(){
			List<Company> list = new ArrayList<Company>();
			Company c = null;
			
			try {
				String sql="select * from company_register where approve=?  order by id ";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "True");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					c = new Company();
					c.setId(rs.getInt(1));
					c.setName(rs.getString(2));
					c.setEmail(rs.getString(3));
					c.setPassword(rs.getString(4));
					c.setRole(rs.getString(5));
					c.setAddress(rs.getString(6));
					c.setQualification(rs.getString(7));
					c.setApprove(rs.getString(8));
					list.add(c);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public List<Company> getAllDisApprovedCompany(){
			List<Company> list = new ArrayList<Company>();
			Company c = null;
			
			try {
				String sql="select * from company_register where approve=?  order by id ";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "False");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					c = new Company();
					c.setId(rs.getInt(1));
					c.setName(rs.getString(2));
					c.setEmail(rs.getString(3));
					c.setPassword(rs.getString(4));
					c.setRole(rs.getString(5));
					c.setAddress(rs.getString(6));
					c.setQualification(rs.getString(7));
					c.setApprove(rs.getString(8));
					list.add(c);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		/*public Jobs getJobById(int id) {
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
		}*/
}
