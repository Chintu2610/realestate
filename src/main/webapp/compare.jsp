<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>

<%
    // Retrieve the selected property IDs from the request parameter
    if(request.getParameter("selectedPropertyIds") == null) {
        response.sendRedirect("propertyview.jsp");
        return;  // Terminate the execution after redirect
    }
    String selectedPropertyIdsParam = request.getParameter("selectedPropertyIds");
    String[] selectedPropertyIds = selectedPropertyIdsParam.split(",");

    List<AddProperty> selectedProperties = new PropertyDAO().getPropertiesByIds(selectedPropertyIds);
 // Check the number of selected properties
    if (selectedProperties.size() < 2) {
%>
        <script>
            alert("Select at least 2 properties to compare.");
            window.location.href = "propertyview.jsp"; // Redirect to propertyview.jsp
        </script>
<%
        return;  // Terminate the execution after displaying the alert
    }

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Property Comparison</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Feathericon CSS -->
    <link rel="stylesheet" href="css/feathericon.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Custom CSS -->
    <style>
        .comparison-table td {
            padding: 20px;
            font-size: 12px;
        }

        .comparison-table img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto;
        }
    </style>
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
                            <h3 class="page-title">Property Comparison</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Property Comparison</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

                <!-- Comparison Tables -->
                <div class="row">
						    <!-- Loop through selected properties and display details -->
						    <% for (AddProperty property : selectedProperties) { %>
						        <div class="col-md-3">
						            <div class="card">
						                <!-- Inside the loop where you are displaying properties -->
                           <img src="<%= property.getImageUrl(request) %>" alt="Property Image" class="img-fluid">

						                <div class="card-body">
						                    <table class="table comparison-table">
						                        <tr>
						                            <td><strong>Property ID:</strong></td>
						                            <td><%= property.getPropertyId() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Status:</strong></td>
						                            <td><%= property.getStatus() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Type:</strong></td>
						                            <td><%= property.getType() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Age:</strong></td>
						                            <td><%= property.getAge() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Dimensions:</strong></td>
						                            <td><%= property.getDimensions() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>City:</strong></td>
						                            <td><%= property.getCity() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Highlights:</strong></td>
						                            <td><%= property.getHighlights() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Amenities:</strong></td>
						                            <td><%= property.getAmenities() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Price:</strong></td>
						                            <td><%= property.getPrice() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Listed Date:</strong></td>
						                            <td><%= property.getListedDate() %></td>
						                        </tr>
						                        <tr>
						                            <td><strong>Is Highlighted:</strong></td>
						                            <td><%= property.getIsHighlighted() %></td>
						                        </tr>
						                    </table>
						                </div>
						            </div>
						        </div>
						    <% } %>
						</div>

                <!-- /Comparison Tables -->
            </div>
        </div>
        <!-- /Page Wrapper -->
    </div>
    <!-- /Main Wrapper -->

    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Custom JS -->
    <!--
    <script src="js/script.js"></script>
    -->
</body>

</html>
