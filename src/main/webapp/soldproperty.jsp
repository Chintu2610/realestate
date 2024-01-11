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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

    <!-- CSS Link -->
    <link rel="stylesheet" href="css/YouTubePopUp.css">
    <link rel="stylesheet" href="css/feathericon.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="css/layerslider.css">
    <link rel="stylesheet" type="text/css" href="css/color.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/flaticon.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">

    <style>
        .vertical-center {
            margin-top: 10%; 
        }
    </style>

    <!-- Title -->
    <title>Homex - Real Estate Template</title>
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
                    <!-- Your existing page header content -->
                </div>
                <!-- /Page Header -->

                <!-- Property Details Form -->
                <form action="./SoldPropertyServlet" method="post">	
                            <div class="row">
                                <!-- First Column - Image & Status -->
                                <div class="col-lg-6">
                                    <h2 class="text-secondary">Image & Status</h2>
                                    <div class="form-group">
                                        <label>Type</label>
                                         <select class="form-control" name="type">
                                                <option value="">Select Type</option>
												<option value="apartment">Apartment</option>
												<option value="flat">Flat</option>
												<option value="bunglow">Bunglow</option>
												<option value="house">House</option>
												<option value="villa">Villa</option>
												<option value="office">Office</option>
                                            </select>
                                    </div>
                                         <div class="form-group">
                                            <button type="submit" name="filter" class="btn btn-primary w-100">Search Type</button>
                                        </div>
                                    </div>
                                  
                                </div>
                             </form>

                
            </div>
           <div style="height: 100px; width:1200px; padding: 0px; margin-left:0px; margin-top:20px;">
    				<!-- Your footer content goes here -->
     				<jsp:include page="footer.jsp" />
				</div>            		   		    
        </div>       
    </div>

    <!-- Submit property -->

    

    <!-- Wrapper End -->

    
    <script>
        function hidePropertyIdDiv() {
            document.getElementById("propertyIdDiv").style.display = "none";
        }

        function showStatusMessage() {
            var statusSelect = document.getElementById("propertyStatus");
            var statusMessageDiv = document.getElementById("statusMessage");

            // Reset the message div
            statusMessageDiv.innerHTML = "";
            statusMessageDiv.style.display = "none";

            // Get the selected option value
            var selectedStatus = statusSelect.options[statusSelect.selectedIndex].value;

            // Show corresponding message and start the timer if blocked
            if (selectedStatus === "block") {
                statusMessageDiv.innerHTML = "This property is blocked for 5 minutes.";
                statusMessageDiv.style.display = "block";

                var remainingTime = 5 * 60; // 5 minutes in seconds

                // Set a timer to update the remaining time every second
                var timerInterval = setInterval(function () {
                    var minutes = Math.floor(remainingTime / 60);
                    var seconds = remainingTime % 60;

                    statusMessageDiv.innerHTML = "Property blocked for " + minutes + " minutes and " + seconds + " seconds.";

                    // Decrement remaining time
                    remainingTime--;

                    if (remainingTime < 0) {
                        clearInterval(timerInterval);	
                        statusMessageDiv.innerHTML = "Property unblocked.";
                        // Update the select element to reflect the change
                        statusSelect.value = "received";
                        statusMessageDiv.style.display = "none";
                    }
                }, 1000); // Update every 1000 milliseconds (1 second)
            } else if (selectedStatus === "received") {
                statusMessageDiv.innerHTML = "Advance has already been given for this property.";
                statusMessageDiv.style.display = "block";
            } else if (selectedStatus === "sold") {
                statusMessageDiv.innerHTML = "This property has been sold.";
                statusMessageDiv.style.display = "block";
            }
        }
    </script>
    
<!--  <script>
    function getPropertyDetails() {
        // Get the selected type from the dropdown
        var selectedType = document.getElementById('type').value;

        // Make an AJAX request to fetch property details based on the selected type
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    // Parse the JSON response
                    var propertyDetails = JSON.parse(xhr.responseText);

                    // Update form fields with the fetched property details
                    document.getElementById('propertyId').value = propertyDetails.propertyId;
                    document.getElementById('propertyStatus').value = propertyDetails.status;
                    // Update other fields as needed
                } else {
                    console.error("Failed to fetch property details. Status code: " + xhr.status);
                }
            }
        };

        // Replace the URL with the actual endpoint that provides property details
        xhr.open("GET", "./SoldPropertyServlet?type=" + selectedType, true);
        xhr.send();
    }
</script>
  -->
    

    <!-- Js Link -->
    <script src="js/jquery.min.js"></script>
    <!-- Your existing script tags... -->
     <!-- <script src="js/custom.js"></script>. -->
</body>
</html>

<%
   }
%>
