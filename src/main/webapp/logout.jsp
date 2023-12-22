<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Initialize the session
    session = request.getSession();

    // Unset all of the session variables
    session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>

<h2>You have been successfully logged out.</h2>
<form action="logout.jsp" method="post">
    <input type="submit" value="Logout">
</form>
<%
    // Redirect to login page
    response.sendRedirect("index.jsp");
%>
</body>
</html>
