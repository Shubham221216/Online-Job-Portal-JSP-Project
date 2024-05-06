<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.User"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Jobs</title>
<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Jobs"%>
<%@ include file="all_component/all_css.jsp"%>
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

}</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${user.role ne 'admin' and company.role ne 'company'}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	
	<% String companyName = (String) session.getAttribute("companyName"); 
	   /* String address= (String) session.getAttribute("address"); */
	%>
	
	<div class="container p-2">
		<div class="col-md offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>

						<c:if test="${not empty succMsg}">
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>
						
					<h5>Add Jobs</h5>
						
					</div>
					<form action="add_job2" method="post">

						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required class="form-control">
						</div>

						<div class="form-group">
							<label>Company Name</label><input type="text" name="company"
								required class="form-control"  value="<%= companyName %>" readonly>
						</div>

						<div class="form-group">
							<label>Qualification</label><input type="text"
								name="qualification" required class="form-control">
						</div>

						<div class="form-group">
							<label>Experience</label><input type="text" name="experience"
								required class="form-control">
						</div>

						<div class="form-group">
							<label>Package</label><input type="text" name="Package" required
								class="form-control">
						</div>

						<div class="form-group">
							<label>Openings</label><input type="text" name="openings"
								required class="form-control">
						</div>

						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlieFormCustomSelectPref">
									<option selected>Choose...</option>
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
									<option selected>Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Tester">Tester</option>
									<option value="Banking">Banking</option>
									<option value="Teacher">Teacher</option>
									<option value="Chartered-Accountant">Chartered-Accountant</option>
									<option value="Engineer">Engineer</option>
									<option value="Back-end">Back-end</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

					<!-- 	<c:if test="${ user.role eq 'company'}">
							<div class="form-group">
								<div class="form-group">
									<label> Company Website</label><input type="text"
										name="website" required class="form-control">
								</div>
						</c:if>
 -->
						<div class="form-group">
							<label>Enter Job Description</label>
							<textarea required rows="10" cols="" name="desc"
								class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label>Roles & Responsibilities</label>
							<textarea required rows="10" cols="" name="roles_resposibility"
								class="form-control"></textarea>
						</div>



						<div class="form-group">
							<label>Eligibility Criteria</label>
							<textarea required rows="10" cols="" name="criteria"
								class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label>Role</label><input type="text" name="role" required
								class="form-control">
						</div>

						<div class="form-group">
							<label>Industry</label><input type="text" name="industry"
								required class="form-control">
						</div>

						<div class="form-group">
							<label>Department</label><input type="text" name="department"
								required class="form-control">
						</div>

						<div class="form-group">
							<label>Employment Time</label><input type="text"
								name="employment" required class="form-control">
						</div>



						<div class="form-group">
							<label>Key Skills</label><input type="text" name="key_skills"
								required class="form-control">
						</div>

						<div class="form-group">
							<label>About Company</label><input type="text"
								name="about_company" required class="form-control">
						</div>

						<div class="form-group">
							<label>Address</label><input type="text" name="company_address"
								required class="form-control" >
						</div>

						<div class="form-group">
							<label>Contact</label><input type="text" name="contact" required
								class="form-control" >
						</div>
						<button class="btn btn2 btn-success">Publish Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>