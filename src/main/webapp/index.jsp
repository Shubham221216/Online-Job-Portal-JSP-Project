<%@page import="com.DB1.DBConnect1"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Finder</title>
<%@ include file="all_component/all_css.jsp"%>
<style type="text/css">
/*
.back-img{
background:url("img/job5.jpeg");
width:100%;
height:90vh;
backgroung-repeat:no-repeat;
background-size:cover;
background-attachment:fixed;
}  */


body {
	font-family: "Times New Roman", Times, serif;
	/* Use a stylish font like Poppins */
	font-size: 16px; /* Set a comfortable base font size */
	line-height: 1.6;
	/* Improve readability with a slightly increased line height */
	color: #333; /* Set a dark color for text */
	background-color: #f8f8f8; /* Choose a light background color */
}

html {
	scroll-behavior: smooth;
}

.imghome {
	display: flex;
	justify-content: center;
	/* Aligns items along the main axis (horizontally) */
	align-items: center;
	/* Aligns items along the cross axis (vertically) */
	margin-bottom-200px;
}

.imghome img {
	margin: 0; /* Removes default margin */
}

.line {
	border: 20px solid rgb(41, 46, 44);
	/* Set the line color and thickness */
	border-radius: 3px;
	width: 98%; /* Adjusted width */
	margin: 0 auto; /* Center the line horizontally */
	box-sizing: border-box;
}

.about-us {
	margin-top: 10px;
	display: flex;
	height: 500px;
	width: 100%;
	background-color: rgb(92, 131, 156);
	text-align: left; /* Align container content horizontally to left */
}

.text {
	margin-top: 70px;
	margin-left: 10px;
	font-size: 80px;
	color: white;
	position: relative;
}

.about-us-image {
	height: 450px;
	margin-left: 400px;
	margin-top: 45px;
}

.text-down {
	margin-top: 10px;
	font-size: 20px;
	margin-left: 10px;
	color: rgb(36, 25, 78);
}

.work {
	margin-top: 20px;
	display: flex;
	height: 350px;
	width: 100%;
	text-align: left; /* Align container content horizontally to left */
}

.work-image {
	height: 300px;
	margin-left: 15px;
}

.work-text {
	margin-top: 10px;
	text-align: center;
}

.work-text-down {
	margin-top: 20px;
	font-size: 20px;
	margin-left: 150px;
}

.about-website {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: start;
	height: 400px;
	width: 100%;
	margin-bottom: 30px;
}

.website-text {
	margin-top: 10px;
	text-align: center;
}

.website-text-down {
	margin-top: 20px;
	font-size: 20px;
	align-text: center;
	margin-left: 150px;
	margin-right: 150px;
	
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
	left: 165px;
	font-size: 23px;
	color: white;
}

.resume-tips-container {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
	height: auto;
	width: 100%;
}

.resume-tips-card {
	width: 53rem;
	height: auto; /* Height adjusts based on content */
	margin-left: 50px;
}

.tagline {
	margin: 30px;
	font-weight: bold;
	color:rgb(37, 84, 125);
}

.tagline-desc {
	/*top     right       bottom 	     left*/
	margin: -10px 30px 30px 30px;
	font-size: 20px;
}

#about-btn{
color:white;
}
#about-btn:hover{
background-color:white;
border-radius:10px;
color:black;
}
</style>
</head>

<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="about-us-link">
		<li class="nav-item active"><a class="nav-link"
		id="about-btn"
			style="margin-left: 10px; " href="#about-website">About
				us <span class="sr-only">(current)</span>
		</a></li>
	</div>
	
	



	<div class="container-fluid back-img">
		<div class="text-center">
			<!--   <h1 class="text-white p-4">
            <i class="fa fa-book mr-1" aria-hidden="true"></i>Online Job Portal
        </h1>-->
		</div>
	</div>

	<div class="imghome">
		<img src="img/HomePage2.png"
			style="height: 85vh; width: 50%; align: center"> <img
			src="img/homepg.png" style="height: 85vh; width: 50%; align: center">
	</div>
	<!--<hr class="line">-->

	<div class="about-us">
		<h2 class="text">
			Find Your Dream <br>Jobs Here
			<p class="text-down">Discovering your dream career has never been
				easier with our innovative job finder system.Our platform offers a
				seamless and intuitive experience, empowering you to explore a vast
				array of job opportunities tailored to your preferences and
				expertise. With advanced search functionalities allowing you to
				filter by location, industry, and specialization, finding the
				perfect job has never been more accessible. Join us today and embark
				on a journey towards fulfilling your professional aspirations.</p>
		</h2>
		<img class="about-us-image" src="img/homepg3.png">
	</div>


	


	<div class="work">
		<img class="work-image" src="img/job5.jpeg">
		<h2 class="work-text">
			<span style="font-weight: bold;">How it Works?</span>
			<p class="work-text-down">Our Job Search Engine revolutionizes
				the job searching experience by connecting users with job listings
				uploaded by recruiters. Upon accessing our platform, users are
				presented with a user-friendly interface where they can effortlessly
				browse through a diverse range of job opportunities. Recruiters
				upload job listings directly onto our platform, providing detailed
				information about each position, including job title, description,
				requirements, and contact information. Users can easily navigate
				through these listings, exploring various opportunities across
				different industries and locations.</p>
		</h2>
	</div>
	<hr>


	<div class="resume-tips-container">
		<div class="resume-tips-card">
			<h1 style="margin: 30px; font-weight: bold;">Basic Resume Tips</h1>
			<h3 class="tagline">1. Put the best, most relevant information
				first.</h3>
			<h6 class="tagline-desc">In journalism speak, "above the fold"
				refers to what you see on the front half of a folded newspaper (or,
				in the digital age, before you scroll down on a website), but
				basically it's your first impression of a document. In resume speak,
				it means you should make sure your most relevant qualifications are
				visible on the top third of your resume. This top section is what
				the hiring manager is going to see first and what will serve as a
				hook for someone to keep on reading. If your most recent position
				isn't the most relevant piece of your candidacy, consider leading
				with a skills section (such as in a hybrid resume format) or writing
				a resume</h6>


			<h3 class="tagline">2. Choose the right resume format for you.</h3>
			<h6 class="tagline-desc">There are lots of different ways to
				organize the information on your resume like the functional resume
				or combination resume. But the good old reverse chronological where
				your most recent experience is listed first is usually your best
				bet. Unless it's absolutely necessary in your situation, skip the
				functional or skills-based resume hiring managers might wonder what
				you're hiding.</h6>


			<h3 class="tagline">3. Keep it concise.</h3>
			<h6 class="tagline-desc">The two-page resume is a hotly debated
				topic, but the bottom line is this you want the information here to
				be as short as possible, and keeping it to one page forces you to
				prioritize what really matters. If you truly have enough relevant
				and important experience, training, and credentials to showcase on
				more than one page of your resume, then go for two. But if you can
				tell the same story in less space?</h6>


			<h3 class="tagline">4. Include Relevant Links.</h3>
			<h6 class="tagline-desc">Can't figure out how to tell your whole
				story on one page, or want to be able to include some visual
				examples of your work? Instead of trying to have your resume cover
				everything, cover the most important details on that document, and
				then include a link to your personal website, your online portfolio,
				examples of your work, or a relevant, professional social media
				profile, where you can dive more into what makes you the ideal
				candidate. Just avoid hyperlinking over words that are key to
				understanding your resume since it can throw off the tools employers
				use to store and parse resumes.</h6>


			<h3 class="tagline">5. Keep your resume format simple.</h3>
			<h6 class="tagline-desc">We'll talk about getting creative in
				order to stand out in a minute. But the most basic principle of good
				resume formatting and design? Keep it simple. Make your resume easy
				on hiring managers eyes by using a reasonably sized default font
				like Helvetica or Arial and leaving a healthy amount of white space
				on the page.Your main focus here should be on readability for the
				hiring manager</h6>


			<h3 class="tagline">6. Make your contact info prominent.</h3>
			<h6 class="tagline-desc">You don't need to include your address
				on your resume anymore (really!), but you do need to make sure to
				include a phone number and professional email address (but not one
				affiliated with another job!) as well as other places the hiring
				manager can find you on the web, like your LinkedIn profile, and
				your pronouns if you'd like to.</h6>


			<h3 class="tagline">7. Keep your work experience recent and
				relevant.</h3>
			<h6 class="tagline-desc">As a rule, you should only show the
				most recent 10-15 years of your career and only include the
				experiences that are relevant to the positions you're applying to.
				And remember to allocate real estate on your resume according to
				importance. If there's a choice between including one more college
				internship or going into more detail about your current role, always
				choose the latter (unless the internship was more relevant to the
				one you're applying to).</h6>

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
				shape.</h6>

		</div>
	</div>
	<hr>



	<div class="about-website" id="about-website">
		<h1 class="website-text">
			<div style="font-weight: bold;">About Us</div>
			<br> <span style="color: rgb(221, 63, 124); font-size: 35px">Cultivating
				Careers, Connecting Talent<br>Your Path to Success Starts Here
			</span>
			<p class="website-text-down">
				Welcome to Job Finder, your ultimate destination for finding your
				dream job and building your dream team. <br>At Job Finder, we
				understand the challenges and uncertainties that come with searching
				for the perfect career opportunity and hiring the right talent. <br>That's
				why we've dedicated ourselves to creating a platform that
				streamlines the job search process for candidates and simplifies the
				recruitment process for employers. What sets Job Finder apart is our
				commitment to providing a personalized and intuitive experience for
				both job seekers and recruiters. <br>For job seekers, our
				advanced search algorithms and comprehensive database ensure that
				you can easily find job listings that match your skills, interests,
				and preferences. From entry-level positions to executive roles,
				we've got you covered. For recruiters, our platform offers advanced
				search capabilities, targeted job postings, and customizable
				recruitment solutions designed to meet your unique hiring
				objectives.
			</p>
		</h1>
	</div>



	<%@ include file="all_component/footer.jsp"%>
</body>
</html>