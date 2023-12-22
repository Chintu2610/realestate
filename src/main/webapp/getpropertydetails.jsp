<%@ page language="java" contentType="application/json" %>
<%@ page import="java.sql.*, java.util.HashMap, java.util.Map, java.sql.PreparedStatement, java.sql.ResultSet,
 java.sql.SQLException, java.util.ArrayList, java.util.List,
 com.real.bean.AddProperty, com.real.utility.DBUtil" %>
<%@ page import="com.google.gson.Gson" %>

<%
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

List<AddProperty> filteredProperties = new ArrayList<>(); 
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;

try {
    connection = DBUtil.provideConnection();
    String propertyType = request.getParameter("type");

    String sql = "SELECT property_id, status, age, dimensions, city, highlights, amenities, " +
            "price, listed_date FROM property WHERE type = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, propertyType);
    resultSet = preparedStatement.executeQuery();

    List<Map<String, String>> propertyList = new ArrayList<>();
    while (resultSet.next()) {
        Map<String, String> propertyDetails = new HashMap<>();
        propertyDetails.put("property_id", resultSet.getString("property_id"));
        propertyDetails.put("status", resultSet.getString("status"));
        propertyDetails.put("age", resultSet.getString("age"));
        propertyDetails.put("dimensions", resultSet.getString("dimensions"));
        propertyDetails.put("city", resultSet.getString("city"));
        propertyDetails.put("highlights", resultSet.getString("highlights"));
        propertyDetails.put("amenities", resultSet.getString("amenities"));
        propertyDetails.put("price", resultSet.getString("price"));
        propertyDetails.put("listed_date", resultSet.getString("listed_date"));

        propertyList.add(propertyDetails);
    }

    String jsonData = new Gson().toJson(propertyList);
    out.print(jsonData);
} catch (Exception e) {
    e.printStackTrace();
    out.print("{\"error\":\"" + e.getMessage() + "\"}");
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
