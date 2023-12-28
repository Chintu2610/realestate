<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, javax.servlet.*"%>

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
 <style>
    body {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        background-color: #f8f9fa; /* Add your desired background color */
    }

    .loginbox {
        max-width: 400px; /* Adjust the max-width as needed */
        width: 100%;
        text-align: center;
        margin-top: 50px; /* Add margin to center the login box */
    }

    /* Adjustments for the login form */
    .form-group {
        margin-bottom: 20px;
    }

    /* Make the login button the same width as the input fields */
    .account-btn {
        width: 100%;
        font-size: 16px; /* Adjust the font size as needed */
    }

    /* Increase the size of the input fields */
    .form-control {
        height: 50px; /* Adjust the height as needed */
        font-size: 16px; /* Adjust the font size as needed */
    }

    /* Center the forgot password link */
    .pt-2 {
        text-align: center;
    }

    /* Style adjustments for the alert messages */
    .alert {
        margin-bottom: 10px;
    }
</style>

</head>
<body>

<div id="page-wrapper">
    <div class="row"> 
        <!--	Banner   --->
        <div class="banner-full-row page-banner" >
            <div class="container">
                <div class="row">
                    
                    <div class="col-md-6">
                        <nav aria-label="breadcrumb" class="float-left float-md-right">
                           
                        </nav>
                    </div>
                </div>
            </div>
        </div>
         <!--	Banner   --->
		 
        <div class="page-wrappers login-body full-row bg-gray">
            <div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>Login</h1>
								<p class="account-subtitle">Access to our dashboard</p>
								
								<form method="post" action="./LoginSrv">
                            <div class="form-group">
                                <label>User Name</label>
                                <input class="form-control" name="username" required type="text">
                            </div>
                            <% if (request.getAttribute("wrongusername") != null) { %>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <strong>Oh Snapp!🙃</strong> Alert <b class="alert-link">UserName:</b> You entered a wrong UserName.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            <% } %>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label>Password</label>
                                    </div>
                                </div>
                                <input class="form-control" name="password" required type="password">
                            </div>
                            <% if (request.getAttribute("wrongpassword") != null) { %>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <strong>Oh Snapp!😕</strong> Alert <b class="alert-link">Password:</b> You entered wrong password.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            <% } %>
                            <div class="form-group text-center">
                                <button href="adminlist.jsp" class="btn btn-primary account-btn" name="login" type="submit">Login</button>
                                <div class="col-auto pt-2">
                                    <a class="text-muted float-right" href="forgot-password.jsp">Forgot password?</a>
                                </div>
                            </div>
                            
                        </form>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<!--	login  -->

        
        
       
    </div>
</div>
<!-- Wrapper End --> 

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