<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RealEstate Title</title>
    <!-- Include your CSS files, if any -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/feathericon.css">
    
    <style>
        /* Add a class to the body to apply specific styling */
        .sticky-header-active .navbar {
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        /* Adjust the padding to ensure content isn't hidden behind the fixed header */
        .sticky-header-active .content {
            padding-top: 80px; /* Adjust as needed based on your header height */
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color:#6c757d; /* Adjust as needed */
            color: white; /* Adjust as needed */
        }

        .navbar-left img {
            max-width: 100%;
            height: auto;
        }

        .navbar-right ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar-right li {
            margin-left: 10px;
        }

        /* Add the following styles for alignment */
        .navbar-right {
            margin-left: auto;
        }
        
    </style>
</head>
<body>

<!-- Header Section -->
<nav class="navbar bg">
    <div class="navbar-left">
        <a href="dashboard.jsp">
            <img src="./images/logo/logo.png" style="width: 100%; height: 70px;" alt="Logo">
        </a>
    </div>
    
    <div class="navbar-right">
        <ul>
            <li>
                <a class="nav-link" href="index.jsp">
                    <button type="button" class="btn btn-primary btn-block">Home</button>
                </a>
            </li>
            
            <li>
                <a class="nav-link" href="logout.jsp" onclick="return confirm('Are you sure you want to log out?')">
                    <button type="button" class="btn btn-success">Logout</button>
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- /Header Section -->

<!-- Your Page Content Goes Here -->
<div class="content">
    <!-- Add your existing content here -->
</div>

<!-- Include your JavaScript files, if any -->
<script src="js/script.js"></script>

<script>
    // Function to handle scroll and apply sticky header
    function handleScroll() {
        var navbar = document.querySelector('.navbar');

        if (window.scrollY > navbar.offsetTop) {
            document.body.classList.add('sticky-header-active');
        } else {
            document.body.classList.remove('sticky-header-active');
        }
    }

    // Attach the scroll event listener
    window.addEventListener('scroll', handleScroll);

    // Call the handleScroll function on page load (in case the page is already scrolled)
    handleScroll();
</script>

</body>
</html>
