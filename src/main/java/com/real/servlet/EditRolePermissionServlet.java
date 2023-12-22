package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.bean.AddRolepermission;
import com.real.serviceimpl.AddRolesPermissionserviceimpl;
			
@WebServlet("/EditRolePermissionServlet")
public class EditRolePermissionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit rolepermission Failed!"; 
        String rolepermissionId= request.getParameter("rolepermissionId");
        String roleid = request.getParameter("roleid");
        String modulename = request.getParameter("modulename");
        String formname = request.getParameter("formname");
        String permissiontype = request.getParameter("permissiontype");
        

        AddRolepermission role = new AddRolepermission();
        role.setRolePermissionID(rolepermissionId);
        role.setRoleID(roleid);
        role.setModuleName(modulename);
        role.setFormName(formname);
        role.setPermissionType(permissiontype);

        AddRolesPermissionserviceimpl dao = new AddRolesPermissionserviceimpl();
   
        String status1 = dao.editrope(rolepermissionId,roleid,modulename,formname,permissiontype);

        RequestDispatcher rd = request.getRequestDispatcher("roles-permissions.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}