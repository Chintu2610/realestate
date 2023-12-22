package com.real.serviceimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddProfileService;

public class AddProfileServiceimpl  implements AddProfileService {
	@Override
	public String addprofile(String firstName, String lastName, String gender, String address,
			String state, String country, String pinCode, String phoneNumber) {
		String status = "contact Adding Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	    	ps = con.prepareStatement("INSERT INTO profile (firstName,lastName,gender,address,state,country,pinCode,phoneNumber) VALUES (?,?,?,?,?,?,?,?)");
	      
	       
	        ps.setString(1, firstName);
	        ps.setString(2, lastName);
	        ps.setString(3, gender);
	        ps.setString(4, address);
	        ps.setString(5, state);
	        ps.setString(6, country);
	        ps.setString(7, pinCode);
	        ps.setString(8, phoneNumber);

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

}