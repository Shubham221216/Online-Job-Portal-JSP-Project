<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

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

.card-body {
	border: 2px solid rgb(174, 169, 169);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	padding: 30px
}

.showpass {
	position: relative;
	left: 93%;
	bottom: 2px;
	right: 3px;
	font-size: 20px;
}

h1 {
	font-size: 25px;
	text-align: center;
	color: black;
}

.cname {
	font-size: 50px;
	color: black;
	position: relative;
	top: 30px;
}

.register-link {
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

.btn2 {
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
.showpass i:hover{
cursor:pointer;
}
</style>
<script>
	function ShowPass() {
		var x = document.getElementsByClassName("passwordshow");
		for (var i = 0; i < x.length; i++) {
			if (x[i].type === "password") {
				x[i].type = "text";
			} else {
				x[i].type = "password";
			}
		}
	}

	function validatePassword() {
	    var passwordField = document.getElementById("exampleInputPassword1");
	    var password = passwordField.value;
	    var passwordValidationMsg = document.getElementById("passwordValidationMsg");
	    var registerButton = document.getElementById("registerButton");

	    // Define a regular expression pattern to match the required conditions
	    var passwordPattern = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*()_+={}[\]:;"'<>,.?\\/]).{8,}$/;

	    // Check if the password matches the pattern
	    if (!passwordPattern.test(password)) {
	        passwordValidationMsg.innerHTML = "Password must be at least 8 characters long and upto 13 characters and include at least one uppercase letter and one special character (!@#$%^&*()_+={}[]:;\"'<>,.?\\/).";
	        passwordField.classList.add("is-invalid");
	        passwordField.classList.remove("is-valid");
	        registerButton.disabled = true; // Disable the "Register" button
	    } else {
	        // Truncate the password if it exceeds 13 characters
	        if (password.length > 13) {
	            passwordField.value = password.substring(0, 13);
	        }
	        passwordValidationMsg.innerHTML = "";
	        passwordField.classList.remove("is-invalid");
	        passwordField.classList.add("is-valid");
	        registerButton.disabled = false; // Enable the "Register" button
	    }
	}

</script>

</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<h1 style="text-align: center" class="cname ">Company Registration</h1>
	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card"
					style="box-shadow: 0 0 10px rgba(0, 0, 0, .2); border-radius: 10px; border: 1px solid rgb(174, 169, 169);">

					<div class="card-body" style="width: 460px;">
						<div class="text-center">

							<h1>
								Sign up to <span style="font-weight: bold"> Job portal</span>
							</h1>
						</div>
						<!-- Name -->
						<form action="OTPValidation2.jsp" method="post">
							<div class="form-group"
								style="width: 100%; height: 39.5px; margin: 30px 0; border: 1px solid gray; border-radius: 4px;">
								<!-- <label> Enter Company Name</label> -->
								<input type="text" required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="name" placeholder="Companyname">
							</div>
							<!-- Email -->
							<div class="form-group"
								style="width: 100%; height: 39px; margin: 30px 0; border: 1px solid gray; border-radius: 4px;">
								<!-- <label> Enter Email</label> -->
								<input type="email" required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email" placeholder="Email">
							</div>

							<!-- Password -->
							<div class="form-group"
								style="width: 100%; , min-height: 200px; max-height: 200px; border: 1px solid gray; border-radius: 4px;">
								<!-- <label> Enter Password</label>  -->
								<input required="required" type="password"
									class="form-control input-box passwordshow" id="exampleInputPassword1"
									style="margin-bottom: -30px;" name="ps"
									onkeyup="validatePassword()" placeholder="Password"> <a
									onclick="ShowPass" class="showpass"><i
									class='bx bx-lock-alt' onclick="ShowPass()"></i></a>
								<div id="passwordValidationMsg"></div>
							</div>

							<!-- Website -->
							<div class="form-group"
								style="width: 100%; height: 39px; margin: 30px 0; border: 1px solid gray; border-radius: 4px;">
								<!-- 	<label> Enter Company Website</label> -->
								<input type="text" required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="website" placeholder="Website">
							</div>

							<!-- Address -->
							<div class="form-group"
								style="width: 100%; height: 39px; margin: 30px 0; border: 1px solid gray; border-radius: 4px;">
								<!-- <label> Enter Address</label> -->
								<input type="text" required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="address" placeholder="Address">
							</div>

							<button type="submit" id="registerButton"
								style="background-color: black; color: white; margin-bottom: 50px; font-weight:bold;
	/* Regular state */ border: 1px solid black; transition: background-color 0.3s, border-color 0.3s;"
								onmouseover="this.style.backgroundColor='rgb(42, 42, 42)'; this.style.borderColor='gray'"
								onmouseout="this.style.backgroundColor='black'; this.style.borderColor='black'"
								class="btn btn2 badge-pill btn-block" disabled>Next</button>


							<div class="register-link">
								<p>
									Already have an acount?<a href="login_company.jsp">Login here</a>
								</p>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
