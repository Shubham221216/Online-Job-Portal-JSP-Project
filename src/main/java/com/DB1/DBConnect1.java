package com.DB1;

import java.sql.*;

public class DBConnect1 {
	private static Connection conn;
	public static Connection getConn() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","Naruto@123");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
}
