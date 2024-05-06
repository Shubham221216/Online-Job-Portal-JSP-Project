package com.entity;

public class Jobs {
	
	private int id;
	private String title;
	private String qualification;
    private String description;
    private String category;
    private String status;
    private String location;
    private String pdate;
    private String criteria;
    private String contact;
    private String company;
    private String experience;
    private String Package;
    private String openings;
    private String roles_resposibility;
    private String role;
    private String industry;
    private String department;
    private String employment;
    private String  key_skills;
    private String about_company;
    private String company_address;
    
    
    
	public Jobs() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Jobs(String title,String qualification, String description, String category,
			String status, String location, 
			String pdate,String criteria,String contact,
			String company,String experience,
			String Package,String openings,
			String roles_resposibility,String role,
			String industry,String department,
			String employment,String key_skills,
			String about_company,String company_address ) {
		super();
		this.title = title;
		this.qualification=qualification;
		this.description = description;
		this.category = category;
		this.status = status;
		this.location = location;
		this.pdate = pdate;
		this.criteria=criteria;
		this.contact=contact;
		this.company=company;
		this.experience=experience;
		this.Package=Package;
		this.openings=openings;
		this.roles_resposibility=roles_resposibility;
		this.role=role;
		this.industry=industry;
		this.department=department;
		this.employment=employment;
		this.key_skills=key_skills;
		this.about_company=about_company;
		this.company_address=company_address;
	}
	
//	public Jobs(String title, String description, String category, String status, String location, String pdate,String criteria,String contact,String company) {
//		super();
//		this.title = title;
//		this.description = description;
//		this.category = category;
//		this.status = status;
//		this.location = location;
//		this.pdate = pdate;
//		this.criteria=criteria;
//		this.contact=contact;
//		this.company=company;
//	}


	


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getPdate() {
		return pdate;
	}


	public void setPdate(String pdate) {
		this.pdate = pdate;
	}


	public String getCriteria() {
		return criteria;
	}


	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}


	public String getContact() {
		return contact;
	}


	public void setContact(String contact) {
		this.contact = contact;
	}
	
	
	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}

	
	

	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public String getExperience() {
		return experience;
	}


	public void setExperience(String experience) {
		this.experience = experience;
	}


	public String getPackage() {
		return Package;
	}


	public void setPackage(String package1) {
		Package = package1;
	}


	public String getOpenings() {
		return openings;
	}


	public void setOpenings(String openings) {
		this.openings = openings;
	}


	public String getRoles_resposibility() {
		return roles_resposibility;
	}


	public void setRoles_resposibility(String roles_resposibility) {
		this.roles_resposibility = roles_resposibility;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getIndustry() {
		return industry;
	}


	public void setIndustry(String industry) {
		this.industry = industry;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getEmployment() {
		return employment;
	}


	public void setEmployment(String employment) {
		this.employment = employment;
	}


	public String getKey_skills() {
		return key_skills;
	}


	public void setKey_skills(String key_skills) {
		this.key_skills = key_skills;
	}


	public String getAbout_company() {
		return about_company;
	}


	public void setAbout_company(String about_company) {
		this.about_company = about_company;
	}


	public String getCompany_address() {
		return company_address;
	}


	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	
	
	
	
	
	
	
	
    
    
    
}
