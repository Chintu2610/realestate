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
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
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
                
				<div class="row">
                    <div class="col-md-12 col-lg-12">
                        <h3 class="double-down-line-left text-secondary position-relative pb-4 mb-4"><b>List</b></h3>
                    </div>
                </div>
                <div class="row about-company">
                    <div class="col-md-12 col-lg-7">
                        <div class="about-content">
                          <div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">List Of About</h4>
									
								</div>
								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-stripped">
											<thead>
												<tr>
													<th>Id</th>
													<th>Title</th>
													<th>Content</th>
													
												</tr>
											</thead>
											
											 <tbody>
												    <%
												        int start = 0;
												        int limit = 25;
												        String usernameFilter = request.getParameter("username");
												        String idFilter = request.getParameter("id");
												
												        List<AddAbout> resultSet;
												
												        String whereClause = "";
												
												        if (usernameFilter != null && !usernameFilter.isEmpty()) {
												            whereClause = "username = '" + usernameFilter + "'";
												        }
												
												        if (idFilter != null && !idFilter.isEmpty()) {
												            if (!whereClause.isEmpty()) {
												                whereClause += " AND ";
												            }
												            whereClause += "id = '" + idFilter + "'";
												        }
												
												        AboutDAO aboutDao = new AboutDAO();
												
												        if (!whereClause.isEmpty()) {
												            resultSet = aboutDao.getAllAbouts();
												        } else {
												            resultSet = aboutDao.getAllAbouts();
												        }
												
												        for (int i = 0; i < resultSet.size(); i++) {
												            AddAbout about = resultSet.get(i);
												    %>
												    <tr>
												        <td><%= about.getId() %></td>
												        <td><%= about.getTitle() %></td>
												        <td><%= about.getContent() %></td>
												    </tr>
												    <%
												        }
												    %>
												</tbody> 
										</table>
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
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    </div>
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
    <script src="js/script.js"></script>
</body>

</html>


<%
   }
%>