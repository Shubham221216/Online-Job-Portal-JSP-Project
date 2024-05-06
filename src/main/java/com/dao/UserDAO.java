package com.dao;

import java.sql.*;

import com.entity.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User u)
	{
		boolean f= false;
		
		try
		{
			String sql ="insert into user (name,qualification,email,password,role,address,gender) values (?,?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, "user");
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getGender());
			
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
	
	public User login(String em,String psw)
	{
		User u = null;
		
		try
		{
			String sql="select * from user where name=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setQualification(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setRole(rs.getString(6));
				u.setAddress(rs.getString(7));
				u.setGender(rs.getString(8));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return u;
		
	}
	
	public boolean updateUser(User u)
	{
		boolean f=false;
		
		try {
			String sql="update user set name=?, qualification=?, email=?, password=?, address=?, gender=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getAddress());
			ps.setString(6, u.getGender());
			ps.setInt(7, u.getId());
			
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
}
