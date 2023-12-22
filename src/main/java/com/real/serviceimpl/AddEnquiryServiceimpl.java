package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.real.utility.DBUtil;
import com.real.service.AddEnquiry;

public class AddEnquiryServiceimpl implements AddEnquiry {

    @Override
    public String addenquiry(String name, String email, String phone,String Budget, String message, String Pid) {
        String status = "enquiry Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("INSERT INTO enquiry (name,email,phone,Budget,message,Pid) VALUES (?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, Budget);
            ps.setString(5, message);
            ps.setString(6, Pid);

            int k = ps.executeUpdate();

            if (k > 0) {
                status = "enquiry Added Successfully!";
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

    public boolean isEmailExists(String email) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();

            String query = "SELECT * FROM enquiry WHERE email = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(connection);
            DBUtil.closeConnection(preparedStatement);
            DBUtil.closeConnection(resultSet);
        }

        return false;
    }
}
