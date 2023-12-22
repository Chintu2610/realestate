<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.real.bean.AddProfile" %>
<%@ page import="com.real.serviceimpl.ProfileDAO" %>


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

 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Homex - Real Estate Template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="css/select2.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">

 <style>
    /* Custom styles for the table */
    #basic-datatable {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    #basic-datatable th, #basic-datatable td {
        padding: 12px; /* Adjust the padding for table cells */
        text-align: center;
        border: 1px solid #ddd;
        background-color: #f5f5f5; /* Change background color to a light shade */
    }

    #basic-datatable th {
        background-color: #e0e0e0; /* Change background color for table header */
    }
</style>
 
		 
    </head>
    
<body>

 <form action="AddProfileServlet" method="post">

<div class="main-wrapper">
    
        <!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
        
       <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
		 
		 <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
                
                 <div class="page-header">
                    <div class="row">
                        <div class="col">
                            <h3 class="page-title">Profile</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Profile View</li>
                            </ul>	
                        </div>
                    </div>
                </div>
        
      <div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Profile List</h2>
            </div>

            <div class="card-body">
                <table id="basic-datatable" class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th>State</th>
                            <th>Country</th>
                            <th>Pin Code</th>
                            <th>Phone Number</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
    <%
    ProfileDAO profileDao = new ProfileDAO();
    List<AddProfile> resultSet = profileDao.getAllProfiles();

    for (int i = 0; i < resultSet.size(); i++) {
        AddProfile profile = resultSet.get(i);
%>
    <tr>
        <td><%= profile.getId() %></td>
        <td><%= profile.getFirstName() %></td>
        <td><%= profile.getLastName() %></td>
        <td><%= profile.getGender() %></td>
        <td><%= profile.getAddress() %></td>
        <td><%= profile.getState() %></td>
        <td><%= profile.getCountry() %></td>
        <td><%= profile.getPinCode() %></td>
        <td><%= profile.getPhoneNumber() %></td>
       <td>
              <a href="profiledelete.jsp?id=<%= profile.getId() %>">Delete</a>
          </td>
    </tr>
    <%
    }
    %>
</tbody>

                </table>
            </div>
        </div>
    </div>
</div>
    </div>  
        <!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    </div>
</div>
</form>
<!-- Wrapper End --> 

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
<script src="js/custom.js"></script>
</body>
</html>

<%
   }
%>


