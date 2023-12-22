<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page errorPage="" %>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Meta Tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="images/favicon.ico">

<!--	Fonts   -->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link
	========================================================-->
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

<!--	Title   -->
<title>Homex - Real Estate Template</title>
</head>

<body>
    <!-- Header Section -->
    <%@ include file="header.jsp" %>
    <br /><br /><br /><br>

    <%!
        // Define your Java methods here
        // Implement necessary functions for handling database interactions and email sending
    %>

    <%!
        // Define your variables here
        String token = "";
        String error = ""; // Initialize your error variable
        String msg = ""; // Initialize your message variable
    %>

    <% if (request.getParameter("token") != null) {
        token = request.getParameter("token");
        out.println(token); // Print the token
    } %>

    <!-- Pricing Section -->
    <section class="pricing-section spad set-bg" data-setbg="img/gym3.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <!-- Add your content for the first column here -->
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="pricing-item entermediate">
                        <div class="pi-top">
                            <h2> Welcome to Reset Password</h2><br />
                            <!-- Add your content here -->
                        </div>
                       <%--  <% if (error != null) { %>
                            <div class="errorWrap" style="color: red;"><strong>ERROR</strong>: <%= error %> </div>
                        <% } else if (msg != null) { %>
                            <div class="succWrap" style="color: red;"><strong>Error</strong>: <%= msg %> </div>
                        <% } %>
 --%>
                        <form class="singup-form contact-form" method="GET" action="./ResetPasswordServlet">
                            <div class="row">
                                  <div class="col-md-12">
                                <label>Re-enter email</label>
                                    <input type="text" name="email" placeholder="Enter new password">
                                </div>
                                <div class="col-md-12">
                                <label>newpassword</label>
                                    <input type="password" name="newpassword" placeholder="Enter new password">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                 <label>confirmpassword</label>
                                    <input type="password" name="confirmpassword" placeholder="Confirm new password">
                                </div>
                            </div>
                            <input type="hidden" name="token" value="<%= token %>">
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" name="reset" value="Reset Password"> Reset</button>
                                </div>
                            </div>
                        </form>
                        <!-- Include your Java code to handle password reset form submission here -->
                    </div>
                </div>
            </div>
        </div>
    </section>

   <!--	Js Link      --> 
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
		
</body>
</html>
