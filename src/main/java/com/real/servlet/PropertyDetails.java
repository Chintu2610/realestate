package com.real.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.bean.AddProperty;
import com.real.serviceimpl.PropertyDAO;

@WebServlet("/PropertyDetailsServlet")
public class PropertyDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("in property details srv");
        // Retrieve the property ID from the request parameter
        String propertyId = request.getParameter("propertyId");
        List<AddProperty> editproperty=PropertyDAO.getPropertyBypId(propertyId);
        
     // Convert the property details to JSON format
        String jsonResponse = convertPropertyDetailsToJson(editproperty);
        // Set the content type and write the JSON response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush(); 
    }
    private String convertPropertyDetailsToJson( List<AddProperty> propertyDetails) {
        // Convert property details to JSON format
        // You can use a JSON library like Jackson or Gson for more complex objects
        // For simplicity, a basic JSON string is created here
    	AddProperty myprop=propertyDetails.get(0);
    	return "{" +
        "\"id\":\"" + myprop.getPropertyId() + "\"," +
        "\"propertyName\":\"" + myprop.getPname() + "\"," +
        "\"mobileNumber\":\"" + myprop.getPmobile() + "\"," +
        "\"status\":\"" + myprop.getStatus() + "\"," +
        "\"type\":\"" + myprop.getType() + "\"," +
        "\"age\":\"" + myprop.getAge() + "\"," +
        "\"dimensions\":\"" + myprop.getDimensions() + "\"," +
        "\"city\":\"" + myprop.getCity() + "\"," +
        "\"highlights\":\"" + myprop.getHighlights() + "\"," +
        "\"amenities\":\"" + myprop.getAmenities() + "\"," +
        "\"price\":\"" + myprop.getPrice() + "\"," +
        "\"listedDate\":\"" + myprop.getListedDate() + "\"," +
        "\"isHighlighted\":\"" + myprop.getIsHighlighted() + "\"," +
        "\"description\":\"" + myprop.getDescription() + "\"" +
        "}";
    } 
}

