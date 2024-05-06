package com.entity;

public class Company {

	 private int id;
	 private String name;
     private String email;
     private String password;
     private String role;
     private String address; 
     
     //qualification=website
     private String qualification;
     private String approve;
     
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Company(String name, String email, String password,String role,String address,String qualification,String approve) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.address=address;
		this.qualification=qualification;
		this.approve=approve;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public String getApprove() {
		return approve;
	}


	public void setApprove(String approve) {
		this.approve = approve;
	}
	
	
	
}
