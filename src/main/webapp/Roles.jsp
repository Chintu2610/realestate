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
<title>Homex - Real Estate Template</title>
<!-- Meta Tags -->
	
<link rel="shortcut icon" href="images/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link   -->

	  <link rel="stylesheet" href="css/YouTubePopUp.css">
	  <link rel="stylesheet" href="css/feathericon.css">
	 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<!--	Title    -->
<title>Homex - Real Estate Template</title>
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
		 
	
<div class="page-wrapper">
	 
<div class="content container-fluid">
<form action="./AddRolesSrv" method="post">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div clas					s="modal-header">
                    <h5 class="modal-title">Add Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role Name<span class="text-danger">*</span></label>
                                    <input name="rolename" required class="form-control" type="text">
                                </div>
                               </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Description</label>
                                    <input name="description" required class="form-control" type="text">
                                </div>
                               </div>
                             <div class="submit-section">
                            <button type="submit" name="add_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                      </div>
                    </div>
                  </div>
               </div>
             </form>
           </div>
       

         
         <form action="./EditRoleSrv" method="post">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RoleID</label>
                                    <input name="roleId" required class="form-control" type="text">
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role Name<span class="text-danger">*</span></label>
                                    <input name="rolename" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Description</label>
                                    <input name="description" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="submit-section">
                            <button type="submit" name="edit_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                          </div>
                      </div>
                    </div>
               </div>
          </form>
      
            <form action="./DeleteRoleSrv" method="post">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role ID<span class="text-danger">*</span></label>
                                    <input name="roleid" required class="form-control" type="text">
                              </div>
                            </div>
                            </div> 
                           <div class="submit-section">
                            <button type="submit" name="delete_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                      </div>
                    </div>               
                  </div>
               </form>
             </div>
           </div>
          
         
<!--	Js Link
============================================================--> 
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
<script src="js/YouTubePopUp.jquery.js"></script> 
<script src="js/validate.js"></script> 
<script src="js/jquery.cookie.js"></script> 
<script src="js/custom.js"></script>
<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Custom JS -->
    <script src="js/script.js"></script>



     </body>
</html>


<%
   }
%>