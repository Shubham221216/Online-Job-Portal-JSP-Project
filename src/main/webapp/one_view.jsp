<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="com.entity.Jobs"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jobs Detail</title>
<%@ include file="all_component/all_css.jsp"%>
<style>
/*.contact-container{
    display: flex;
        justify-content: center;
        align-items: flex-start;
    }
    .contact-card{
    	width: 70rem;
        height: 5rem;
        border-radius: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        margin-top:100px;
    }*/
body {
	font-family: "Times New Roman", Times, serif;
	/* Use a stylish font like Poppins */
}

.container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	margin-top: 20px;
}

.card {
	width: 55rem;
	height: auto; /* Height adjusts based on content */
	border-radius: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	margin-bottom: 20px;
	padding: 20px;
}

.job-container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	margin-bottom: 20px;
}

.job-card {
	width: 55rem;
	height: auto; /* Height adjusts based on content */
	border-radius: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.about-company-container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

.about-card {
	width: 55rem;
	height: auto; /* Height adjusts based on content */
	border-radius: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	padding: 20px;
}

.description3 {
	margin: 18px 30px 2px 30px;
	font-weight: bold;
}

.description2 {
	color: rgb(90, 93, 95);
	font-weight: normal;
}

.description {
	margin: 30px;
}

.card-title {
	margin-bottom: 0.5rem;
}

.card-subtitle {
	color: #6c757d; /* Adjust text color as needed */
	margin-bottom: 0.5rem;
}

.card-text {
	font-size: 15px;
	margin-bottom: 0.5rem;
}



</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty user }">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>




	<div class="container">
		<div class="card">
			<%
			int id = Integer.parseInt(request.getParameter("id"));

			jobDAO dao = new jobDAO(DBConnect1.getConn());
			Jobs j = dao.getJobById(id);
			%>
			<div class="card-body">
				<h5 class="card-title"><%=j.getTitle()%>
					-
					<%=j.getQualification()%></h5>

				<h6 class="card-subtitle mb-2 text-body-secondary"
					style="margin-top: 10px;"><%=j.getCompany()%></h6>
				<p class="card-text" style="margin-top: 10px;">
					<img src="img/bag_icon.png" height="15px" width="15px">
					<%=j.getExperience()%>
					<span style="margin-right: 25px;"></span>| <img
						src="img/rupee_symbol3.png" height="15px" width="15px"
						style="margin-left: 30px">
					<%=j.getPackage()%>
				</p>
				<p class="card-text" style="margin-top: 20px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                    <path
							d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6" />
                </svg>
					<%=j.getLocation()%>
				</p>
				<hr>
				<p class="card-text" style="margin-top: 20px;">
					<span style="color: #6c757d;">Posted: </span> <span id="postedDate"><%=j.getPdate()%></span>
					<span style="margin-left: 30px; margin-right: 30px;"> |</span> <span
						style="color: #6c757d;">Openings: </span>
					<%=j.getOpenings()%>

				</p>

				<script>
					// Get the posted date from the HTML
					var postedDate = document.getElementById("postedDate").textContent;

					// Convert the posted date to a JavaScript Date object
					var postedDateObj = new Date(postedDate);

					// Get the current date
					var currentDate = new Date();

					// Calculate the difference in milliseconds between the current date and the posted date
					var timeDifference = currentDate.getTime()
							- postedDateObj.getTime();

					// Convert the time difference from milliseconds to days
					var daysAgo = Math.floor(timeDifference
							/ (1000 * 60 * 60 * 24));

					// Construct the formatted string
					var formattedPostedDate;
					if (daysAgo === 0) {
						formattedPostedDate = "today";
					} else if (daysAgo === 1) {
						formattedPostedDate = "1 day ago";
					} else {
						formattedPostedDate = daysAgo + " days ago";
					}

					// Update the posted date in the HTML
					document.getElementById("postedDate").textContent = formattedPostedDate;
				</script>


			</div>
		</div>


	</div>

	<div class="job-container">
		<div class="job-card card">
			<h5 style="margin: 30px; margin-bottom: -10px; font-weight: bold;"
				class="description">Job Description</h5>
			<p style="margin-left: 30px" class="description"><%=j.getDescription()%></p>
			<h6 class="description"
				style="margin-bottom: -10px; font-weight: bold;">Roles &
				Responsibilities</h6>
			<p class="description"><%=j.getRoles_resposibility()%></p>
			<h6 class="description"
				style="margin-bottom: -10px; font-weight: bold;">Preferred
				Candidate profile</h6>
			<p class="description"><%=j.getCriteria()%></p>
			<h6 class="description3">
				Role: <span class="description2"><%=j.getRole()%></span>
			</h6>
			<h6 class="description3">
				Industry Type: <span class="description2"><%=j.getIndustry()%></span>
			</h6>
			<h6 class="description3">
				Department: <span class="description2"><%=j.getDepartment()%></span>
			</h6>
			<h6 class="description3">
				Employment Time: <span class="description2"><%=j.getEmployment()%></span>
			</h6>
			<h6 class="description3">
				Role Category: <span class="description2"><%=j.getCategory()%></span>
			</h6>
			<h3 class="description"
				style="margin-bottom: 1px; text-align: center;">Key Skills</h3>
			<h5 class="description"
				style="margin-bottom: 10px; text-align: center;"><%=j.getKey_skills()%></h5>

		</div>
	</div>



	

	<div class="about-company-container">
		<div class="about-card card">
			<h5 style="margin-bottom: -5px; font-weight: bold;"
				class="description">About Company</h5>
			<p class="description"><%=j.getAbout_company()%></p>
			<h6 class="description3">
				Address: <span class="description2"><%=j.getCompany_address()%></span>
			</h6>
			<h6 class="description3" style="margin-top: 50px">
				Send your resume at: <a style="color: blue"
					href="mailto:<%=j.getContact()%>" class="description2"><%=j.getContact()%></a>
			</h6>

		</div>
	</div>


	<!--    
<div class="contact-container">
<div class="contact-card">
</div>
</div>-->


</body>
</html>