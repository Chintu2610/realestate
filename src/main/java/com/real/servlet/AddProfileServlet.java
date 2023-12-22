package com.real.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.serviceimpl.AddProfileServiceimpl;

@WebServlet("/AddProfileServlet")
public class AddProfileServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	String pro = "Add profile Failed!";
	        String firstname = request.getParameter("firstname");
	        String lastname = request.getParameter("lastname");
	        String gender = request.getParameter("gender");
	        String address = request.getParameter("address");
	        String state = request.getParameter("state");
	        String country = request.getParameter("country");
	        String pincode = request.getParameter("pincode");
	        String phone = request.getParameter("phone");
	        
	       
	        AddProfileServiceimpl add =new AddProfileServiceimpl();
	        pro = add.addprofile(firstname, lastname, gender, address, state, country, pincode, phone);

	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?message=" + pro);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
