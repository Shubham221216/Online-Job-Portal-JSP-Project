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
<%@ include file="all_component/all_css.jsp"%>
<style>
body{
    font-family: "Times New Roman", Times, serif;/* Use a stylish font like Poppins */
}
</style>
</head>
<body style="background-color: #f0f1f2; ">

	<c:if test="${user.role ne 'admin'}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>

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
					<form action="add_job" method="post">
					
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required class="form-control">
						</div>

						<div class="form-group">
							<label>Company Name</label><input type="text" name="company" 
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

						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="10" cols="" name="desc"
								class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label>Eligibility Criteria</label>
							<textarea required rows="10" cols="" name="criteria"
								class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label>Contact</label><input type="text" name="contact" required
								class="form-control">
						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>