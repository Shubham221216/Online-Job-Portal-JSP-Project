<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approved Company</title>
<%@ include file="all_component/all_css.jsp"%>

<%@ page import="com.dao.companyDAO"%>
<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Company"%>

<style>
body {
	font-family: "Times New Roman", Times, serif;
	/* Use a stylish font like Poppins */
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

/* Set fixed width for each column */
th:first-child, td:first-child {
	width: 10%;
}

th:nth-child(2), td:nth-child(2) {
	width: 20%;
}

th:nth-child(3), td:nth-child(3) {
	width: 20%;
}

th:nth-child(4), td:nth-child(4) {
	width: 20%;
}

th:nth-child(5), td:nth-child(5) {
	width: 15%;
}

th:nth-child(6), td:nth-child(6) {
	width: 15%;
}
</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${admin.role ne 'admin' }">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<table class="table table-dark">
		<thead>
			<tr>
				<!--<th scope="col">Id</th>-->
				<th scope="col" style="margin-left: 50px;">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Website</th>
				<th scope="col">Address</th>
				<th scope="col" style="padding-left: 20px">Approve</th>

			</tr>
		</thead>
		<tbody>
			<%
			
			companyDAO dao = new companyDAO(DBConnect1.getConn());
			List<Company> list = dao.getAllApprovedCompany();
			for (Company c : list) {
			%>
			<tr>
				<td><%=c.getName()%></td>
				<td><%=c.getEmail()%></td>
				<td><a href="<%=c.getQualification()%>" target="_blank"><%=c.getQualification()%></a></td>
				<td><%=c.getAddress()%></td>
				<td>
            <form action="approve" method="post">
                <input type="hidden" name="id" value="<%=c.getId()%>">
                <%-- <% if ("True".equals(c.getApprove())) { %>
                    <button type="submit" name="approve" value="True" class="btn btn-sm bg-danger text-white" disabled>Approved</button>
                <% } else { %>
                    <button type="submit" name="approve" value="True" class="btn btn-sm bg-success text-white">Approve</button>
                <% } %> --%>
                
                
                 <% if ("False".equals(c.getApprove())) { %>
                    <button type="submit" name="approve" value="False" class="btn btn-sm bg-danger text-white" hidden>Disapproved</button>
                <% } else { %>
                    <button type="submit" name="approve" value="False" class="btn btn-sm bg-danger text-white">Disapprove</button>
                <% } %> 
            
            </form>
        </td>
       
			</tr>
			<%
			}
			%>
		</tbody>

	</table>
<c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg" />
	</c:if>
</body>
</html>
