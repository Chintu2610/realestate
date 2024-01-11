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
 <link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<!--	Title
	=========================================================-->
<title>Homex - Real Estate Template</title>
</head>
<body>

<!--	Page Loader
=============================================================
<div class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
	<div class="d-flex justify-content-center y-middle position-relative">
	  <div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	  </div>
	</div>
</div>
--> 



    <!-- Your page content remains the same -->
 
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
		 
		 
		<!--	Submit property   -->
        <div class="full-row bg-gray">
            <div class="container">
                    <div class="row mb-5">
						<div class="col-lg-12">
							<h2 class="text-secondary double-down-line text-center">EMI Calculator</h2>
                        </div>
					</div>
					
					 <div style="text-align: center;">
					 <div style="border: 2px solid #ccc; padding: 10px; border-radius: 5px; margin-bottom: 20px; background-color:#a8ebf3;">
 
        <form id="loanCalculatorForm">
            <label for="amount">Enter Amount:</label>
            <!-- Remove the initial value to have an empty box -->
            <input type="number" id="amount" name="amount" required><br>

            <label for="months">Enter Month:</label>
            <input type="number" id="months" name="months" required><br>

            <label for="interest">Enter Interest Rate:</label>
            <input type="number" id="interest" name="interest" required><br>
            
            <button type="button" onclick="calculate()">Calculate</button>
        </form>
        </div>
        <br>
        <br>
		<div class="d-flex justify-content-center">
        <table class="items-list col-lg-6 " style="display: none;">
            <thead>
                <tr class="bg-primary">
                    <th class="text-white font-weight-bolder">Price</th>
                    <th class="text-white font-weight-bolder">Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr class="text-center font-18">
                    <td><b>Entered Amount</b></td>
                    <td><b id="displayAmount"></b></td>
                </tr>
                <tr class="text-center">
                    <td><b>Entered Month</b></td>
                    <td><b id="displayMonth"></b></td>
                </tr>
                <tr class="text-center">
                    <td><b>Entered Interest Rate</b></td>
                    <td><b id="displayInterest"></b></td>
                </tr>
                <tr class="text-center">
                    <td><b>Total Interest</b></td>
                    <td><b id="displayTotalInterest"></b></td>
                </tr>
                <tr class="text-center">
                    <td><b>Total Amount</b></td>
                    <td><b id="displayTotalAmount"></b></td>
                </tr>
                <tr class="text-center">
                    <td><b>Pay Per Month (EMI)</b></td>
                    <td><b id="displayPayPerMonth"></b></td>
                </tr>
            </tbody>
        </table>
        </div>
    </div>


            </div>
        </div>
	<!--	Submit property   -->
        
        
        
        
        
    </div>
    <!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
</div>
</div>
<!-- Wrapper End --> 

<!--	Js Link
============================================================--> 

<script>
        function calculate() {
            var amount = parseFloat(document.getElementById('amount').value);
            var months = parseInt(document.getElementById('months').value);
            var interest = parseFloat(document.getElementById('interest').value);

            var totalInterest = (amount * interest * months) / 100;
            var totalAmount = amount + totalInterest;
            var payPerMonth = totalAmount / months;

            document.getElementById('displayAmount').textContent = amount.toFixed(2);
            document.getElementById('displayMonth').textContent = months;
            document.getElementById('displayInterest').textContent = interest.toFixed(2) + '%';
            document.getElementById('displayTotalInterest').textContent = totalInterest.toFixed(2);
            document.getElementById('displayTotalAmount').textContent = totalAmount.toFixed(2);
            document.getElementById('displayPayPerMonth').textContent = payPerMonth.toFixed(2);
            
         // Show the table
            document.querySelector('.items-list').style.display = 'table';

        }
    </script>
    
    
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
<script src="js/custom.js"></script>



<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Custom JS -->
    <!--
    <script src="js/script.js"></script>
    -->
</body>
</html>


<%
   }
%>