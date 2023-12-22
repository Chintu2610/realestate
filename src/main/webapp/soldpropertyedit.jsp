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
String id = request.getParameter("id");
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

<!--	Fonts
	========================================================-->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link
	========================================================-->
	
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
            margin-top: 10%; /* Adjust as needed to center vertically on the page */
        }
    </style>

<!--	Title
	=========================================================-->
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
                    <div class="row">
                        <div class="col">
                            <h3 class="page-title">Sales Property</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                <li class="breadcrumb-item active">Sales Property</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

                <!-- Property Details Form -->
               <div class="row justify-content-center">
    <div class="col-lg-8">
        <h2 class="text-secondary">Image & Status</h2>
        <hr>
        <form action="./SoldUpdateServlet" method="post" onsubmit="hidePropertyIdDiv()">
            <div class="row">
                <!-- Left side -->
                <div class="col-md-6">
                <% 
                List<AddProperty> pro = PropertyDAO.getPropertyBypId(id);
                for(AddProperty proo : pro){
                %>
                    <div class="form-group" id="propertyIdDiv">
                        <label for="propertyId">Property ID <span class="text-danger">*</span></label>
                        <input readonly value=<%=proo.getPropertyId()%> name="id" id="id" class="form-control" required onblur="fetchPropertyDetails()">
                    </div>
                    <div class="form-group" id="propertyStatusDiv">
                        <label for="propertyStatus">Property Status <span class="text-danger">*</span></label>
                        <select name="propertystatus" id="propertystatus" class="form-control" onchange="showStatusMessage()">
                            <option value="status">Status</option>
                            <option value="block">Block</option>
                            <option value="reservation">Reservation</option>
                        </select>
                    </div>
                    <div id="statusMessage" style="display: none;"></div>
                    <div id="soldDiv">
                        <label for="soldStatus">Sold Status <span class="text-danger">*</span></label>
                        <select name="soldstatus" id="soldstatus" class="form-control">
                            <option value="status">Status</option>
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                        </select>
                    </div>
                   
                  <img id="soldStamp" src="" alt="Sold Property Stamp" style="display: none;">
                    
                    <div id="statusMessagePending" style="display: none;">Property status is pending.</div>
                    <div id="statusMessageCompleted" style="display: none;">Property has been sold!</div>
                </div>

                <!-- Right side -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Sold Price <span class="text-danger">*</span></label>
                        <input name="soldprice" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Sold date <span class="text-danger">*</span></label>
                        <input class="form-control" name="solddate" required type="date">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Submit" class="btn btn-primary">
                    </div>
                    <% } }%>
                </div>
            </div>
        </form>
    </div>
</div>

                <!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
            </div>
        </div>
    </div>

	<!--	Submit property   -->
        
        
       
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    	
<!-- Wrapper End --> 

<script>
document.getElementById("soldstatus").addEventListener("change", function() {
    var soldStatus = this.value;
    var statusMessageDivPending = document.getElementById("statusMessagePending");
    var statusMessageDivCompleted = document.getElementById("statusMessageCompleted");

    // Hide all status message divs
    statusMessageDivPending.style.display = "none";
    statusMessageDivCompleted.style.display = "none";

    // Show corresponding message
    if (soldStatus === "pending") {
        statusMessageDivPending.style.display = "block";
    } else if (soldStatus === "completed") {
        statusMessageDivCompleted.style.display = "block";
    }
});
</script>

<script>
function showStatusMessage() {
    var statusSelect = document.getElementById("propertystatus");
    var soldStatusSelect = document.getElementById("soldstatus");
    var statusMessageDiv = document.getElementById("statusMessage");
    var statusMessageDivCompleted = document.getElementById("statusMessageCompleted");
    var propertyImage = document.getElementById("propertyImage");
    var soldStampImage = document.getElementById("soldStamp");

    // Reset the message div and hide the sold stamp image
    statusMessageDiv.innerHTML = "";
    statusMessageDiv.style.display = "none";
    statusMessageDivCompleted.innerHTML = "Property has been sold!";
    statusMessageDivCompleted.style.display = "none";
    soldStampImage.style.display = "none";
    
    // Get the selected option values
    var selectedStatus = statusSelect.options[statusSelect.selectedIndex].value;
    var selectedSoldStatus = soldStatusSelect.options[soldStatusSelect.selectedIndex].value;

    // Update the image source based on the selected soldStatus
    if (selectedStatus === "status") {
        // Handle other statuses or reset the image source if needed
    } else if (selectedStatus === "sold") {
        if (selectedSoldStatus === "pending") {
            propertyImage.src = "pending_sold_stamp_image.jpg";
        } else if (selectedSoldStatus === "completed") {
            propertyImage.src = "completed_sold_stamp_image.jpg";
            soldStampImage.style.display = "block"; // Show the sold stamp image
        }
    }

    // Show corresponding message
    if (selectedStatus === "block") {
        // Your block message logic here
        statusMessageDiv.innerHTML = "This property is blocked for 5 minutes.";
        statusMessageDiv.style.display = "block";

        var remainingTime = 5 * 60; // 5 minutes in seconds

        var timerInterval = setInterval(function () {
            var minutes = Math.floor(remainingTime / 60);
            var seconds = remainingTime % 60;

            statusMessageDiv.innerHTML = "Property blocked for " + minutes + " minutes and " + seconds + " seconds.";

            remainingTime--;

            if (remainingTime < 0) {
                clearInterval(timerInterval);
                statusMessageDiv.innerHTML = "Property unblocked.";
                statusSelect.value = "resume";
                statusMessageDiv.style.display = "none";
            }
        }, 1000); // Update every 1000 milliseconds (1 second)
    } else if (selectedStatus === "resume") {
        // Your resume message logic here
        statusMessageDiv.innerHTML = "Advance has already been given for this property.";
        statusMessageDiv.style.display = "block";
    } else if (selectedStatus === "sold" && selectedSoldStatus === "completed") {
        statusMessageDivCompleted.style.display = "block";
    }
}
</script>




<!--	Js Link
============================================================--> 
<script src="js/jquery.min.js"></script> 
<script src="js/tinymce/tinymce.min.js"></script>
<script src="js/tinymce/init-tinymce.min.js"></script>
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
<script src="js/custom.js"></script>
</body>
</html>

