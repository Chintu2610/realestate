package com.real.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.real.serviceimpl.AddPropertyServiceImpl;

@WebServlet("/DeletePropertySrv")
public class DeletePropertySrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String id = request.getParameter("id");

    	
    	AddPropertyServiceImpl property = new AddPropertyServiceImpl();

		String status = property.deleteProperty(id);
		
        RequestDispatcher rd = request.getRequestDispatcher("propertydelete.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
