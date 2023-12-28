<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Date" %>

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
                    <% List<AddProperty> proList = PropertyDAO.getPropertyBypId(id);
                    for (AddProperty proo : proList) { %>
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

                        <!-- Status messages below Property Status -->
                        <div id="statusMessageBlock" style="display: none;">Property is blocked.</div>
                        <div id="statusMessageReservation" style="display: none;">Property is reserved.</div>
                    </div>

                    <div id="statusMessage" style="display: none;"></div>
                </div>

                <!-- Right side -->
                <div class="col-md-6">
                    <div id="soldDiv" class="form-group">
                        <label for="soldStatus">Sold Status <span class="text-danger">*</span></label>
                        <select name="soldstatus" id="soldstatus" class="form-control" onchange="handleSoldStatusChange()">
                            <option value="status">Status</option>
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                        </select>

                        <!-- Display an icon when completed is selected -->
                        <div id="soldIcon" style="display: none;">
                            <!-- Use a Font Awesome icon for completed status -->
                            <i class="fas fa-check-circle"></i> Property Sold
                        </div>

                        <!-- Status messages below Sold Status -->
                        <div id="statusMessagePending" style="display: none;">Property status is pending.</div>
                        <div id="statusMessageCompleted" style="display: none;">Property has been sold!</div>
                    </div>

                    <div class="form-group">
                        <label>Sold Price <span class="text-danger">*</span></label>
                        <input name="soldprice" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Submit" class="btn btn-primary">
                    </div>
                    <% } %>
                </div>
            </div>
        </form>
    </div>
</div>



                <!-- Footer start -->
                <jsp:include page="footer.jsp" />
                <!-- Footer end -->
            </div>
        </div>
    </div>

    <!-- Submit property -->

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
                // Display the "sold" icon on the image
                showSoldIcon();
            }
        });
    </script>


    <script>
        document.getElementById("propertystatus").addEventListener("change", function() {
            showStatusMessage();
        });
    </script>
    
    
<script>
function showStatusMessage() {
    var statusSelect = document.getElementById("propertystatus");
    var statusMessageDiv = document.getElementById("statusMessage");

    // Reset the message div and hide it
    statusMessageDiv.innerHTML = "";
    statusMessageDiv.style.display = "none";

    // Get the selected option value
    var selectedStatus = statusSelect.options[statusSelect.selectedIndex].value;

    // Show corresponding message
    if (selectedStatus === "block" || selectedStatus === "reservation") {
        // Your block/reservation message logic here
        var statusMessage = selectedStatus === "block" ? "This property is blocked for 5 minutes." : "This property is reserved.";
        statusMessageDiv.innerHTML = statusMessage;
        statusMessageDiv.style.display = "block";

        if (selectedStatus === "block") {
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
        }
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

<%
}
%>
