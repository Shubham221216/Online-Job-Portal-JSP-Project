<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Jobs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User : Jobs</title>

<%@ include file="all_component/all_css.jsp"%>
<style>
body {
	font-family: "Times New Roman", Times, serif;
	/* Use a stylish font like Poppins */
	background: url("img/job4.jpg");
	width: 100%;
	height: 90vh;
	backgroung-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
}
</style>

</head>
<body style="background-color: #f0f1f2;">

	<!--  -->
	<c:if test="${empty user and empty admin }">
		<c:redirect url="login.jsp" />
	</c:if>

	<c:if test="${company.role eq 'company'}">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center text-primary">All Jobs</h1>

				<!--  -->
				<c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg" />
				</c:if>


				<div class="card"
					style="border-radius: 10px; border: 1px solid; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
					<%-- <c:if test="${admin.role ne 'admin' }"> --%>
					<div class="card-body">
					
						<form class="form-inline" action="more_view.jsp" method="get">
							
								
							
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose...</option>
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

							<div class="form-group col-md-5">
								<select class="custom-select" name="cat"
									id="inlineFormCustomSelectPref">
									<option value="ca" selected>Choose...</option>
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
							<button class="btn btn-success">Submit</button>
						</form>
						
					</div>
					<%-- </c:if> --%>
				</div>
				
				<%
				jobDAO dao = new jobDAO(DBConnect1.getConn());
				List<Jobs> list = dao.getAllJobsForUser();
				for (Jobs j : list) {
				%>

				<div class="card mt-2"
					style="border-radius: 10px; border: 1px solid; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h5>
							Company:
							<%=j.getCompany()%></h5>

						<h6>
							Title:
							<%=j.getTitle()%></h6>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p>
							Description:
							<%=j.getDescription()%>.
						</p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>

						<%
						if (j.getCriteria().length() > 0 && j.getCriteria().length() < 120) {
						%>
						<p>
							Criteria:
							<%=j.getCriteria()%>.
						</p>
						<%
						} else {
						%>
						<p><%=j.getCriteria().substring(0, 120)%>...
						</p>
						<%
						}
						%>

						<br>
						<div class="form-row">
							<div class=" form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>

							<div class=" form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
						</div>
						<!--  <h6>
							Posted:
						<span id="postedDate"> <%=j.getPdate().toString()%> </span>	
							</h6>-->
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>