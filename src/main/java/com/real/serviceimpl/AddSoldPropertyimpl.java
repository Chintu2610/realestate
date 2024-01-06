package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.real.service.AddSoldProperty;
import com.real.utility.DBUtil;

public class AddSoldPropertyimpl implements AddSoldProperty {

	@Override
	public String soldproperty(String propertyid, String propertystatus, String soldstatus, String soldprice,
			String solddate, String image) {
		String result = "Sold Property Adding Failed!";

		Connection con = DBUtil.provideConnection();
		Connection con1 = DBUtil.provideConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		try {
			ps = con.prepareStatement(
					"INSERT INTO soldproperty (propertyid, propertystatus, soldstatus, soldprice, solddate, image) VALUES (?, ?, ?, ?, curdate(), ?)");
			ps1 = con1.prepareStatement("update property set sold_status=? where property_id=?");

			ps.setString(1, propertyid);
			ps.setString(2, propertystatus);
			ps.setString(3, soldstatus);
			ps.setString(4, soldprice);
			ps.setString(5, image);

			ps1.setString(1, soldstatus);
			ps1.setString(2, propertyid);
			int rowsAffected = ps.executeUpdate();
			int rowsAffected1 = ps1.executeUpdate();
			if (rowsAffected > 0 && rowsAffected1 > 0) {
				result = "SoldProperty Added Successfully!";
			}
		} catch (SQLException e) {
			result = "Error: " + e.getMessage();
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(con);
			DBUtil.closeConnection(ps);
			DBUtil.closeConnection(con1);
			DBUtil.closeConnection(ps1);
		}

		return result;
	}
}
