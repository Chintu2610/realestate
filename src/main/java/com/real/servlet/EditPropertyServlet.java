package com.real.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.serviceimpl.AddPropertyServiceImpl;

@WebServlet("/EditPropertyServlet")
public class EditPropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the request
        String id = request.getParameter("id");
        String pname = request.getParameter("pname");
        String pmobile = request.getParameter("pmobile");
        String status = request.getParameter("status");
        String type = request.getParameter("type");
        String age = request.getParameter("age");
        String dimensions = request.getParameter("dimensions");
        String city = request.getParameter("city");
        String highlights = request.getParameter("highlights");
        String amenities = request.getParameter("amenities");
        String price = request.getParameter("price");
        String listeddate = request.getParameter("listeddate");
        String ishighlight = request.getParameter("ishighlight");
        
        String description = request.getParameter("description");
        String user = request.getParameter("user");

        AddPropertyServiceImpl propertyService = new AddPropertyServiceImpl();
        String statusMessage = propertyService.editProperty(id,pname, pmobile, status, type, age, dimensions, city,
                highlights, amenities, price, listeddate, ishighlight,  description, user);

        // Forward the status message to the JSP page
        RequestDispatcher rd = request.getRequestDispatcher("propertyview.jsp?message=" + statusMessage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
