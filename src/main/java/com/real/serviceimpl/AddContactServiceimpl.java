package com.real.serviceimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddContactservice;

public class AddContactServiceimpl  implements AddContactservice {
	
	@Override
	public String addcontact(String name, String email, String phone, String subject, String message,String date) {
		String status = "contact Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO contact (name,email,phone,subject,message,date) VALUES (?,?,?,?,?,?)");
          
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, subject);
            ps.setString(5, message);
            ps.setString(6, date);

            int k = ps.executeUpdate();

            if (k > 0) {
                status = "contact Added Successfully!";
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
		public String deletecontact(String cid) {
			String status = "contact Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM contact WHERE id = ?");
		        ps.setString(1, cid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "contact Removed Successfully!";
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