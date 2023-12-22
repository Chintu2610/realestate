package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.bean.soldproperty;
import com.real.serviceimpl.AddSoldPropertyimpl;

@WebServlet("/SoldUpdateServlet")
public class SoldUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "sold update property";
        String id = request.getParameter("id");
        String propertystatus = request.getParameter("propertystatus");
        String soldstatus = request.getParameter("soldstatus");
        String soldprice = request.getParameter("soldprice");
        String solddate = request.getParameter("solddate");
        String image = request.getParameter("image");

       
        soldproperty sold = new soldproperty();
        sold.setPropertyid(id);
        sold.setPropertystatus(propertystatus);
        sold.setSoldstatus(soldstatus);
        sold.setSoldprice(soldprice);
        sold.setSolddate(solddate);
        sold.setImage(image);

        AddSoldPropertyimpl sld = new AddSoldPropertyimpl();

       
        String status1 = sld.soldproperty(id,propertystatus,soldstatus,soldprice,solddate,image);

        RequestDispatcher rd = request.getRequestDispatcher("soldproperty.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
