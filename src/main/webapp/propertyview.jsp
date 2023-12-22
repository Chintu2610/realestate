<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
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
							    <h3 class="page-title" style="font-size: 30px;">Property View and Compare</h3>
							    <ul class="breadcrumb">
							        <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
							        <li class="breadcrumb-item active">Property</li>
							    </ul>
							</div>
                    </div>
                </div>
                <!-- /Page Header -->
                
                <div class="row">
                    <% try {
                        int start = 0;
                        int limit = 25;
                        String usernameFilter = request.getParameter("username");
                        String idFilter = request.getParameter("id");

                        List<AddProperty> resultSet;

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

                        PropertyDAO propertyDao = new PropertyDAO();

                        if (!whereClause.isEmpty()) {
                            resultSet = propertyDao.getAllProperties();
                        } else {
                            resultSet = propertyDao.getAllProperties();
                        }

                        int count = 0; // Counter to track the number of records

                        for (int i = 0; i < resultSet.size(); i++) {
                            AddProperty property = resultSet.get(i);
                            
                     	       // Start a new row after displaying four records
                            if (count > 0 && count % 4 == 0) {
                    %>
                </div>	
                <!-- End previous row and start a new row -->
                <div class="row">
                    <% } %>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mt-0 mb-4">Property Details</h4>
                                <div class="property-card">
                                    
               <%-- <img src="<%= property.getImageUrl(request) %>" alt="Property Image" class="img-fluid"> --%>
               
              <% System.out.println("Image URL for Property " + property.getPropertyId() + ": " + property.getImageUrl(request)); %>
                        <img src="<%= property.getImageUrl(request) %>" alt="Property Image" class="img-fluid">
      
                       <table class="table" style="width: 100%; max-width: 300px; margin-bottom: 10px;">
						    <tr><td style="padding: 5px;"><strong>P ID:</strong></td><td><%= property.getPropertyId() %></td></tr>
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
						    <tr><td style="padding: 5px;"><strong>Is Highlighted:</strong></td><td><%= property.getIsHighlighted() %></td></tr>
						</table>
                      <div>                        
                     <div>
						    <input type="checkbox" id="property_<%= property.getPropertyId() %>" name="selectedProperties" value="<%= property.getPropertyId() %>">
						    <label for="property_<%= property.getPropertyId() %>">Select Property <%= property.getPropertyId() %></label>
						</div>
                                    
<%--                                     <a href="compare.jsp?propertyId1=<%= property.getPropertyId() %>">Compare with Another Property</a>
 --%>                                    
                                        <%-- <a href="propertydelete.jsp?id=<%= property.getPropertyId() %>">Delete</a> --%>
                                    </div>
                                </div>
                            </div> <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->

                    <% count++;
                        } // End of the for loop
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </div>
                <!-- end row-->
            </div>
                        <button onclick="compareSelectedProperties()">Compare</button>
            
        </div>
    </div>

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
    <script src="js/script.js"></script>
</body>


</html>
<%
    } // End of the if-else block
%>