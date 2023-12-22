package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.real.utility.DBUtil;
import com.real.service.AddSoldProperty;

public class AddSoldPropertyimpl implements AddSoldProperty {

    @Override
    public String soldproperty(String propertyid, String propertystatus, String soldstatus, String soldprice, String solddate, String image) {
        String result = "Sold Property Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement(
                    "INSERT INTO soldproperty (propertyid, propertystatus, soldstatus, soldprice, solddate, image) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, propertyid);
            ps.setString(2, propertystatus);
            ps.setString(3, soldstatus);
            ps.setString(4, soldprice);
            ps.setString(5, solddate);
            ps.setString(6, image);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                result = "Sold Property Added Successfully!";
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
