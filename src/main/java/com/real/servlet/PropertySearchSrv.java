package com.real.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.bean.AddProperty;
import com.real.serviceimpl.AddPropertyServiceImpl;

@WebServlet("/PropertySearchSrv")
public class PropertySearchSrv extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String price = request.getParameter("price");
		String date_of_list = request.getParameter("date_of_list");
		int start = 0;
		int limit = 25;
		List<AddProperty> propery;
		if ((price != null && !price.isEmpty()) || (date_of_list != null && !date_of_list.isEmpty())) {
			// Apply filters for employee, start date, and end date
			String filterQuery = "";
			if (price != null && !price.isEmpty()) {
				filterQuery += "price like '%" + price + "%'";
			}
			if (date_of_list != null && !date_of_list.isEmpty()) {
				if (!filterQuery.isEmpty()) {
					filterQuery += " AND ";
				}
				filterQuery += "listed_date = '" + date_of_list + "'";
			}

			propery = AddPropertyServiceImpl.getFilteredProperties(filterQuery, start, limit);
		} else {
			// Retrieve all data
			propery = AddPropertyServiceImpl.getFilteredProperties("", start, limit);

		}
//		request.setAttribute("size", leaves.size());
//		request.setAttribute("leaves", leaves);
//		request.setAttribute("search", "true");
		request.getRequestDispatcher("/propertyview.jsp").forward(request, response);
	}

}
