 	<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>

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

<!--	Fonts    -->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<!--	Title
	=========================================================-->
<title>Homex - Real Estate Template</title>
</head>
<body> 
<form action="./AddContactServlet" method="post">
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
        
        <!--	Banner -->
        <div class="banner-full-row page-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="page-name float-left text-Black text-uppercase mt-1 mb-0"><b>Contact</b></h2>
                    </div>
                    <div class="col-md-6">
						    <nav aria-label="breadcrumb" class="float-left float-md-right">
						        <ol class="breadcrumb bg-transparent m-0 p-0">
						            <a href="index.jsp">
                            <img src="admin/user/home.png" alt="Logo" class="logo-icon" width="50" height="50">
                    Home
                </a>
						        </ol>
						    </nav>
						</div>

                </div>
            </div>
        </div>
        <!--	Banner -->
		
        <!--	Contact Information -->
        <div class="full-row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-5 bg-primary">
                        <div class="contact-info">
                            <h3 class="mb-4 mt-4 text-white">Contacts</h3>
							
                            <ul>
                                <li class="d-flex mb-4"> <i class="fas fa-map-marker-alt text-white mr-2 font-13 mt-1"></i>
                                    <div class="contact-address">
                                        <h5 class="text-white">Address</h5>
                                        <span class="text-secondary">Weblabs technology,Hyderabad ,India</span> 
										<span class="text-secondary">Weblabs technology,Hyderabad ,India</span>
										</div>
                                </li>
                                <li class="d-flex mb-4"> <i class="fas fa-phone-alt text-white mr-2 font-13 mt-1"></i>
                                    <div class="contact-address">
                                        <h5 class="text-white">Call Us</h5>
                                        <span class="d-table text-secondary">9386 494 439</span>
										<span class="text-secondary">9734 734 565 </span>
									</div>
                                </li>
                                <li class="d-flex mb-4"> <i class="fas fa-envelope text-white mr-2 font-13 mt-1"></i>
                                    <div class="contact-address">
                                        <h5 class="text-white">Email Adderss</h5>
										<span class="d-table text-secondary">weblabs@gmail.com</span>
										<span class="text-secondary">weblabs@gmail.com</span>
										</div>
                                </li>
                            </ul>
                        </div>
                    </div>
					<div class="col-lg-1"></div>
                    <div class="col-md-12 col-lg-7">
						<div class="container">
                        <div class="row">
							<div class="col-lg-12">
								<h2 class="text-secondary double-down-line text-center mb-5">Get In Touch</h2>
								<?jsp echo $msg; ?><?jsp echo $error; ?>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								
									<div class="row">
										<div class="row mb-4">
										
											<div class="form-group col-lg-6">
												<input type="text"  name="name" class="form-control" placeholder="Your Name*">
											</div>
											<div class="form-group col-lg-6">
												<input type="text"  name="email" class="form-control" placeholder="Email Address*">
											</div>
											<div class="form-group col-lg-6">
												<input type="text"  name="phone" class="form-control" placeholder="Phone" maxlength="10">
											</div>
											<div class="form-group col-lg-6">
												<input type="text" name="subject"  class="form-control" placeholder="Subject">
											</div>
											<div class="form-group col-lg-6">
												<input class="form-control" name="date" required type="date">
											</div>
											
											<div class="col-lg-6">
												<div class="form-group">
													<textarea name="message" class="form-control" rows="5" placeholder="Type Comments..."></textarea>
												</div>
											</div>
										</div>
										<button type="submit" value="send message" name="send" class="btn btn-primary">Send Message</button>
									</div>
								
							</div>
						</div>
						</div>
					</div>
                </div>
            </div>
        </div>
        </div>
        <!--	Contact Inforamtion -->
        
        <!--	Map    -->
                <iframe width="100%" height="350" id="gmap_canvas" src="https://maps.google.com/maps?q=Flat%20no%3A%20302%2C%20Raghava%20Towers%2C%20NH-65%2C%20Hafeezpet%2C%20Madeenaguda%2C%20Telangana-5000050.%20HYDERABAD&t=&z=10&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
		<!--	Map    -->
        
        <!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
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
    <!--
    <script src="js/script.js"></script>
    -->
</form>
</body>
</html>

<%
   }
%>