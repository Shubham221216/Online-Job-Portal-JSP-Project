<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.* "%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Admin</title>
<%@ include file="all_component/all_css.jsp"%>
<style type="text/css">
html {
	scroll-behavior: smooth;
}

body {
	font-family: "Times New Roman", Times, serif;
	font-size: 16px;
	line-height: 1.6;
	color: #333;
	background-color: #f8f8f8;
}

.imghome {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 400px;
}

.company-info {
	text-align: center;
	margin: 0 20px;
}

.roundimage {
	height: 40vh;
	width: 40vh;
	border-radius: 50%;
	margin-right: 70px;
	margin-top: 100px;
}

.info {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	height: 300px;
	width: 100% px;
}

.ddffsshh {
	font-size: 75px;
	color: red;
	font-weight: bold;
}

.down-text {
	font-size: 20px;
	font-weight: bold;
	color: black;
}

.about-us-link {
	position: absolute;
	top: -33px;
	left: 415px;
	font-size: 23px;
	color: white;
}

.about-website {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: start;
	height: 400px;
	width: 100%;
	margin-bottom: -50px;
}

.website-text {
	margin-top: 10px;
	text-align: center;
}

.website-text-down {
	margin-top: 20px;
	font-size: 20px;
	align-text: center;
	margin-left: 175px;
	margin-right: 175px;
}

.resume-tips-container {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
	height: auto;
	width: 100%;
}

.resume-tips-card {
	width: 50rem;
	height: auto; /* Height adjusts based on content */
	margin-left: 50px;
}

.tagline {
	margin: 30px;
	font-weight: bold;
	color: rgb(37, 84, 125);
}

.tagline-desc {
	/*top     right       bottom 	     left*/
	margin: -10px 30px 30px 30px;
	font-size: 20px;
}

.takeaway {
	height: 90px;
	width: 475px;
	margin-left: 30px;
	background-color: rgb(113, 174, 227);
	text-algin: center;
	margin-bottom: 70px;
	border-radius: 3px;
}

h4 {
	padding-top: 30px;
}

.takeaway-tip {
	text-align: center;
	font-weight: bold;
}

#about-btn {
	color: white;
}

#about-btn:hover {
	background-color: white;
	border-radius: 10px;
	color: black;
}

.takeaway .takeaway-tip span {
	font-weight: lighter;
}

/* .highlight {
    font-weight: bold;
} */

</style>
</head>
<body>

	<c:if test="${ company.role ne 'company'}">
		<c:redirect url="login_company.jsp" />
	</c:if>

	<%-- Retrieve company name (which serves as username) from session --%>
	<%
	String companyName = (String) session.getAttribute("companyName");
	/* String address = (String) session.getAttribute("address"); */
	%>

	<%-- Fetch jobs posted by the company corresponding to the company name --%>
	<%-- Here, you should call the DAO method to fetch jobs based on the company name --%>
	<%-- Use the retrieved list of jobs to display on the page --%>

	<%-- Include navbar --%>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="about-us-link">
		<li class="nav-item active"><a class="nav-link" id="about-btn"
			style="margin-left: 10px;" href="#about-website">About us <span
				class="sr-only">(current)</span>
		</a></li>
	</div>
	<div class="imghome">
		<div class="company-info">
			<h1 class="cname"
				style="justify-content: end; margin-left: 32%; padding-bottom: 30px; font-weight: bold;">
				Welcome<span style="color: green;"> <%=companyName%></span> Group
			</h1>
			<p style="font-size: 20px; margin-right: 300px">As a job
				recruiter using our platform, you'll experience a seamless and
				efficient process for finding top talent. Our innovative platform
				leverages advanced technology and intuitive features to streamline
				your recruitment efforts. With a user-friendly interface and
				powerful search capabilities, you can easily browse through a
				diverse pool of qualified candidates, saving you time and effort in
				the hiring process Additionally, our platform offers personalized
				services tailored to your specific needs, whether you're looking to
				fill temporary positions or hire for long-term roles.</p>
		</div>
		<img class="roundimage" src="img/recruiter4.png">
	</div>
	<!-- <hr> -->
	<div class="info">
		<h1 class="ddffsshh">
			50k+
			<p class="down-text">Candidates</p>
		</h1>
		<h1 class="ddffsshh">
			1k+
			<p class="down-text">Daily Engagement</p>
		</h1>
		<h1 class="ddffsshh">
			500+
			<p class="down-text">Companies</p>
		</h1>
		<h1 class="ddffsshh">
			<span style="margin-left: 32px;"> 1 </span>
			<p class="down-text">Platform only</p>
		</h1>
	</div>
	<hr>

	<div class="resume-tips-container">

		<div class="resume-tips-card">

			<h1 style="margin: 30px; font-weight: bold; margin-bottom: 50px;">7
				Job Post Tips</h1>
			<h3 class="tagline">1. Keep it concise.</h3>
			<h6 class="tagline-desc">Many people look at job descriptions on
				their phones. That could explain why job posts with fewer than 150
				words can get candidates to apply 17.8% more frequently than job
				posts with 450 to 600 words.</h6>

			<div class="takeaway">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Shorter job posts
						get more applicants.</span>
				</h4>
			</div>

			<h3 class="tagline">2. Be careful of being too casual.</h3>
			<h6 class="tagline-desc">Candidates in our study were 2x-4x less
				likely to apply when the mock job description was extremely casual.
				Coming off as too conversational can give the impression that you
				are unprofessional - so keep it friendly without going overboard.</h6>

			<div class="takeaway">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Too casual of a
						tone can be off-putting.</span>
				</h4>
			</div>

			<h3 class="tagline">3. Let candidates know what's in it for
				them.</h3>
			<h6 class="tagline-desc">Candidates may spend only a few seconds
				reading your job description, so make sure you cut to the chase.
				Details like compensation and qualifications were consistently
				highlighted as the most helpful part of a job description.?</h6>

			<div class="takeaway">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Don't forget to
						give candidates the basics. </span>
				</h4>
			</div>


			<h3 class="tagline">4. Don't spend too much time talking up your
				company.</h3>
			<h6 class="tagline-desc">Candidates care about your company;
				it's just not what they're looking for in a job description. They
				rated company, culture, and mission as less important, rarely
				highlighting it as helpful.</h6>

			<div class="takeaway" style="width: 650px;">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Provide company
						info on your website - not the job description. </span>
				</h4>
			</div>

			<h3 class="tagline">5. Define exactly what success looks like.</h3>
			<h6 class="tagline-desc">Stand out from the crowd by providing
				specific metrics that your candidates should hit after one year on
				the job. This can set up expectations and reflect positively on your
				company.</h6>

			<div class="takeaway" style="width: 730px;">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Set clear goals,
						and make them as specific and as measurable as possible. </span>
				</h4>
			</div>



			<h3 class="tagline">6. Get your job post out there early in the
				week.</h3>
			<h6 class="tagline-desc">When it comes to posting jobs, earlier
				in the week is better. Most candidates apply on Monday, Tuesday, or
				Wednesday - with just 15% coming in over the weekend.</h6>

			<div class="takeaway">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Post your job on
						Monday morning.</span>
				</h4>
			</div>

			<h3 class="tagline">7. Use gender-neutral terms to encourage
				gender diversity.</h3>
			<h6 class="tagline-desc">Men applied to the jobs that they
				viewed 13% more often than women. Job descriptions with "masculine"
				wording can turn away qualified prospects. Using gender-neutral
				language encourages a more diverse pool of applicants.</h6>

			<div class="takeaway" style="width: 600px;">
				<h4 class="takeaway-tip">
					Takeaway: <span style="font-size: 20px;">Be conscious of the
						wording on your job description.</span>
				</h4>
			</div>

			<!-- 
			<h3 class="tagline">8. Write strong, achievement-focused bullet
				points.</h3>
			<h6 class="tagline-desc">The bullet points under each job entry
				are arguably the most important part of your resume. They tell
				whoever's reading it what skills you have, how you've used them, and
				how you've helped your employers in the past. So start with a strong
				action verb, include relevant skills from the job description, and
				frame your bullets around your achievements don't just list your job
				duties. Tell them how your work benefitted your boss or company so
				they know what they stand to gain by hiring you.</h6>


			<h3 class="tagline">9.Put experience first, education later.</h3>
			<h6 class="tagline-desc">Unless you're a recent graduate, put
				your education after your experience. Chances are, your last couple
				of jobs are more important and relevant to you getting the job than
				where you went to college.</h6>


			<h3 class="tagline">10.Keep your resume outline fresh.</h3>
			<h6 class="tagline-desc">Carve out some time every quarter or so
				to pull up your resume outline and make some updates. Have you taken
				on new responsibilities? Learned new skills? Add them in. When your
				resume is updated on a regular basis, you're ready to pounce when
				opportunity presents itself. And, even if you're not job searching,
				there are plenty of good reasons to keep this document in tip-top
				shape.</h6> -->

		</div>
	</div>

	<hr>


	<div class="about-website" id="about-website">
		<h1 class="website-text">
			<div style="font-weight: bold;">About Us</div>
			<br> <span style="color: rgb(221, 63, 124); font-size: 35px">Cultivating
				Careers, Connecting Talent<br>Your Path to Success Starts Here
			</span>
			<p class="website-text-down">Welcome to <span style="font-weight: bold;">Job Finder</span>, your premier
				platform for connecting with top talent and building your dream
				team. At Job Finder, we recognize the challenges and complexities
				involved in finding the right candidates to fill crucial positions
				within your organization. That's why we've devoted ourselves to
				crafting a cutting-edge platform that simplifies the recruitment
				process for employers like you.Our platform is designed to
				streamline your hiring efforts by leveraging advanced technology and
				intuitive features. With Job Finder, you'll gain access to a vast
				pool of qualified candidates, making it easier than ever to find the
				perfect fit for your team. Our commitment to excellence ensures that
				your recruitment experience is personalized and efficient, saving
				you valuable time and resources. For recruiters, our platform offers
				a range of powerful features, including advanced search
				capabilities, targeted job postings, and customizable recruitment
				solutions. Whether you're looking to fill entry-level positions or
				executive roles, Job Finder has you covered. Join us today and
				experience the difference of recruiting with ease and precision.</p>
		</h1>
	</div>
	
	
		<%@ include file="all_component/footer.jsp"%>
	
	<!-- <style>
	$(document).ready(function() {
    $("p:contains('Job Portal')").addClass("highlight");
});
	
	</style> -->
</body>
</html>
