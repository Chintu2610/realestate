<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.AddPropertyServiceImpl" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Ventura - Data Tables</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Feathericon CSS -->
    <link rel="stylesheet" href="css/feathericon.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="css/select.bootstrap4.min.css">
    <link rel="stylesheet" href="css/buttons.bootstrap4.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
     <style>
    .image-container {
    position: relative;
}

.sold-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #ff6347; /* Coral color, you can change this to your preferred color */
    color: #fff; /* White text color */
    padding: 5px 10px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 5px;
    text-transform: uppercase;
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
		 
        <!-- Page Wrapper -->
        
        <div class="page-wrapper">
        
        
            <div class="content container-fluid">
                <!-- Page Header -->
                
                <div class="page-header">
                    <div class="row">
                       <div class="col">
							    <h3 class="page-title" style="font-size: 30px;">Property View</h3>
							    <ul class="breadcrumb">
							        <li class="breadcrumb-item"><a href="index.jsp">Index</a></li>
							        <li class="breadcrumb-item active">Property</li>
							    </ul>
							</div>
                    </div>
                </div>
                <!-- /Page Header -->
                
                <form action="" method="post">
             
 
            </form>            
                <div class="row">
                    <% try {
                    	String propertyId = request.getParameter("propertyId");                       
                        PropertyDAO propertyDao = new PropertyDAO();
                        AddPropertyServiceImpl searchProperty=new AddPropertyServiceImpl();                        
                        AddProperty   property = propertyDao.getPropertyById(propertyId);                                                                                             
                            if (!property.equals(null)) {
                    %>
                </div>	
                <!-- End previous row and start a new row -->
                 <div class="row">
<%
                }
%>
					        <div class="col-md-5">
					        <h1 style="color:blue;"><%= property.getPname() %></h1>
					        <span style="color:blue;"><i class="fas fa-map-marker-alt fa-xs pe-2"></i><%= property.getCity() %></span>
						
					            <div class="card">
					                <div class="card-body">
					                    <h4 class="header-title mt-0 mb-4"><p><strong>Status:</strong> <%= property.getStatus() %></p></h4>
					                    <div class="property-card">
					                        <% System.out.println("Image URL for Property " + property.getPropertyId() + ": " + property.getImageUrl(request)); %>
					                        <img src="<%= property.getImageUrl(request) %>" alt="Property Image" class="img-fluid">
					                        <%-- <p><strong>P ID:</strong> <%= property.getPropertyId() %></p> --%>
					                        <p><strong>Type:</strong> <%= property.getType() %></p>
					                        <p><strong>Mobile:</strong> <%= property.getPmobile()%></p>
					                        <p><strong>Dimensions:</strong> <%= property.getDimensions()%></p>
					                         <p><strong>Highlights:</strong> <%= property.getHighlights()%></p>
					                          <p><strong>Amenities:</strong> <%= property.getAmenities()%></p>
					                          <p><strong>Price:</strong> <%= property.getPrice()%></p>
					                          <p><strong>Listed Date:</strong> <%= property.getListedDate()%></p>
					                          <p><strong>Is Highlighted:</strong> <%= property.getIsHighlighted().equals("1") ? "Yes" : "No" %></p>
					                          <% if(property.getSold_status() != null && !property.getSold_status().equals(null)) { %>
					                          <p><strong>Sold Status:</strong> <%= property.getSold_status()%></p>
						       <% } %>
					                       <%--  <tr><td style="padding: 5px;"><strong>P ID:</strong></td><td><%= property.getPropertyId() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Name:</strong></td><td><%= property.getPname() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Mobile:</strong></td><td><%= property.getPmobile() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Status:</strong></td><td><%= property.getStatus() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Type:</strong></td><td><%= property.getType() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Age:</strong></td><td><%= property.getAge() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Dimensions:</strong></td><td><%= property.getDimensions() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>City:</strong></td><td><%= property.getCity() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Highlights:</strong></td><td><%= property.getHighlights() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Amenities:</strong></td><td><%= property.getAmenities() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Price:</strong></td><td><%= property.getPrice() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Listed Date:</strong></td><td><%= property.getListedDate() %></td></tr>
						    <tr><td style="padding: 5px;"><strong>Is Highlighted:</strong></td><td><%= property.getIsHighlighted().equals("1") ? "Yes" : "No" %></td></tr>
						    <% if(property.getSold_status() != null && !property.getSold_status().equals(null)) { %>
						    <tr><td style="padding: 5px;"><strong>Sold Status:</strong></td><td><%= property.getSold_status() %></td></tr>
					         <% } %>  --%>
					                        <!-- Move the form inside the loop -->
					                       
					                     </div>
					                </div>
					            </div>
					        </div>
					        <div style="margin-top:75px;">
                        <form action="./AddEnquiryServlet" method="post">
                      
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" placeholder="Your Name*">
                            </div> 
                            <div class="form-group">
								    <input type="text" name="email" class="form-control" style="width: 300px; height: 40px;" placeholder="Enter Email">
								</div>
                            <div class="form-group">
                                <input type="text" name="phone" class="form-control" placeholder="Enter Phone">
                            </div>
                            <div class="form-group">
                                <input type="text" name="Budget" class="form-control" placeholder="Budget">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" placeholder="Enter Message"></textarea>
                            </div>
                             <div class="form-group" style="display: none;">
							    <input type="text" name="id" name="propertyId" value="<%= property.getPropertyId() %>" class="form-control custom-input" style="width: 300px;">
							</div>
                            <div class="form-group mt-4">
                                <button type="submit" class="btn btn-primary w-100">Submit Inquiry</button>
                            </div>
                            
                        </form>
                        </div>
                        
<%
                
            
        }
     catch (Exception e) {
        e.printStackTrace();
    }
%>
</div>
                <!-- end row-->
               
					</div>
            </div>
        </div>
    
    <%
    } // End of the if-else block
%>
	
                <script>
				    function compareSelectedProperties() {
				        // Get all the selected checkboxes
				        var checkboxes = document.querySelectorAll('input[name="selectedProperties"]:checked');
				
				        // Create an array to store the selected property IDs
				        var selectedPropertyIds = [];
				
				        // Iterate through selected checkboxes and push property IDs to the array
				        checkboxes.forEach(function (checkbox) {
				            selectedPropertyIds.push(checkbox.value);
				        });
				
				        // Redirect to the compare.jsp page with selected property IDs
				        var compareUrl = 'compare.jsp?selectedPropertyIds=' + selectedPropertyIds.join(',');
				        window.location.href = compareUrl;
				    }
				</script>


    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Datatables JS -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/dataTables.responsive.min.js"></script>
    <script src="js/responsive.bootstrap4.min.js"></script>

    <script src="js/dataTables.select.min.js"></script>

    <script src="js/dataTables.buttons.min.js"></script>
    <script src="js/buttons.bootstrap4.min.js"></script>
    <script src="js/buttons.html5.min.js"></script>
    <script src="js/buttons.flash.min.js"></script>
    <script src="js/buttons.print.min.js"></script>

    <!-- Custom JS -->
    <!--
    <script src="js/script.js"></script>
    --> 
    <a href="#" class="bg-white hover-text-secondary" id="scroll" onclick="scrollToTop()">		    
		       <i class="fas fa-arrow-up"></i>		        		   
		</a>
	<script type="text/javascript">
    // Function to toggle the visibility of the scroll-to-top arrow
    function toggleScrollArrow() {
        var scrollArrow = document.getElementById('scroll');
        if (document.body.scrollTop > window.innerHeight * 0.5 || document.documentElement.scrollTop > window.innerHeight * 0.5) {
            scrollArrow.style.display = 'block';
        } else {
            scrollArrow.style.display = 'none';
        }
    }

    // Event listener for scroll events
    window.onscroll = function () {
        toggleScrollArrow();
    };

    // Function to handle scrolling to the top
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
</script>


	 <script src="js/jquery-3.2.1.min.js"></script>
</body>


</html>
