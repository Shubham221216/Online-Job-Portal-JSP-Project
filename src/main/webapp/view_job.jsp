<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>



<%@ page import="com.entity.User"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: View Jobs</title>
<%@ include file="all_component/all_css.jsp"%>

<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Jobs"%>

    <style>
   
body{
    font-family: "Times New Roman", Times, serif;/* Use a stylish font like Poppins */
}
	    .container{
	    	margin-top:50px;
	    	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	    	 padding-bottom: 20px;
	    
	    }
        .error-container {
            text-align: center;
            margin-top: 50px;
           /*  background-color: rgb(73, 149, 219); */
             background-color: rgb(27, 78, 123);
            
        }

        .error-message {
            font-size: 50px;
            color:white;
            
            
        }

        .sub-message {
            margin-top: 20px;
            font-size: 20px;
            display: block;
            color:white;
        }

        .sections-container {
            display: flex;
            justify-content: space-between;
            margin-top: 50px;
        }

        .section {
            flex: 1;
            text-align: center;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 5px;
            position: relative;
            margin-right: 10px;
        }

        .number {
            position: absolute;
            top: -30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: green;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 20px;
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
<body style="background-color: #f0f1f2;">

	<c:if test="${company.role ne 'company' and admin.role ne 'admin'}">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@ include file="all_component/navbar.jsp"%>


	<div class="container ">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<c:if test="${not empty succMsg}">
					<div class="alert alert-success" role="alert">${succMsg}</div>
					<c:remove var="succMsg" />
				</c:if>


				<%
				// Assuming companyName is stored in the session
				String companyName = (String) session.getAttribute("companyName");

				jobDAO dao = new jobDAO(DBConnect1.getConn());
				List<Jobs> list = dao.getAllJobs2(companyName);
				if (list.isEmpty()) {
					
					%>
					
		<div class="empty-container">
    <div class="error-container">
    <div class="error-message">OOPS!
        <span class="sub-message">You have not made any job post yet.</span>
    </div>
</div>

<div class="sections-container">
    <div class="section">
        <div class="number">1</div>
        <h2>Go to Post Job</h2>
    </div>
    <div class="section">
        <div class="number">2</div>
        <h2>Enter Job Details</h2>
    </div>
    <div class="section">
        <div class="number">3</div>
        <h2>Post a Job</h2>
    </div>
</div>

<div style="text-align: center; margin-top: 50px;">
    <a href="add_job2.jsp" class="post-job-button">Post Job</a>
</div>
</div>
					<%
					}
				for (Jobs j : list) {
				%>
				


				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h5>
							Company:
							<%=j.getCompany()%>
						</h5>

						<h5>
							Title:
							<%=j.getTitle()%></h5>
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
						%>						<p>
							Contact:
							<%=j.getContact()%></p>
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

							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>
						<h6 id="publishDate"></h6>

<script>
    // Get the publish date from the server-side code
    var publishDate = "<%=j.getPdate()%>";

    // Convert the publish date string to a JavaScript Date object
    var date = new Date(publishDate);

    // Get the current date
    var currentDate = new Date();

    // Calculate the time difference in milliseconds
    var timeDifference = currentDate - date;

    // Convert the time difference to days
    var daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));

    // Construct the formatted string
    var formattedDate;
    if (daysDifference === 0) {
        formattedDate = "Posted: today";
    } else if (daysDifference === 1) {
        formattedDate = "Posted: 1 day ago";
    } else {
        formattedDate = "Posted: " + daysDifference + " days ago";
    }

    // Update the content of the h6 element with the formatted date
    document.getElementById("publishDate").textContent = formattedDate;
</script>

						<div class="text-center">
							<a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
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