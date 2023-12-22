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
	
		<!-- Main Wrapper -->
		
		<!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">Agent</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Agent</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h2 class="card-title">Agent List</h2>
									
								</div>
								
								
								
								<div class="card-body">
								
								 <div class="form-group row">
													<label class="col-lg-2 col-form-label">AgentID</label>
													<div class="col-lg-9">
														<input class="form-control" name="id" >
													</div>
												</div>
                                
                                                 <div class="form-group row">
													<label class="col-lg-2 col-form-label">AgentName</label>
													<div class="col-lg-9">
														<input class="form-control" name="username">
													</div>
												</div>

                                                <div class="form-group row">
													<label class="col-lg-2 col-form-label">AgentEmail</label>
													<div class="col-lg-9">
														<input class="form-control" name="email">
													</div>
												</div>

                                                <div class="form-group row">
													<label class="col-lg-2 col-form-label">AgentPhone</label>
													<div class="col-lg-9">
														<input class="form-control" name="phone">
													</div>
												</div>

                                              <div class="form-group row">
													<label class="col-lg-2 col-form-label">AgentType</label>
													<div class="col-lg-9">
														<input class="form-control" name="type" >
													</div>
												</div>

                                             <div class="form-group row">
													<label class="col-lg-2 col-form-label">AgentImage</label>
													<div class="col-lg-9">
														<input class="form-control" name="image" type="file">
													</div>
												</div>
												<div class="text-left">
                                                   <input type="submit" value="Submit">								
                                  			</div>
												<br>
												
									<table id="basic-datatable" class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Utype</th>
													<th>Image</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                        
                                            <tbody>
											
                                                <tr>
                                                    <td><?jsp echo $cnt; ?></td>
                                                    <td><?jsp echo $row['1']; ?></td>
                                                    <td><?jsp echo $row['2']; ?></td>
                                                    <td><?jsp echo $row['3']; ?></td>
                                                    <td><?jsp echo $row['5']; ?></td>
													<td><img src="user/<?jsp echo $row['6']; ?>" height="50px" width="50px"></td>
                                                    <td><a href="useragentdelete.jsp?id=<?jsp echo $row['0']; ?>">Delete</a></td>
                                                </tr>
                                               
                                               
                                            </tbody>
                                        </table>
								</div>
							</div>
						</div>
					</div>
				
				</div>			
			</div>
			<!-- /Main Wrapper -->

		
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
		<script  src="js/script.js"></script>
		
    </body>
</html>
