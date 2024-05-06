<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.*"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" style="color: white; cursor: pointer;">Job
		Portal</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<c:if test="${company.role eq 'company' }">
				<li class="nav-item active"><a class="nav-link"
					href="admin.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
			</c:if>
			<c:if test="${user.role eq 'user' }">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
			</c:if>

			<c:if test="${admin.role eq 'admin' }">
				<li class="nav-item active"><a class="nav-link"
					href="adminDashboard.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
			</c:if>


			<c:if
				test="${user.role ne 'user' and company.role ne 'company' and admin.role ne 'admin' }">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
			</c:if>
			<%-- <c:if test="${user.role ne 'user' and company.role ne 'company' }">
			<li class="nav-item active"><a class="nav-link" style="margin-left:10px;" href="#about-website">about us
					<span class="sr-only">(current)</span>
			</a></li>
</c:if>
		 --%>

			<c:if test="${company.role eq 'company'}">
				<li class="nav-item mx-2"><a class="nav-link"
					href="add_job2.jsp"><i class="fa fa-plus-circle mr-1"></i>Post
						Job</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="view_job.jsp"><i class="fas fa-eye mr-1"></i>View Job</a></li>
				<!-- <li class="nav-item mx-2"><a class="nav-link"
					href="view_user.jsp"><i class="fas fa-user mr-1"></i>View User</a></li>
 -->

			</c:if>


			<c:if test="${admin.role eq 'admin'}">
				<li class="nav-item mx-2"><a class="nav-link"
					href="view_user.jsp"><i class="fa fa-plus-circle mr-1"></i>View
						Users</a></li>
				<li class="nav-item mx-2"><a class="nav-link" href="home.jsp"><i
						class="fas fa-eye mr-1"></i>View Jobs</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="view_company.jsp"><i class="fas fa-user mr-1"></i>View
						Company</a></li>

				<li class="nav-item mx-2"><a class="nav-link"
					href="approved_company.jsp"><i class="fas fa-user mr-1"></i>Approved
						Company</a></li>

				<li class="nav-item mx-2"><a class="nav-link"
					href="disapproved_company.jsp"><i class="fas fa-user mr-1"></i>Disapproved
						Company</a></li>


			</c:if>



		</ul>
		<form class="form-inline my-2 my-lg-0">



			<c:if test="${company.role eq 'company'}">
				<a href="#" class="btn btn-light mr-1" data-toggle="modal"
					data-target="#examplemodal"> <i class="fa-regular fa-user mr-1"></i>
					${sessionScope.companyName}
				</a>
				<a href="logout" class="btn btn-light"> <i
					class="fas fa-sign-in-alt mr-1"></i> Logout
				</a>
			</c:if>

			<c:if test="${admin.role eq 'admin' }">
				<a href="#" class="btn btn-light mr-1" data-toggle="modal"><i
					class="fa-regular fa-user mr-1"></i>Admin </a>

				<a href="logout" class="btn btn-light"><i
					class=" fas fa-sign-in-alt mr-1"></i>Logout</a>
			</c:if>

			<c:if test="${user.role eq 'user' }">

				<a href="#" class="btn btn-light mr-1" data-toggle="modal"
					data-target="#exampleModal2"></i>Upload Resume </a>
				<a href="#" class="btn btn-light mr-1" data-toggle="modal"
					data-target="#exampleModal"><i class="fa-regular fa-user mr-1"></i>${user.name}
				</a>



				<a href="logout" class="btn btn-light"><i
					class=" fas fa-sign-in-alt mr-1"></i>Logout</a>
			</c:if>





			<c:if test="${empty user and empty company and empty admin }">
				<a href="login.jsp" class="btn btn-light mr-1"> <i
					class=" fas fa-sign-in-alt mr-2"></i> Login
				</a>
				<!-- <a href="signup.jsp" class="btn btn-light mr-1"><i
					class="fa-regular fa-user mr-2"></i>Signup</a> -->

				<!-- 	<a href="signup_company.jsp" class="btn btn-light mr-2"><i
					class="fa-regular fa-user mr-2"></i> Singup company </a>
				<a href="login_company.jsp" class="btn btn-light mr-1"> <i
					class=" fas fa-sign-in-alt mr-2"></i> Login as Company
				</a>
				-->

			</c:if>


		</form>
	</div>
</nav>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="card" style="width: auto">
					<div class="card-body">
						<div class="text-center text-primary">
							<img alt="" src="img/user_icon.png" height="150px">
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th>${user.name}</th>
								</tr>

								<tr>
									<th scope="row">Qualification</th>
									<th>${user.qualification}</th>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<th>${user.email}</th>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>




<!-- Modal2 Resume -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="card" style="width: auto">
					<div class="card-body">
						<div class="text-center text-primary">
							<img alt="" src="img/user_icon.png" height="150px">
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th>${user.name}</th>
								</tr>

								<tr>
									<th scope="row">Qualification</th>
									<th>${user.qualification}</th>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<th>${user.email}</th>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<form action="UploadServlet" method="post"
					enctype="multipart/form-data">
					<!-- Include the user ID here -->
					<input type="hidden" name="id" value="${user.id}"> 
					<input type="file" id="fileUpload" name="fileUpload"><br>
					<br>
					<button type="submit" class="btn btn-primary">Upload</button>
				</form>

			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<!--<div class="modal fade" id="examplemodal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

		  	<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fas fa-user-circle fa-3x"></i>
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th>${sessionScope.companyName}</th>
								</tr>

								<tr>
									<th scope="row">Address</th>
									<th>${sessionScope.address}</th>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<th>${sessionScope.email}</th>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>-->