package com.real.serviceimpl;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.Addrolesservice;

public class AddRolesServiceimpl  implements Addrolesservice {

		@Override
		public String addrole(String RoleID, String RoleName, String Description) {
			String status = "roles Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO roles (RoleID,RoleName,Description) VALUES (?,?,?)");
	            ps.setString(1, RoleID);
	            ps.setString(2, RoleName);
	            ps.setString(3, Description);
	           
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "roles Added Successfully!";
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
		@Override
		public String deleterole(String RoleID) {
			String status = "roles Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM roles WHERE RoleID = ?");
		        ps.setString(1, RoleID);

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

		@Override
		public String editrole(String RoleID, String RoleName, String Description) {
			String status = "roles Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE roles SET RoleName =?, Description =? WHERE RoleID=?");  
		   
		        ps.setString(1, RoleName);
		        ps.setString(2, Description);
		        ps.setString(3, RoleID);
		      

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "roles Updated Successfully!";
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.closeConnection(con);
		        DBUtil.closeConnection(ps);
		    }

		    return status;
		}

			
}