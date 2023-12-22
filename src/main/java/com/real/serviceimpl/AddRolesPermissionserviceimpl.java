package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.real.bean.AddRolepermission;
import com.real.utility.DBUtil;

public class AddRolesPermissionserviceimpl {

    public static List<AddRolepermission> getRolePermissionByRoleID(String roleID) {
        List<AddRolepermission> rolePermissions = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT RoleID, ModuleName, FormName, PermissionType FROM rolepermissions WHERE RoleID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, roleID);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                AddRolepermission rolePermission = new AddRolepermission();
           //     rolePermission.setRolePermissionID(resultSet.getString("RolePermissionID"));
                rolePermission.setRoleID(resultSet.getString("RoleID"));
                rolePermission.setModuleName(resultSet.getString("ModuleName"));
                rolePermission.setFormName(resultSet.getString("FormName"));
                rolePermission.setPermissionType(resultSet.getString("PermissionType"));
               

                rolePermissions.add(rolePermission);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rolePermissions;
    }


	public String addrope( String roleid, String modulename, String formname,
			String permissiontype) {
		// TODO Auto-generated method stub
		return null;
	}

	 public String editrope(String RolePermissionID, String RoleID, String ModuleName, String FormName,
	            String PermissionType) {
	        String status = "rolepermission Update Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	            ps = con.prepareStatement("UPDATE rolepermission SET RoleID=?, ModuleName=?, FormName=?, PermissionType=? WHERE RolePermissionID=?");

	            ps.setString(1, RoleID);
	            ps.setString(2, ModuleName);
	            ps.setString(3, FormName);
	            ps.setString(4, PermissionType);
	            ps.setString(5, RolePermissionID);

	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "rolepermission Updated Successfully!";
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBUtil.closeConnection(con);
	            DBUtil.closeConnection(ps);
	        }

	        return status;
	    }

	    public String deleterole(String roleid) {
	        String status = "roles-permission Removal Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	            ps = con.prepareStatement("DELETE FROM rolepermission WHERE RoleID = ?");
	            ps.setString(1, roleid);

	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "roles Removed Successfully!";
	            }
	        } catch (SQLException e) {
	            status = "Error: " + e.getMessage();
	            e.printStackTrace();
	        } finally {
	            DBUtil.closeConnection(con);
	            DBUtil.closeConnection(ps);
	        }

	        return status;
	    }

		
}
