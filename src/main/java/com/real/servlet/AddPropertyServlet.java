package com.real.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.real.utility.DBUtil;

@WebServlet("/AddPropertyServlet")
public class AddPropertyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        commonLogic(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        commonLogic(request, response);
    }

    private void commonLogic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	
        	String name = request.getParameter("name");
            String mobile = request.getParameter("mobile");
            String Status = request.getParameter("Status");
            String type = request.getParameter("type");
            String age = request.getParameter("age");
            String dimensions = request.getParameter("dimensions");
            String city = request.getParameter("city");
            String highlights = request.getParameter("highlights");
            String amenities = request.getParameter("amenities");
            String price = request.getParameter("price");
            String listeddate = request.getParameter("listeddate");
            String ishighlight = request.getParameter("ishighlight");
            String image = request.getParameter("image");


            // Perform database operations to save property and features
            Connection conn = DBUtil.provideConnection();
            if (conn != null) {
                PreparedStatement propertyStatement = conn.prepareStatement(
                        "INSERT INTO property (name, mobile,Status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted,image) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)",
                        PreparedStatement.RETURN_GENERATED_KEYS
                );
                
                
                propertyStatement.setString(1, name);
                propertyStatement.setString(2, mobile);
                propertyStatement.setString(3, Status);
                propertyStatement.setString(4, type);
                propertyStatement.setString(5, age);
                propertyStatement.setString(6, dimensions);
                propertyStatement.setString(7, city);
                propertyStatement.setString(8, highlights);
                propertyStatement.setString(9, amenities);
                propertyStatement.setString(10, price);
                propertyStatement.setString(11, listeddate);
                propertyStatement.setString(12, ishighlight);
                propertyStatement.setString(13, image);
                
                
                String[] featurename = request.getParameterValues("featurename");
                String[] typename = request.getParameterValues("typename");

                
                int affectedRows = propertyStatement.executeUpdate();

                if (affectedRows > 0) {
                    ResultSet generatedKeys = propertyStatement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        String propertyId = generatedKeys.getString(1);

                        // Create a single prepared statement for batch insert of property features
                        String featureInsertSQL = "INSERT INTO property_features (feature_name, type_name,property_id) VALUES (?, ?, ?)";
                        PreparedStatement featureStatement = conn.prepareStatement(featureInsertSQL);

                        for (int i = 0; i < featurename.length; i++) {
                            
                            featureStatement.setString(1, featurename[i]);
                            featureStatement.setString(2, typename[i]);
                            featureStatement.setString(3, propertyId);

                            // Add the current statement to the batch
                            featureStatement.addBatch();
                        }

                        // Execute the batch insert
                        featureStatement.executeBatch();
                        featureStatement.close();
                    }

                    // Close the database connection
                    conn.close();
                    propertyStatement.close();
                }
            }

            // Redirect to a success page
            response.sendRedirect("propertyview.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions here and redirect to an error page if needed
            response.sendRedirect("error.jsp");
        }
    }
}
