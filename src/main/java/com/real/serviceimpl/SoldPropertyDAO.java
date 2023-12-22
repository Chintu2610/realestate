package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.soldproperty;
import com.real.utility.DBUtil;

public class SoldPropertyDAO {

    private static final Logger logger = Logger.getLogger(SoldPropertyDAO.class.getName());

    public List<soldproperty> getAllSoldProperties() {
        List<soldproperty> soldPropertyList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT propertyid, propertystatus, soldstatus, soldprice, solddate, image FROM soldproperty");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                soldproperty soldProperty = new soldproperty();
                soldProperty.setPropertyid(resultSet.getString("propertyid"));
                soldProperty.setPropertystatus(resultSet.getString("propertystatus"));
                soldProperty.setSoldstatus(resultSet.getString("soldstatus"));
                soldProperty.setSoldprice(resultSet.getString("soldprice"));
                soldProperty.setSolddate(resultSet.getString("solddate"));
                soldProperty.setImage(resultSet.getString("image"));

                soldPropertyList.add(soldProperty);
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching all sold properties", e);
        }
        return soldPropertyList;
    }

    public boolean addSoldProperty(soldproperty soldProperty) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO soldproperty (propertyid, propertystatus, soldstatus, soldprice, solddate, image) VALUES (?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, soldProperty.getPropertyid());
            preparedStatement.setString(2, soldProperty.getPropertystatus());
            preparedStatement.setString(3, soldProperty.getSoldstatus());
            preparedStatement.setString(4, soldProperty.getSoldprice());
            preparedStatement.setString(5, soldProperty.getSolddate());
            preparedStatement.setString(6, soldProperty.getImage());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding sold property", e);
            return false;
        }
    }

    public boolean updateSoldProperty(soldproperty soldProperty) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE soldproperty SET propertystatus = ?, soldstatus = ?, soldprice = ?, solddate = ?, image = ? WHERE propertyid = ?")) {

            preparedStatement.setString(1, soldProperty.getPropertystatus());
            preparedStatement.setString(2, soldProperty.getSoldstatus());
            preparedStatement.setString(3, soldProperty.getSoldprice());
            preparedStatement.setString(4, soldProperty.getSolddate());
            preparedStatement.setString(5, soldProperty.getImage());
            preparedStatement.setString(6, soldProperty.getPropertyid());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating sold property", e);
            return false;
        }
    }

    public soldproperty getSoldPropertyById(String propertyId) {
        soldproperty soldProperty = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT propertyid, propertystatus, soldstatus, soldprice, solddate, image FROM soldproperty WHERE propertyid = ?")) {

            preparedStatement.setString(1, propertyId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    soldProperty = new soldproperty();
                    soldProperty.setPropertyid(resultSet.getString("propertyid"));
                    soldProperty.setPropertystatus(resultSet.getString("propertystatus"));
                    soldProperty.setSoldstatus(resultSet.getString("soldstatus"));
                    soldProperty.setSoldprice(resultSet.getString("soldprice"));
                    soldProperty.setSolddate(resultSet.getString("solddate"));
                    soldProperty.setImage(resultSet.getString("image"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching sold property by ID", e);
        }
        return soldProperty;
    }

    public List<soldproperty> getSoldPropertyByType(String type) {
        List<soldproperty> soldPropertyList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT propertyid, propertystatus, soldstatus, soldprice, solddate, image FROM soldproperty WHERE type = ?")) {

            preparedStatement.setString(1, type);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    soldproperty soldProperty = new soldproperty();
                    soldProperty.setPropertyid(resultSet.getString("propertyid"));
                    soldProperty.setPropertystatus(resultSet.getString("propertystatus"));
                    soldProperty.setSoldstatus(resultSet.getString("soldstatus"));
                    soldProperty.setSoldprice(resultSet.getString("soldprice"));
                    soldProperty.setSolddate(resultSet.getString("solddate"));
                    soldProperty.setImage(resultSet.getString("image"));

                    soldPropertyList.add(soldProperty);
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching sold properties by type", e);
        }
        return soldPropertyList;
    }

    public boolean deleteSoldProperty(String propertyId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM soldproperty WHERE propertyid = ?")) {

            preparedStatement.setString(1, propertyId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting sold property", e);
            return false;
        }
    }
}
