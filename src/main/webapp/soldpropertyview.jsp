<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.soldproperty" %>
<%@ page import="com.real.serviceimpl.SoldPropertyDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
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

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

</head>

<body> 
    <div class="main-wrapper">
        <!-- Header start -->
        <jsp:include page="header.jsp" />
        <!-- Header end -->

        <!-- Sidebar start -->
        <jsp:include page="sidebar.jsp" />
        <!-- Sidebar end -->

        <!-- Page Content -->
        <div class="page-wrapper">
            <div class="content container-fluid">

                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col">
                            <h3 class="page-title">Soldproperty</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">index</a></li>
                                <li class="breadcrumb-item active">Soldproperty View</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

                <div class="row">
							    <div class="col-sm-12">
							        <div class="card">
							            <div class="card-header">
							                <table id="basic-datatable" class="table">
							                    <thead>
							                        <tr>
							                            <th>Property ID</th>
							                            <th>propertystatus</th>
							                            <th>soldstatus</th>
							                            <th>soldprice</th>
							                            <th>Sold Date</th>
							                           <!--  <th>Image</th> -->
							                        </tr>
							                    </thead>
							                    <tbody>
							                        <%
							                            SoldPropertyDAO soldPropertyDao = new SoldPropertyDAO();
							                            List<soldproperty> resultSet = soldPropertyDao.getAllSoldProperties();
							                            for (int i = 0; i < resultSet.size(); i++) {
							                                soldproperty soldProperty = resultSet.get(i);
							                        %>
							                        <tr>
							                            <td><%= soldProperty.getPropertyid() %></td>
							                            
							                            <td><%= soldProperty.getPropertystatus() %></td>
							                            <td><%= soldProperty.getSoldstatus() %></td>
							                            <td><%= soldProperty.getSoldprice() %></td>
							                            <td><%= soldProperty.getSolddate() %></td>
							                           <%--  <td><%= soldProperty.getImage() %></td> --%>
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

                <!-- Footer start -->
                <jsp:include page="footer.jsp" />
                <!-- Footer end -->
            </div>
        </div>
    </div>

    <!-- /Main Wrapper -->

    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Datatables JS -->
  
    
    <!-- Custom JS -->
    <!--
    <script src="js/script.js"></script>
	-->
    <!-- Script for DataTable -->
    <script>
        $(document).ready(function () {
            $('#basic-datatable').DataTable({
                // Add any additional options here
            });
        });
    </script>
</body>
</html>
