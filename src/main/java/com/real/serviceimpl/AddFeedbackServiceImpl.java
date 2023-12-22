package com.real.serviceimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddFeedbackservice;

public class AddFeedbackServiceImpl implements AddFeedbackservice {

	@Override
	public String addfeedback( String Name, String PhoneNumber, String Description) {
		String result = "Feedback Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("INSERT INTO feedback (Name, PhoneNumber, Description) VALUES (?, ?, ?)");
            ps.setString(1, Name);
            ps.setString(2, PhoneNumber);
            ps.setString(3, Description);
        

            int k = ps.executeUpdate();

            if (k > 0) {
                result = "Feedback Added Successfully!";
            }
        } catch (SQLException e) {
            result = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return result;

	}

}
	
	/*
	 * @Override public String deletefeedback(String Id) { String result =
	 * "Feedback Removal Failed!";
	 * 
	 * Connection con = DBUtil.provideConnection(); PreparedStatement ps = null;
	 * 
	 * try { ps = con.prepareStatement("DELETE FROM feedback WHERE fid = ?");
	 * ps.setString(1, fid);
	 * 
	 * int k = ps.executeUpdate();
	 * 
	 * if (k > 0) { result = "Feedback Removed Successfully!"; } } catch
	 * (SQLException e) { result = "Error: " + e.getMessage(); e.printStackTrace();
	 * } finally { DBUtil.closeConnection(con); DBUtil.closeConnection(ps); }
	 * 
	 * return result; }
	 * 
	 * @Override public String editfeedback(String Id, String Name, String
	 * PhoneNumber, String Description) { String result = "Feedback Update Failed!";
	 * 
	 * Connection con = DBUtil.provideConnection(); PreparedStatement ps = null;
	 * 
	 * try { ps = con.
	 * prepareStatement("UPDATE feedback SET name=?, email=?, fdescription=?, status=?, date=? WHERE fid=?"
	 * ); ps.setString(1, name); ps.setString(2, email); ps.setString(3,
	 * fdescription); ps.setString(4, status); ps.setString(5, date);
	 * ps.setString(6, fid);
	 * 
	 * int k = ps.executeUpdate();
	 * 
	 * if (k > 0) { result = "Feedback Updated Successfully!"; } } catch
	 * (SQLException e) { e.printStackTrace(); } finally {
	 * DBUtil.closeConnection(con); DBUtil.closeConnection(ps); }
	 * 
	 * return result; }
	 */


