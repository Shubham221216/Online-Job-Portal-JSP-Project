<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<%@ include file="all_component/all_css.jsp"%>

<style>
</style>
</head>
<body>

	<c:if test="${ admin.role ne 'admin'}">
		<c:redirect url="login_company.jsp" />
	</c:if>
	
	
	<%@ include file="all_component/navbar.jsp"%>













	<%@ include file="all_component/footer.jsp"%>
</body>
</html>