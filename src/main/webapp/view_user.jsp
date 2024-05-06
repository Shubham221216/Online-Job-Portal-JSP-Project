<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: View User</title>
<%@ include file="all_component/all_css.jsp"%>

<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Jobs"%>

<style>


body{
    font-family: "Times New Roman", Times, serif;/* Use a stylish font like Poppins */
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
	width: 25%;
}

th:nth-child(2), td:nth-child(2) {
	width: 25%;
}

th:nth-child(3), td:nth-child(3) {
	width: 25%;
}

th:nth-child(4), td:nth-child(4) {
	width: 20%;
}

.mail:hover{
color:white;



}


</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${admin.role ne 'admin' }">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	<table class="table table-dark">
		<thead>
			<tr>
				
				<th scope="col">Name</th>
				<th scope="col">Qualification</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>

			</tr>
		</thead>
		<tbody>
			<%
			jobDAO dao = new jobDAO(DBConnect1.getConn());
			List<User> list = dao.getAllUser();

			for (User u : list) {
			%>
			<tr>
				
				<td><%=u.getName()%></td>
				<td><%=u.getQualification()%></td>
				<td><a class="mail" href="mailto:<%=u.getEmail()%>" ><%=u.getEmail()%></a></td>
				<td><%=u.getAddress()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>
