<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<%@ page import="com.entity.User" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
<%@ include file="all_component/all_css.jsp"%>

<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Jobs"%>
<style>
body{
    font-family: "Times New Roman", Times, serif;/* Use a stylish font like Poppins */
}

.btn2{
width:25%;
font-size:25px;
position:relative;
left:38%;
margin-top:10px;

}
</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${user.role ne 'admin' and company.role ne 'company'}">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@ include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						jobDAO dao = new jobDAO(DBConnect1.getConn());
						Jobs j = dao.getJobById(id);
						%>


						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">

						<input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>">
						</div>
						
						<div class="form-group">
							<label>Enter Company</label><input type="text" name="company"
								required class="form-control" value="<%=j.getCompany()%>" readonly>
						</div>
						
						<div class="form-group">
							<label>Enter Qualification</label><input type="text" name="qualification"
								required class="form-control" value="<%=j.getQualification()%>">
						</div>
						
						<div class="form-group">
							<label>Enter Experience</label><input type="text" name="experience"
								required class="form-control" value="<%=j.getExperience()%>">
						</div>
						
						<div class="form-group">
							<label>Enter Package</label><input type="text" name="Package"
								required class="form-control" value="<%=j.getPackage()%>">
						</div>
						
						
						<div class="form-group">
							<label>Enter Openings</label><input type="text" name="openings"
								required class="form-control" value="<%=j.getOpenings()%>">
						</div>
						

						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlieFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="Odisha">Odisha</option>
									<option value="Banglore">Bangalore</option>
									<option value="Pune">Pune</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Hydrebad">Hydrebad</option>
									<option value="Delhi">Delhi</option>
									<option value="Chennai">Chennai</option>
									<option value="Gujarat">Gujarat</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inlieFormCustomSelectPref" name="category">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Developer">Tester</option>
									<option value="Banking">Banking</option>
									<option value="Teacher">Teacher</option>
									<option value="Chartered-Accountant">Chartered-Accountant</option>
									<option value="Engineer">Engineer</option>
									<option value="Back-end">Back-end</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>

									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Enter Job Description</label>
							<textarea required rows="10" cols="" name="desc"
								class="form-control"><%=j.getDescription()%></textarea>
						</div>
						
						<div class="form-group">
							<label>Roles & Responsibilities</label>
							<textarea required rows="10" cols="" name="roles_resposibility"
								class="form-control"><%=j.getRoles_resposibility()%></textarea>
						</div>

						<div class="form-group">
							<label>Eligibility Criteria</label>
							<textarea required rows="10" cols="" name="criteria"
								class="form-control"><%=j.getCriteria()%></textarea>
						</div>
						
						<div class="form-group">
							<label>Role</label>
							<input required name="role"
								class="form-control" value="<%=j.getRole()%>">
						</div>
						
						<div class="form-group">
							<label>Industry</label>
							<input required  name="industry"
								class="form-control" value="<%=j.getIndustry()%>">
						</div>
						
						<div class="form-group">
							<label>Department</label>
							<input required  name="department"
								class="form-control"value="<%=j.getDepartment()%>">
						</div>
						
						<div class="form-group">
							<label>Employment Time</label>
							<input required  name="employment"
								class="form-control" value="<%=j.getEmployment()%>">
						</div>
						
						<div class="form-group">
							<label>Key Skills</label>
							<textarea required name="key_skills"
								class="form-control"><%=j.getKey_skills()%></textarea>
						</div>
						
						<div class="form-group">
							<label>About Company</label>
							<textarea required rows="10" cols="" name="about_company"
								class="form-control"><%=j.getAbout_company()%></textarea>
						</div>
						
						<div class="form-group">
							<label>Address</label>
							<textarea required  name="company_address"
								class="form-control"><%=j.getCompany_address()%></textarea>
						</div>
				
						
						<div class="form-group">
							<label>Contact</label><input type="text" name="contact"
								required class="form-control" value="<%=j.getContact()%>">
						</div>

						<button class="btn btn2 btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>