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

@WebServlet("/SoldPropertyServlet") // Updated servlet mapping
public class SoldPropertyServlet extends HttpServlet { // Updated class name
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");

		String startParam = request.getParameter("start");
		int start = (startParam != null) ? Integer.parseInt(startParam) : 0;

		String limitParam = request.getParameter("limit");
		int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 5;

		List<AddProperty> searchtype = PropertyDAO.searchPropertiesByType(type, start, limit);

		request.setAttribute("searchResults", searchtype);
		request.setAttribute("properties", searchtype);
		request.setAttribute("search", "true");
		request.getRequestDispatcher("/soldpropertylist.jsp").forward(request, response);

	}
}
