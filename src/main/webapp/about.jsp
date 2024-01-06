<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddAbout" %>
<%@ page import="com.real.serviceimpl.AboutDAO" %> 

<%
HttpSession sdsession = request.getSession(true);

// Retrieve the username attribute from the session
String username = (String) sdsession.getAttribute("username");
String roleIDString = (String) sdsession.getAttribute("RoleID");

// Check if the user is logged in or redirect to the login page
if (roleIDString == null) {
    response.sendRedirect("login.jsp"); // Change "login.jsp" to your actual login page
} else {
    // Rest of your content for the logged-in user
%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    
<link rel="shortcut icon" href="images/favicon.ico">

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!-- Css Link -->

 <link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
	  
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<!-- Title -->
<title>Homex - Real Estate Template</title>
<style>
    /* Increase the font size of breadcrumb items */
    .breadcrumb-item a {
        font-size: 20px; /* Adjust the font size as needed */
    }

    /* Center the breadcrumb navigation */
    .breadcrumb {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }
    #scroll {
        position: fixed;
        bottom: 20px; /* Adjust the distance from the bottom as needed */
        left: 50%;
        transform: translateX(-50%);
    }
     #scroll i {
        color: black; /* Color of the arrow */
        font-size: 24px; /* Adjust the font size of the arrow */
    }
</style>
</head>
<body>
<!-- Main Wrapper -->
    <div class="main-wrapper">
       <!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
		 
        <div class="page-wrapper">
        
        <div class="content container-fluid">
    <!-- Your page content remains the same -->
        
        <!--	Banner   --->
        <div class="banner-full-row page-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="page-name float-left text-black text-uppercase mt-1 mb-0"><b>About US</b></h2>
                        
                    </div>
                    <div class="col-md-6">
					    <nav aria-label="breadcrumb" class="float-left float-md-right">
					        <ol class="breadcrumb bg-transparent m-0 p-0">
					            <li class="breadcrumb-item text-white"><a href="index.jsp">Home</a></li>
					            <li class="breadcrumb-item active"><a href="aboutadd.jsp">About Us</a></li>
					        </ol>
					    </nav>
					</div>
                </div>
            </div>
        </div>
         <!--	Banner   --->
		 
        <!--	About Our Company -->
        <div class="full-row">
            <div class="container">
                
				
                <div class="row about-company">
                    <div class="col-md-12 col-lg-7">
                        <div class="about-content">
                          <div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										
								<div class="about-content">
    <div class="row">
        <div class="col-md-6 mb-4">
            <h2 class="mb-3 text-black">Our Company</h2>
            <img src="images/kumar.jpg" alt="Mission Image" class="img-fluid mb-3">
            <p>
                Meet our exceptional real estate team at WebLabs RealEstate Company.
                Committed to excellence, our diverse professionals bring extensive expertise and a client-centric approach.
                With a passion for innovation and community involvement, we're dedicated to making your real estate journey seamless and successful. 
                Contact us to experience outstanding service and achieve your real estate goals.
            </p>
        </div>

        <div class="col-md-6 mb-4">
            <h2 class="mb-3 text-black">Our Team Members</h2>
            <img src="images/sharath.jpg" alt="Team Image" class="img-fluid mb-3" style="width: 300px; height: 260px;">

            <p>
                Discover the heart of WebLabs RealEstate Company through our exceptional team members.
                Each member embodies a passion for real estate, offering unique skills and dedication.
                With a commitment to client success, innovation, and community engagement, our team is your partner in achieving your real estate goals.
                Meet the faces shaping exceptional experiences.
            </p>
        </div>
    </div>
</div>
				
									</div>
								</div>
							</div>
						</div>
					</div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5 mt-5">
                        <div class="about-img"> <img src="admin/upload/condos-pool.png" alt="about image"> </div>
                    </div>
                </div>
				
            </div>
        </div>
        <!--	About Our Company -->        
        
       <!--	Footer   start-->
		
	
		<!--	Footer   start-->
        
         
    </div>
    	<jsp:include page="footer.jsp" />
    	<a href="#" class="bg-white hover-text-secondary" id="scroll">
		    
		       <i class="fas fa-arrow-up"></i>
		        
		   
		</a>
</div>
</div>
<!-- Wrapper End --> 

<!--	Js Link
============================================================--> 
<script src="js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/greensock.js"></script> 
<script src="js/layerslider.transitions.js"></script> 
<script src="js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/popper.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/owl.carousel.min.js"></script> 

<script src="js/tmpl.js"></script> 
<script src="js/jquery.dependClass-0.1.js"></script> 
<script src="js/draggable-0.1.js"></script> 
<script src="js/jquery.slider.js"></script> 
<script src="js/wow.js"></script> 
<script src="js/jquery.cookie.js"></script> 
<script src="js/custom.js"></script>

<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Custom JS -->
    <!-- <script src="js/script.js"></script>-->
</body>

</html>


<%
   }
%>