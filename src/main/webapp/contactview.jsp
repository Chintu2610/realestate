<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddContact" %>
<%@ page import="com.real.serviceimpl.ContactDAO" %>

<%
HttpSession sdsession = request.getSession(true);

// Retrieve the username attribute from the session
String username = (String) sdsession.getAttribute("username");
String roleIDString = (String) sdsession.getAttribute("RoleID");

if (roleIDString == null) {
    response.sendRedirect("login.jsp");
} else {
    
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>LM Homes | Admin</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

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
 
        <!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
		 
		  <div class="page-wrapper">
		 
		 <div class="content container-fluid">
		 
                <div class="page-header">
                    <div class="row">
                        <div class="col">
                            <h3 class="page-title">Contact</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Contact View</li>
                            </ul>	
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

                <!-- Contact List -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="card-title">Contact List</h2>
                            </div>

                            <div class="card-body">
                                <table id="basic-datatable" class="table">
                                    <thead>
                                        <tr>
                                            
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Subject</th>
                                            <th>Message</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                        ContactDAO contactDao = new ContactDAO();
                                        List<AddContact> resultSet = contactDao.getAllContacts();

                                        for (int i = 0; i < resultSet.size(); i++) {
                                            AddContact contact = resultSet.get(i);
                                        %>
                                        <tr>
                                            
                                            <td><%= contact.getName() %></td>
                                            <td><%= contact.getEmail() %></td>
                                            <td><%= contact.getPhone() %></td>
                                            <td><%= contact.getSubject() %></td>
                                            <td><%= contact.getMessage() %></td>
                                            <td>
                                                <a href="contactdelete.jsp?id=<%= contact.getCid() %>">Delete</a>
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
                <!-- /Contact List -->
<!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
            </div>
            <!-- /Page Content -->
        </div>
        <!-- /Page Wrapper -->
</div>
 
        <!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <!-- Custom JS -->
        <script src="js/script.js"></script>

    </body>

</html>

<%
   }
%>
