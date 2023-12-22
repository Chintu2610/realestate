<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddUserlist" %>
<%@ page import="com.real.serviceimpl.UserDAO" %>
<!DOCTYPE html>
<html lang="en">

<%
    // Getting the username from the session
    String username = (String) session.getAttribute("username");
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>LM Homes | Admin</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

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

    <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<form action="./UserServlet" method="post">

   <!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->

    <!-- Main Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title"> User List</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">User List</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Add User Form -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Add User</h4>
                        </div>
                        <div class="card-body">
                            
                                <!-- Add your form fields here -->
                                              <div class="form-group row">
													<label class="col-lg-2 col-form-label">ID</label>
													<div class="col-lg-9">
														<input class="form-control" name="id" >
													</div>
												</div>
                                
                                                 <div class="form-group row">
													<label class="col-lg-2 col-form-label">Username</label>
													<div class="col-lg-9">
														<input class="form-control" name="username">
													</div>
												</div>

                                                <div class="form-group row">
													<label class="col-lg-2 col-form-label">Email</label>
													<div class="col-lg-9">
														<input class="form-control" name="email">
													</div>
												</div>

                                                <div class="form-group row">
													<label class="col-lg-2 col-form-label">Phone</label>
													<div class="col-lg-9">
														<input class="form-control" name="phone">
													</div>
												</div>

                                              <div class="form-group row">
													<label class="col-lg-2 col-form-label">Password</label>
													<div class="col-lg-9">
														<input class="form-control" name="password" >
													</div>
												</div>

                                             <div class="form-group row">
													<label class="col-lg-2 col-form-label">Image</label>
													<div class="col-lg-9">
														<input class="form-control" name="image" type="file">
													</div>
												</div>

                               <div class="form-group row">
													<label class="col-lg-2 col-form-label">RoleID</label>
													<div class="col-lg-9">
														<input class="form-control" name="roleid" >
													</div>
												</div>

                                
											<input type="submit" value="Submit" class="btn btn-primary"name="add" style="margin-left:200px;">
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Add User Form -->

            <!-- User List Table -->
            <div class="row">
    <div class="col-sm-12">
        <div class="card">
            <h2>User List</h2>
            
            <table class="table table-striped custom-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Password</th>
                        <th>Image</th>
                        <th>Role ID</th>
                        <th>Action</th>
                    </tr>
                </thead>
               <tbody>
                               <%
										   int start = 0;
										   int limit = 25;
										   String usernameFilter = request.getParameter("username");
										   String idFilter = request.getParameter("id");
										
										   List<AddUserlist> resultSet;
										
										   String whereClause = "";
										
										   if (usernameFilter != null && !usernameFilter.isEmpty()) {
										       whereClause = "username = '" + usernameFilter + "'";
										   }
										
										   if (idFilter != null && !idFilter.isEmpty()) {
										       if (!whereClause.isEmpty()) {
										           whereClause += " AND ";
										       }
										       whereClause += "id = '" + idFilter + "'";
										   }
										
										   if (!whereClause.isEmpty()) {
										       UserDAO userDao = new UserDAO();
										       resultSet = userDao.getAllUsers();
										   } else {
										       UserDAO userDao = new UserDAO();
										       resultSet = userDao.getAllUsers();
										   }
										   
										    for (int i = 0; i < resultSet.size(); i++) {
										        AddUserlist userlist = resultSet.get(i);
										%>
										    <tr>
										        <td><%= userlist.getId() %></td>
										        <td><%= userlist.getUsername() %></td>
										        <td><%= userlist.getEmail() %></td>
										        <td><%= userlist.getPhone() %></td>
										        <td><%= userlist.getPassword() %></td>
										        <td><%= userlist.getImage() %></td>
										        <td><%= userlist.getRoleId() %></td>
										        <td>
										            <a href="UserServlet?action=edit&id=<%= userlist.getId() %>">Edit</a>
										            <a href="UserServlet?action=delete&id=<%= userlist.getId() %>">Delete</a>
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

            <!-- /User List Table -->

        </div>
    </div>
    <!-- /Main content -->

    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>
    <!-- Datatables JS -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/dataTables.responsive.min.js"></script>
    <script src="js/responsive.bootstrap4.min.js"></script>
    <script src="js/dataTables.select.min.js"></script>
    <script src="js/dataTables.buttons.min.js"></script>
    <script src="js/buttons.bootstrap4.min.js"></script>
    <script src="js/buttons.html5.min.js"></script>
    <script src="js/buttons.flash.min.js"></script>
    <script src="js/buttons.print.min.js"></script>
    <!-- Custom JS -->
    <script src="js/script.js"></script>
</form>
</body>

</html>
