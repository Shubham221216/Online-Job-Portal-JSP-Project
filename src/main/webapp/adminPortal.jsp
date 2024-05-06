<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Login</title>
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

.input-box i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 25px;
	color: black;
	cursor: pointer;
	transition: box-shadow 0.3s ease-in-out;
	outline: none; /* Remove outline for all states */
}

.input-box i:hover, .input-box i:focus { /* Remove outline on focus */
	outline: none;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.5), /* Outer glow */
                0 0 10px rgba(0, 0, 0, 0.5); /* Inner glow */
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
	margin-bottom: 30px;
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

	<h1 style="text-align: center" class="cname ">Admin Login</h1>
	<div class="wrapper">
		<form action="loginadmin" method="post">
			<h1>
				Log in to <span style="font-weight: bold"> Job portal</span>
			</h1>
			<c:if test="${not empty succMsg}">
				<h4 class="text-center" style="color: red">${succMsg}</h4>
				<c:remove var="succMsg" />
			</c:if>
			<div class="input-box">
				<input type="text" required="required" placeholder="Name"
					aria-describedby="emailHelp" name="name"> <i
					class='bx bxs-user'></i>
			</div>

			<div class="input-box">
				<input required="required" type="password" placeholder="Password"
					name="password" id="myInput"> <a onclick="ShowPass"
					class="showpass"><i class='bx bx-lock-alt' onclick="ShowPass()"></i></a>
			</div>



			<button type="submit" class="btn">Login</button>

			<!-- <div class="register-link">
                <p>Don't have an acount?<a href="signup.jsp">Register here</a></p>
                <h5 ><a href="login_company.jsp" style="color:green;">Login As Company</a></h5>
            </div> -->
		</form>
	</div>


</body>
</html>