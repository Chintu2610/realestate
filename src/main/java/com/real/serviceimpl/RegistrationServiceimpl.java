package com.real.serviceimpl;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;

import com.real.bean.Registration;
import com.real.service.Registrationservice;

public class RegistrationServiceimpl  implements Registrationservice {
		
		@Override
		public String addregister(String id, String name, String email, String password, String date, String phone) {
			String status = "registration Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO registration (id,name,email,password,date,phone) VALUES (?,?,?,?,?,?)");
	            ps.setString(1, id);
	            ps.setString(2, name);
	            ps.setString(3, email);
	            ps.setString(4, password);
	            ps.setString(5, date);
	            ps.setString(6, phone);
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "registration Added Successfully!";
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

		public Registration getUserDetails(String email, String password) {
			// TODO Auto-generated method stub
			return null;
		}

		public String isValidCredential(String email, String password) {
			// TODO Auto-generated method stub
			return null;
		}
			
}