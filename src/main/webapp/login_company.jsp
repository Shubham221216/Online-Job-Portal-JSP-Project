<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.DB1.DBConnect1"%>
<%@ page import="com.entity.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Company Login</title>
<%@ include file="all_component/all_css.jsp"%>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	min-height: 110vh;
	background-size: cover;
	background-position: center;
	font-family: "Times New Roman", Times, serif;
}

.wrapper {
	position: relative;
	left: 530px;
	top: 60px;
	width: 460px;
	color: #fff;
	border: 2px solid rgb(174, 169, 169);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	border-radius: 10px;
	padding: 30px;
	height: auto;
}

.wrapper h1 {
	font-size: 23px;
	text-align: center;
	color: black;
}

.wrapper .input-box {
	position: relative;
	width: 100%;
	height: 50px;
	margin: 30px 0;
	border: 1px solid gray;
	border-radius: 4px;
}

.input-box input {
	width: 100%;
	height: 100%;
	background: transparent;
	border: none;
	outline: none;
	border-radius: 40px;
	font-size: 16px;
	color: black;
	padding: 20px 45px 20px 20px;
}

.wrapper .btn {
	width: 100%;
	height: 45px;
	background: black;
	border: none;
	outline: none;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, .1);
	cursor: pointer;
	font-size: 16px;
	color: #fff;
	font-weight: 600;
	margin-bottom: 25px;
}

.wrapper .btn:hover {
	background-color: rgb(42, 42, 42);
}

.wrapper .register-link {
	font-size: 18px;
	text-align: center;
	margin: 20px 0 15px;
	color: black;
}

.register-link p a {
	color: black;
	text-decoration: none;
	font-weight: 600;
}

.register-link p a:hover {
	text-decoration: underline;
}

.cname {
	font-size: 50px;
	color: black;
	position: relative;
	top: 30px;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<h1 style="text-align: center" class="cname ">Company Login</h1>
	<div class="wrapper">

		<form action="login2" method="post">
			<h1>
				Log in to <span style="font-weight: bold"> Job portal</span>
			</h1>
			<c:if test="${not empty succMsg}">
				<h4 class="text-center text-danger">${succMsg}</h4>
				<c:remove var="succMsg" />
			</c:if>
			<div class="input-box">
				<input type="text" required="required" placeholder="Name"
					aria-describedby="emailHelp" name="name">
			</div>

			<div class="input-box">
				<input type="password" required="required" placeholder="Password"
					name="password">
			</div>

			<button type="submit" class="btn">Login</button>

			<div class="register-link">
				<p>
					Don't have an acount?<a href="signup_company.jsp"> Register</a>
				</p>
			</div>
		</form>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>