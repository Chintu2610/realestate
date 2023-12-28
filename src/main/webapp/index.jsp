<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
<title>Homex - Real Estate Template</title>
<!-- Meta Tags -->
	
<link rel="shortcut icon" href="images/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link   -->

	  <link rel="stylesheet" href="css/YouTubePopUp.css">
	  <link rel="stylesheet" href="css/feathericon.css">
	 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<!--	Title    -->
<title>Homex - Real Estate Template</title>

<style>
    .property-image-container {
        height: 200px; /* Set the desired fixed height for the image container */
        overflow: hidden; /* Hide any overflow to maintain consistency */
        position: relative; /* Position relative for absolute centering */
    }

    .property-image {
        width: 100%; /* Set the width to 100% */
        height: 100%; /* Set the height to 100% to fill the container */
        object-fit: cover; /* Maintain aspect ratio and cover the container */
        position: absolute; /* Position absolute for centering */
        top: 0; /* Center vertically */
        left: 0; /* Center horizontally */
    }
    p {
            text-align: justify; /* You can use other values like 'left', 'center', 'right', or 'justify' */
             white-space: normal;
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
        <!--	Banner Start   -->
        
        <div class="overlay-black w-100 slider-banner1 position-relative" style="background-image: url('images/banner/04.jpg'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-lg-12">
                        <div class="text-white">
                            <h1 class="mb-4"><span class="text-primary">Find</span><br>
                                Your dream house</h1>
                           <form action="./SearchServlet" method="post">
                                <div class="row">
                                    <div class="col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <select class="form-control" name="type">
                                                <option value="">Select Type</option>
												<option value="appartment">Appartment</option>
												<option value="flat">Flat</option>
												<option value="bunglow">Bunglow</option>
												<option value="house">House</option>
												<option value="villa">Villa</option>
												<option value="office">Office</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <select class="form-control" name="status">
                                                <option value="">Select Status</option>
												<option value="rent">Rent</option>
												<option value="sale">Sale</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-lg-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="city" placeholder="Enter City or Enter State" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-2">
                                        <div class="form-group">
                                            <button type="submit" name="filter" class="btn btn-primary w-100">Search Property</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--	Banner End  -->
        
        <!--	Text Block One
		======================================================-->
        <div class="full-row bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="text-secondary double-down-line text-center mb-5">What We Do</h2></div>
                </div>
                <div class="text-box-one">
                    <div class="row">
                       <div class="col-lg-3 col-md-6">
							    <div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
							       <!-- <div class="row">
                            <div class="col-md-12">
                                <div id="single-property" style="width:1200px; height:700px; margin:30px auto 50px;"> 
                                    Slide 1
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/16.jpg" class="ls-bg" alt="" /> </div>
                                    
                                    Slide 2
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/17.jpg" class="ls-bg" alt="" /> </div>
                                    
                                    Slide 3
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/3.jpg" class="ls-bg" alt="" /> </div>
									
									Slide 4
									<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/1.jpg" class="ls-bg" alt="" /> </div>
									
									Slide 5
									<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/20.jpg" class="ls-bg" alt="" /> </div>
                                </div>
                            </div>
                        </div> -->
                       <div style="width: 200px; height: 200px; overflow: hidden; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
							  <img src="admin/property/3.jpg" alt="Selling Service Image" class="img-fluid" style="max-width: 100%; max-height: 100%; object-fit: cover; border-radius: 50%;">
							</div>

							        <h5 class="text-secondary hover-text-primary py-3 m-0"><a href="contact.jsp">Selling Service</a></h5>
							        <p>Elevate your business with our top-tier services! From cutting-edge digital solutions to unparalleled consultancy,
							         we deliver excellence. Ourteam ensures seamless integration and innovation. 
							         Experience the difference with our premium services where your goals become our achievements.
							          Transform possibilities into realities with us!</p>
							    </div>
							</div>

                        <div class="col-lg-3 col-md-6">
                            <div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
								<!-- <div class="row">
                            <div class="col-md-12">
                                <div id="rental-property" style="width:200px; height:100px; margin:30px auto 50px;">
                                    Slide 1
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/04.jpg" class="ls-bg" alt="" /> </div>
                                    
                                    Slide 2
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/05.jpg" class="ls-bg" alt="" /> </div>
                                    
                                    Slide 3
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/03.jpg" class="ls-bg" alt="" /> </div>
									
									Slide 4
									<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/01.jpg" class="ls-bg" alt="" /> </div>
									
									Slide 5
									<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/17.jpg" class="ls-bg" alt="" /> </div>
                                </div>
                            </div>
                        </div> -->
                        <div style="width: 200px; height: 200px; overflow: hidden; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
							  <img src="admin/property/13.jpg" alt="Rental Service Image" class="img-fluid" style="max-width: 100%; max-height: 100%; object-fit: cover; border-radius: 50%;">
							</div>

                                <h5 class="text-secondary hover-text-primary py-3 m-0"><a href="contact.jsp">Rental Service</a></h5>
                                <p>The convenience with our rental services! Whether equipment, vehicles, or event essentials,
                                 we provide hassle-free rentals tailored to your needs. Enjoy flexibility, reliability, and top-notch quality.
                                  Elevate your experience inventory and customer-centric approach.
                                 satisfaction is our priority, making every rental a seamless experience.</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
								<!-- <div class="row">
                            <div class="col-md-12">
                               <div id="property-listing" style="width:1200px; height:100px; margin:30px auto 50px;">
                                    Slide 1
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/03.jpg" class="ls-bg" alt="" /> </div>
                                    
                                    Slide 2
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/12.jpg" class="ls-bg" alt="" /> </div>
                                    
                                    Slide 3
                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/14.jpg" class="ls-bg" alt="" /> </div>
									
									Slide 4
									<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/01.jpg" class="ls-bg" alt="" /> </div>
									
									Slide 5
									<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="admin/property/19.jpg" class="ls-bg" alt="" /> </div>
                                </div>
                            </div>
                        </div> -->
                                <div style="width: 200px; height: 200px; overflow: hidden; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
								  <img src="admin/property/16.jpg" alt="Property Listing Image" class="img-fluid" style="max-width: 100%; max-height: 100%; object-fit: cover; border-radius: 50%;">
								</div>

                                <h5 class="text-secondary hover-text-primary py-3 m-0"><a href="propertyview.jsp">Property Listing</a></h5>
                                <p>Discover your ideal home through our property listings. We provide a diverse selection of residences, 
                                from cozy apartments to spacious homes. Our user-friendly platform ensures a seamless search experience,
                                 offering detailed information and images to help you find the perfect property. 
                                 Your dream home is just a click away!
                                   </p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
								 <div style="width: 200px; height: 200px; overflow: hidden; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
								  <img src="admin/property/14.jpg" alt="Property Listing Image" class="img-fluid" style="max-width: 100%; max-height: 100%; object-fit: cover; border-radius: 50%;">
								</div>
                                <h5 class="text-secondary hover-text-primary py-3 m-0"><a href="#">Legal Investment</a></h5>
                                <p>Explore secure and legal investment opportunities with us. Our transparent investment  provide
                                 comprehensive information returns, associated risks, and legal frameworks. 
                                 We prioritize financial safety and growth, ensuring  make well-informed decisions in a trustworthy investment environment.
                                  Invest confidently for a prosperous future.
                                  </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-----  Our Services  ---->
		
        <!--	Recent Properties  -->
        <div class="full-row">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="text-secondary double-down-line text-center mb-4">Recent Property</h2>
                    </div>
                   
                    <div class="col-md-12">
                        <div class="tab-content mt-4" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home">
                                <div class="row">
							
                                    <div class="col-md-6 col-lg-4">
                                        <div class="featured-thumb hover-zoomer mb-4">
                                            <div class="overlay-black overflow-hidden position-relative"> <img src="admin/property/20.jpg" alt="pimage">
                                                <div class="featured bg-primary text-white">Flat</div>
                                                <div class="sale bg-secondary text-white text-capitalize">For Kumar</div>
                                                <div class="price text-primary"><b>$<?jsp echo $row['13'];?> </b><span class="text-Black"><?jsp echo $row['12'];?> Sqft 1200</span></div>
                                            </div>
                                            <div class="featured-thumb-data shadow-one">
                                                <div class="p-3">
                                                    <h5 class="text-secondary hover-text-primary mb-2 text-capitalize"><a href="propertydetail.jsp?pid=<?jsp echo $row['0'];?>"><?jsp echo $row['1'];?></a></h5>
                                                    <span class="location text-capitalize"><i class="fas fa-map-marker-alt text-primary"></i> <?jsp echo $row['14'];?></span> </div>
                                                
                                               
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
		<!--	Recent Properties  -->
        
        <!--	Why Choose Us -->
       
            <div class="container">
    <div class="row">
        <div class="col-md-12 col-lg-6">
            <div class="living-list pr-4">
               <div class="col-md-12 text-center">
        <h2 class="pb-4 mb-3 text-black">Why Choose Us</h2>
      </div>
                <ul>
                    <li class="mb-4 text-black d-flex"> 
                        <i class="flaticon-reward flat-medium float-left d-table mr-4 text-primary" aria-hidden="true"></i>
                        <div class="pl-2">
                            <h5 class="mb-3">Experience Quality</h5>
                            <p>Ad non vivamus Elementum eget fringilla venenatis quisque, maecenas adipiscing aliquet justo. Libero. Gravida. Sapien, dolor nostra sem. Rutrum conubia inceptos egestas dolor class.</p>
                        </div>
                    </li>
                    <li class="mb-4 text-black d-flex"> 
                        <i class="flaticon-real-estate flat-medium float-left d-table mr-4 text-primary" aria-hidden="true"></i>
                        <div class="pl-2">
                            <h5 class="mb-3">Quality of Service</h5>
                            <p>Emphasizing a commitment to providing high-quality service to clients, whether they are buying, selling, or renting properties.</p>
                        </div>
                    </li>
                   
                </ul>
            </div>
        </div>
        <!-- Add the image here with the actual URL -->
        <div class="col-md-12 col-lg-6">
            <img src="images/haddyliving.jpg" alt="Your Image Alt Text" class="img-fluid" style="max-height: 500px; max-width: 500px;">

        </div>
    </div>
</div>

        
		<!--	why choose us -->
		
		<!--	How it work -->
        <div class="full-row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="text-secondary double-down-line text-center mb-5">How It Work</h2>
                        </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="icon-thumb-one text-center mb-5">
                            <div class="bg-primary text-white rounded-circle position-absolute z-index-9"></div>
                            <div class="left-arrow"><i class="flaticon-investor flat-medium icon-primary" aria-hidden="true"></i></div>
                            <h5 class="text-secondary mt-5 mb-4">Discussion</h5>
                            <p>
								Real estate discussions encompass diverse topics. Market trends, technology integration,
								 and sustainability drive industry evolution. Investment strategies, 
								influenced by government policies and financial landscapes, shape the market.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="icon-thumb-one text-center mb-5">
                            <div class="bg-primary text-white rounded-circle position-absolute z-index-9"></div>
                            <div class="left-arrow"><i class="flaticon-search flat-medium icon-primary" aria-hidden="true"></i></div>
                            <h5 class="text-secondary mt-5 mb-4">Files Review</h5>
                            <p>File reviews are essential for maintaining organization and efficiency.
                             Regularly assessing files ensures accurate documentation, identifies errors or discrepancies, and supports compliance.
		                              This process enhances overall workflow, mitigates risks<!-- , and fosters a structured approach to information management,
		                             contributing to the effectiveness and reliability of business operations -->.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="icon-thumb-one text-center mb-5">
                            <div class="bg-primary text-white rounded-circle position-absolute z-index-9"></div>
                            <div><i class="flaticon-handshake flat-medium icon-primary" aria-hidden="true"></i></div>
                            <h5 class="text-secondary mt-5 mb-4">Acquire</h5>
                            <p>In real estate, acquisition refers to obtaining ownership or control over a property, often through 
                            purchase. Successful acquisition involves thorough market analysis, financial evaluation,
                             and negotiation skills. <!-- It is a strategic process aiming to secure properties that align with
                              investment goals and contribute to a diversified and profitable real estate portfolio. --></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--	How It Work -->
        
        <!--	Achievement
        ============================================================-->
      <div class="full-row overlay-secondary">
    <div class="container">
        <div class="fact-counter">
            <div class="row">
                <div class="col-md-3">
                    <div class="count wow text-center mb-sm-50" data-wow-duration="300ms">
                        <i class="flaticon-house flat-large text-white" aria-hidden="true"></i>
                        <div class="property-image-container">
                            <img src="images/1st.png" alt="Selling Service Image" class="img-fluid property-image">
                        </div>
                        <div class="text-black h4">Property Available</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="count wow text-center mb-sm-50" data-wow-duration="300ms">
                        <i class="flaticon-house flat-large text-white" aria-hidden="true"></i>
                        <div class="property-image-container">
                            <img src="images/home5.jpg" alt="Rental Service Image" class="img-fluid property-image">
                        </div>
                        <div class="text-orange h4">Sale Property Available</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="count wow text-center mb-sm-50" data-wow-duration="300ms">
                        <i class="flaticon-house flat-large text-white" aria-hidden="true"></i>
                        <div class="property-image-container">
                  <img src="images/video.jpg" alt="Rental Service Image" class="img-fluid property-image" style="max-width: 80%; height: auto;">

                        </div>
                        <div class="text-orange h4">Rent Property Available</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        
        <!--	Popular Place -->
        <div class="full-row bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="text-secondary double-down-line text-center mb-5">Popular Places</h2></div>
                </div>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 pb-1">
                            <div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/1.jpg" alt="" height="200">
                                <div class="text-white xy-center z-index-9 position-absolute text-center w-100">
									 </div>
									<?jsp } ?>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 pb-1">
                            <div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/2.jpg" alt="" height="200">
                                <div class="text-white xy-center z-index-9 position-absolute text-center w-100">
										 </div>
									<?jsp } ?>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 pb-1">
                            <div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/3.jpg" alt="" height="200">
                                <div class="text-white xy-center z-index-9 position-absolute text-center w-100">
                                    </div>
									<?jsp } ?>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 pb-1">
                            <div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/4.jpg" alt="" height="200">
                                <div class="text-white xy-center z-index-9 position-absolute text-center w-100">
                                     </div>
									<?jsp } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--	Popular Places -->
		
		<!--	Testonomial -->
		
				</div>
		
        <!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
        
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-primary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
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
<script src="js/YouTubePopUp.jquery.js"></script> 
<script src="js/validate.js"></script> 
<script src="js/jquery.cookie.js"></script> 
<script src="js/custom.js"></script>
<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    
    
</body>

</html>

<%
   }
%>
