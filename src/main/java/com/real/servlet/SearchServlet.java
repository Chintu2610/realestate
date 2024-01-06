package com.real.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.bean.AddProperty;
import com.real.serviceimpl.PropertyDAO;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");
		String status = request.getParameter("status");
		String city = request.getParameter("city");

		String startParam = request.getParameter("start");
		int start = (startParam != null) ? Integer.parseInt(startParam) : 0;

		String limitParam = request.getParameter("limit");
		int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 5;

		List<AddProperty> searchResults = PropertyDAO.searchProperties(type, status, city);

		request.setAttribute("searchResults", searchResults);

		request.setAttribute("properties", searchResults);
		request.setAttribute("search", "true");
		request.getRequestDispatcher("/Enquiryform.jsp").forward(request, response);
	}

}
