<%@ page language="java" import="com.service.EmailService" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
<%@ include file="all_component/all_css.jsp"%>

<style>

*{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
       
        }

        body{
            min-height: 110vh; 
            background-size: cover;
            background-position: center;
            font-family: "Times New Roman", Times, serif;

        }
.text-center h1{
            font-size: 23px;
            text-align: center;
            color: black;
        }
        
        .btn2{
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
        .btn2:hover{
            background-color: rgb(42, 42, 42);
        }
        
        input{
    
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
</style>
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="all_component/navbar.jsp"%>
<h1 style="text-align:center; margin-top:20px;" class="cname " >Company Registration</h1>
<div class="container-fluid" style="margin-top: 50px;">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card" style="box-shadow: 0 0 10px rgba(0, 0, 0, .2); border-radius: 10px; border: 1px solid rgb(174, 169, 169);">
					<div class="card-body" style="width: 460px;">
						<div class="text-center">
							<h1>
								Sign up to <span style="font-weight: bold"> Job portal</span>
							</h1>
						</div>
						
						<%
				
                        session = request.getSession(false);
                        String email = (String)session.getAttribute("CEmail");
                        String mode = (String)session.getAttribute("CMode");
                                
                        if(email != null && mode.equals("self")){
                            email = (String)session.getAttribute("CEmail");
                        
                        }else{
                        	String Cname = request.getParameter("name");
                        	email = request.getParameter("email");
                        	String password = request.getParameter("ps");
    						String website = request.getParameter("website");
    						String address = request.getParameter("address");
    						
                        
    						session.setAttribute("CName", Cname);
    						session.setAttribute("CEmail", email);
    						session.setAttribute("CPassword", password);
    						session.setAttribute("website", website);
    						session.setAttribute("CAddress", address);
                            session.setAttribute("CMode","self");
                            session.setAttribute("CApprove", "False");

                            String genOTP = EmailService.getOTP();
                            boolean f = EmailService.sendOTP(email,genOTP);
                            if(f) {   
                                session.setAttribute("succMsg","OTP Send Successfully");
                                session.setAttribute("genOTP",genOTP);
                                response.sendRedirect("OTPValidation2.jsp");
                            }else {
                                session.setAttribute("succMsg","Somthing went wrong! Please try again");
                                response.sendRedirect("OTPValidation2.jsp");
                            }
                        }
                       
						
						
						%>
						
						<c:if test="${not empty succMsg}">
	                        <h4 class="text-center text-success">${succMsg}</h4>
	                        <c:remove var="succMsg" />
                    	</c:if>

						<form action="add_company" method="post">
						<div class="form-group">
								<label> Your Email </label> <input type="email"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email" value="<%= email %>" readonly>
							</div>
							<div class="form-group">
								<label> Enter OTP </label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="COTP" >
							</div>


							<button type="submit"
								class="btn btn2 btn-primary badge-pill btn-block">Register</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>