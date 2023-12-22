package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.bean.AddRoles;
import com.real.serviceimpl.AddRolesServiceimpl;
			
@WebServlet("/EditRoleSrv")
public class EditRoleSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit roles Failed!"; 
        String roleId= request.getParameter("roleId");
        String rolename = request.getParameter("rolename");
        String description = request.getParameter("description");
        

        AddRoles role = new AddRoles();
        role.setRoleID(roleId);
        role.setRoleName(rolename);
        role.setDescription(description);

        AddRolesServiceimpl dao = new AddRolesServiceimpl();
   
        String status1 = dao.editrole(roleId,rolename,description);

        RequestDispatcher rd = request.getRequestDispatcher("Roles.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}