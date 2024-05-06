<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<%@ page import="com.servlet.RegisterServlet" %>
<%@ page import="com.dao.*" %>

<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile Page</title>
    <%@ include file="all_component/all_css.jsp"%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
    <style>
body{
    font-family: "Times New Roman", Times, serif;/* Use a stylish font like Poppins */
}

.card-body {
	border: 2px solid rgb(174, 169, 169);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	padding: 30px;
	
}

.showpass {
	position: relative;
	left: 93%;
	bottom: 5px;
	right: 3px;
	font-size: 20px;
	
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

.btn:hover {
	background-color: rgb(42, 42, 42);
}
</style>
</head>
<body style="background-color: #f7f7f7;">
    <c:if test="${empty user }">
	<c:redirect url="login.jsp"/>
	</c:if>

    <%@ include file="all_component/navbar.jsp"%>

    <div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Edit Profile</h5>
						</div>
                        <form action="update_profile" method="post">

                            <input type="hidden" name="id" value="${user.id}">

                            <div class="form-group">
                                <label>Enter Full Name</label><input type="text"
                                required="required" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp"
                                name="name" value="${user.name}">
                            </div>

                            <div class="form-group">
                                <label>Enter Qualification</label><input type="text"
                                required="required" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp"
                                name="qua" value="${user.qualification}">
                            </div>

                            <div class="form-group">
                                <label>Enter Email</label><input type="email"
                                required="required" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp"
                                name="email" value="${user.email}">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Enter Password</label><input
                                required="required" type="password" class="form-control exampleInputPassword1"
                                id="exampleInputPassword1"
                                style="margin-bottom:-30px;"
                                name="ps" value="${user.password}">
                                <a onclick="ShowPass" class="showpass"><i
									class='bx bx-lock-alt' onclick="ShowPass()"
									style="color: black; cursor: pointer;"></i></a>
                            </div>
                            
                            <!--  <div class="form-group">
								<label class="label">Select Gender</label> <select name="gender"
									class="custom-select" required>
									<option value="" disabled selected>Select gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>-->
                                                        
                            <div class="form-group">
                                <label>Enter Address</label><input type="text"
                                required="required" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp"
                                name="address" value="${user.address}">
                            </div>

                            <button type="submit" class="btn btn2 btn-primary badge-pill btn-block">Update</button>
                            <a class="btn btn2 btn-primary badge-pill btn-block" style="color:white;" href="home.jsp">Back</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>                
    </div>
    <div style="margin-top: 50px;">
        <%@include file="all_component/footer.jsp"%>
    </div>
    
    
    <script>
	function ShowPass() {
		var x = document.getElementsByClassName("exampleInputPassword1");
		for (var i = 0; i < x.length; i++) {
			if (x[i].type === "password") {
				x[i].type = "text";
			} else {
				x[i].type = "password";
			}
		}
	}
	
</script>
    
</body>
</html>