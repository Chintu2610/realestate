package com.real.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.serviceimpl.AddFeedbackServiceImpl;

@WebServlet("/AddFeedbackSevlet")
public class AddFeedbackSevlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	String fed = "Add feedback Failed!";
	        String name = request.getParameter("name");
	        String phone = request.getParameter("phone");
	        String description = request.getParameter("description");
	       
	       
	        AddFeedbackServiceImpl add =new AddFeedbackServiceImpl();
	        fed=add.addfeedback(name,phone, description);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("feedbackadd.jsp?message=" + fed);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
