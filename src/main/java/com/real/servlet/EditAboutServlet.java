package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.bean.AddAbout;
import com.real.serviceimpl.AddAboutServiceImpl;
			
@WebServlet("/EditAboutServlet")
public class EditAboutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit roles Failed!"; 
        String id= request.getParameter("id");
        String utitle = request.getParameter("utitle");
        String ucontent = request.getParameter("ucontent");
        String aimage = request.getParameter("aimage");
        

        AddAbout about = new AddAbout();
        about.setId(id);
        about.setTitle(utitle);
        about.setContent(ucontent);
        about.setImage(aimage);

        AddAboutServiceImpl dao = new AddAboutServiceImpl();
   
        String status1 = dao.editabout(id,utitle,ucontent,aimage);

        RequestDispatcher rd = request.getRequestDispatcher("aboutedit.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}