<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.List, java.util.ArrayList" %>

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

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    
</head>

<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">
        <!-- Header start -->
        <jsp:include page="header.jsp" />
        <!-- Header end -->

        <!-- Sidebar start -->
        <jsp:include page="sidebar.jsp" />
        <!-- Sidebar end -->

        <!-- Page Wrapper -->
        <div class="page-wrapper">
            <div class="content container-fluid">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col">
                            <h3 class="page-title">Property</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Property list</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

              <div class="row">
    <%
    try {
        List<AddProperty> searchResults = (List<AddProperty>) request.getAttribute("searchResults");
        int count = 0;

        // Check if the searchResults list is empty
        if (searchResults.isEmpty()) {
%>

<div class="col text-center">
    <div class="jumbotron">
        <h1 class="display-4">Properties coming soon</h1>
        <p class="lead">After properties are listed, they will be available.</p>
        <hr class="my-4">
        <p class="lead">
            <a class="btn btn-primary btn-lg" href="index.jsp" role="button">Explore other options</a>
        </p>
    </div>
</div>
<%
        } else {
            for (int i = 0; i < searchResults.size(); i++) {
                AddProperty property = searchResults.get(i);

                if (count > 0 && count % 4 == 0) {
%>
        </div>
        <!-- End previous row and start a new row -->
        <div class="row">
<%
                }
%>
					        <div class="col-md-5">
					            <div class="card">
					                <div class="card-body">
					                    <h4 class="header-title mt-0 mb-4"><p><strong>Status:</strong> <%= property.getStatus() %></p></h4>
					                    <div class="property-card">
					                        <% System.out.println("Image URL for Property " + property.getPropertyId() + ": " + property.getImageUrl(request)); %>
					                        <img src="<%= property.getImageUrl(request) %>" alt="Property Image" class="img-fluid">
					                        <p><strong>P ID:</strong> <%= property.getPropertyId() %></p>
					                        <p><strong>Type:</strong> <%= property.getType() %></p>
					                        <p><strong>City:</strong> <%= property.getCity() %></p>
					                      
					                        <div>
					                            <a href="propertydelete.jsp?id=<%= property.getPropertyId() %>">Delete</a>
					                        </div>
					                        <!-- Move the form inside the loop -->
					                       
					                     </div>
					                </div>
					            </div>
					        </div>
					 
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
                             <div class="form-group">
							    <input type="text" name="id" name="propertyId" value="<%= property.getPropertyId() %>" class="form-control custom-input" style="width: 300px;">
							</div>
                            <div class="form-group mt-4">
                                <button type="submit" class="btn btn-primary w-100">Submit Inquiry</button>
                            </div>
                            
                        </form>
                        
                        
<%
                count++;
            } // End of the for loop
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</div>
</div>
</div>
</div>
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
</body>

</html>

<%
    } // End of the if-else block
%>
