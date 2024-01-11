<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>

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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Homex - Real Estate Template</title>
			
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png">
		
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
		<!-- <link rel="stylesheet" href="css/tstyles.css"> -->
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-6dXYJe7FuAe9tVFiivz3Apmazg8b5SFf7SA6zXKM1MTW2W91qZcH5+/ygoy1lYYzMZYZZPvGgO7YpVM5RWDZ6Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		
		
		<style>
    .highlight-item {
        position: relative;
        margin-bottom: 10px;
    }

    .button-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 5px;
    }

    .delete-button, .add-button {
        width: 30px; /* Adjust the width as needed */
        height: 30px; /* Adjust the height as needed */
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        border: 1px solid #ccc;
        background-color: #fff;
    }

    .delete-button {
        order: 1; /* Move delete button to the left */
    }

    .add-button {
        order: 2; /* Move add button to the right */
    }

    .form-control {
        width: calc(100% - 10px); 
    }
</style>

    	
    </head>
    <body>
    <form action="./AddPropertyServlet" method="post">
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
        <!-- Include your header HTML here -->
         <jsp:include page="header.jsp" />

        <!-- Sidebar -->
        <!-- Include your sidebar HTML here -->
        <jsp:include page="sidebar.jsp" />
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Property Add</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Index</a></li>
									<li class="breadcrumb-item active">Property Add</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-12">
								<div class="row">
								<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Name</label>
											<input name="name" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Mobile Number</label>
											<input name="mobile" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
										<label>Status</label>
											<select class="form-control" required name="Status">										
										          <option value="">Select Status</option>
										          <option value="rent">Rent</option>
										          <option value="sale">Sale</option>
											</select>
										</div>
									</div>
										<div class="col-sm-6 col-md-3">
									<label>Type</label>
									<select class="form-control" required name="type">										 
										<option value="">Select Type</option>
										<option value="apartment">Apartment</option>
										<option value="flat">Flat</option>
										<option value="bunglow">Bunglow</option>
										<option value="house">House</option>
										<option value="villa">Villa</option>
										<option value="office">Office</option>
										<option value="farmLands">Farm Lands</option>
										<option value="agricultureLands">Agriculture Lands</option>
									</select>
								</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>AGE</label>
											<input name="age" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Dimensions</label>
											<input name="dimensions" class="form-control">
										</div>
									</div>
    								<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>City</label>
											<input name="city" class="form-control">
										</div>
									</div>
						 
						              <div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Highlights <span class="text-danger">*</span></label>
												<input name="highlights" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Amenities <span class="text-danger">*</span></label>
												<input name="amenities" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Price <span class="text-danger">*</span></label>
												<input name="price" class="form-control">
										</div>
									</div>
								<div class="col-sm-6 col-md-3">
									<div class="form-group">
										<label>Listed_date <span class="text-danger">*</span></label>
										<input class="form-control" name="listeddate" required type="date">
									</div>
								</div>
									<div class="col-sm-6 col-md-3">
											<label>Is_Highlighted <span class="text-danger">*</span></label>
									    <select name="ishighlight" class="form-control">
									        <option value="1">Yes</option>
									        <option value="0">No</option>
									    </select>
									</div>
							            <div class="col-md-12 form-group">
								            <label for="image">Image</label>
								            <input type="file" placeholder="Select Image" name="image" class="form-control" id="image" required>
								        </div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="table-responsive">
											<table class="table table-hover table-white" id="propertyfeature" >
												<thead>
													<tr>
														<th style="width: 20px">ID</th>
														<th class="col-md-6">Feature_Name</th>
														<th style="width:100px;">Type_Name</th>
														
														<th> </th>
													</tr>
												</thead>
												<tbody>
												<tr>
													<td>1</td>
													
													<td>
									                <select name="featurename" class="form-control" style="min-width:200px">
									                    <option value="gym">Gym</option>
									                    <option value="swimmingpool">Swimming Pool</option>
									                    <option value="sportsclub">Sports Club</option>
									                     <option value="Security">Security</option>
									                    <option value="Garden">Garden</option>
									                    
									                    
									                   
									                </select>								
							      					</td>
													<td>
														<input name="typename" class="form-control" style="min-width:500px" type="text">
													</td>
													<!--  <td>
										                <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addItem(this)"><i class="fa fa-plus"></i> </a>
										            </td>
										            <td>
										                <a href="javascript:void(0)" class="text-danger font-18 disabled-link"  title="Remove" ><i class="fa fa-trash-o"></i> </a>
										            </td> -->
												</tr>	
												</tbody>
											</table>
										</div>
										
									</div>
								</div>
								<div class="submit-section">
								<!--<button class="btn btn-primary submit-btn m-r-10">Save &amp; Send</button>-->
									<button class="btn btn-primary submit-btn">Save</button>
								</div>

						</div>
					</div>
				</div>
				<!-- /Page Content -->
				
			</div>
			<!-- /Page Wrapper -->
			
        </div>
	
		<!-- Inside your HTML form -->
		<script>
    function deleteHighlight(button) {
        var highlightItem = button.closest('.highlight-item');
        // Check if it's the only highlight item before removing
        if (document.querySelectorAll('.highlight-item').length > 1) {
            highlightItem.remove();
        }
    }

    function addHighlight() {
        var highlightContainer = document.querySelector('.highlights-container');

        // Create a new highlight item
        var highlightItem = document.createElement('div');
        highlightItem.className = 'highlight-item';

        // Input field for the highlight
        var highlightInput = document.createElement('input');
        highlightInput.name = 'highlights';
        highlightInput.className = 'form-control';
        highlightInput.placeholder = 'Enter Highlight';

        // Input field for the second value
        var secondInput = document.createElement('input');
        secondInput.name = 'secondValues';
        secondInput.className = 'form-control';
        secondInput.placeholder = 'Enter Second Value';

        // Button row
        var buttonRow = document.createElement('div');
        buttonRow.className = 'button-row';

        // Delete button on the left side
        var deleteButton = document.createElement('div');
        deleteButton.className = 'delete-button';
        deleteButton.innerHTML = '<i class="fas fa-minus"></i>';
        deleteButton.onclick = function () {
            deleteHighlight(this);
        };

        // Add button on the right side
        var addButton = document.createElement('div');
        addButton.className = 'add-button';
        addButton.innerHTML = '<i class="fas fa-plus"></i>';
        addButton.onclick = addHighlight;

        // Append elements to the button row
        buttonRow.appendChild(deleteButton);
        buttonRow.appendChild(addButton);

        // Append elements to the highlight item
        highlightItem.appendChild(buttonRow);
        highlightItem.appendChild(highlightInput);
        highlightItem.appendChild(secondInput);

        // Append the highlight item to the container
        highlightContainer.appendChild(highlightItem);
    }

    document.querySelector('.submit-btn').onclick = function () {
        var highlightInputs = document.querySelectorAll('.highlight-item input[name="highlights"]');
        var secondInputs = document.querySelectorAll('.highlight-item input[name="secondValues"]');
        var highlightsData = [];

        // Collect data from all highlight and second inputs
        highlightInputs.forEach(function (input, index) {
            var highlightData = {
                highlight: input.value,
                secondValue: secondInputs[index].value,
            };
            highlightsData.push(highlightData);
        });

        // Use AJAX to send data to the server
        // Replace 'your_server_endpoint' with your actual server endpoint
        fetch('your_server_endpoint', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ highlights: highlightsData }),
        })
        .then(response => response.json())
        .then(data => {
            console.log('Data saved successfully:', data);
        })
        .catch(error => {
            console.error('Error saving data:', error);
        });
    };
</script>



		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->	
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Custom JS -->
		<!--
		<script src="js/app.js"></script>
		 -->
				<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  
        </form>
    </body>
</html>

<%
   }
%>
