<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Jobs"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.jobDAO"%>
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
body{
width:100%;
height:90vh;
backgroung-repeat:no-repeat;
background-size:cover;
background-attachment:fixed;
font-family: "Times New Roman", Times, serif;/* Use a stylish font like Poppins */

}

.wrapper{
display:flex;
justify-content:center;
align-items:center;
height:auto;

}
.error-container {
            text-align: center;
            margin-top: 50px;
            
            border-radius:10px;
            height:250px;
            width:500px;
        }

        .error-message {
            font-size: 50px;
            
            
        }

        .sub-message {
            margin-top: 20px;
            font-size: 20px;
            display: block;
        }

       .post-job-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 20px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .post-job-button::before,
        .post-job-button::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background-color: rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            border-radius: 20px;
            z-index: -1;
        }

        .post-job-button::after {
            background-color: rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            top: 3px;
            left: 3px;
        }

        .post-job-button:hover::before {
            top: -3px;
            left: -3px;
        }

        .post-job-button:hover::after {
            top: 0;
            left: 0;
        }
        
        

</style>
</head>
<body>

	<c:if test="${empty user }">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msg = "";

				jobDAO dao = new jobDAO(DBConnect1.getConn());

				List<Jobs> list = null;

				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "Job Not Available";

				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobsORLocationAndCate(cat, loc);
				} else {
					list = dao.getJobsAndLocationAndCate(cat, loc);
				}
				
				if (list.isEmpty()) {
				%>
			
    <div class="wrapper">
    <div class="error-container">
    <div class="error-message">OOPS!
        <span class="sub-message">No Jobs for this Location or Category</span>
    </div>
    <div style="text-align: center; margin-top: 50px;">
    <a href="home.jsp" class="post-job-button">Browse more Jobs</a>
</div>
</div>
    </div>




				<%
				}

				if (list != null) {
				for (Jobs j : list) {
				%>

<style>

body{
background:url("img/job4.jpg");
width:100%;
height:90vh;
backgroung-repeat:no-repeat;
background-size:cover;
background-attachment:fixed;
}

</style>

				<div class="card mt-2" style="border-radius: 10px; border: 1px solid; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						
						<h5>
						Company:
						<%=j.getCompany()%>
						</h5>
						
						<h6>
							Title:
							<%=j.getTitle()%></h6>


						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120 ) {
						%>
						<p>Description:<%=j.getDescription()%>.
						</p>
						<%
						} else {
						%>
						<p>Description:<%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>
						
						<%
						if (j.getCriteria().length() > 0 && j.getCriteria().length() < 120 ) {
						%>
						<p>Criteria:<%=j.getCriteria()%>.
						</p>
						<%
						} else {
						%>
						<p>Criteria:<%=j.getCriteria().substring(0, 120)%>...
						</p>
						<%
						}
						%>
						<br>

						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
						</div>

						
						<br>
						<!--
						<h5>
							Send your Resume at: <a href="mailto:<%=j.getContact()%>"
								target="_blank" rel="noopener noreferrer"><%=j.getContact()%></a>
						</h5>
-->


						
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a>
						</div>

					</div>
				</div>
				<%
				}
				} else {
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>
			</div>
		</div>
	</div>




</body>
</html>