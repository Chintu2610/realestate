package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.AddContact;
import com.real.utility.DBUtil;

public class ContactDAO {

    private static final Logger logger = Logger.getLogger(ContactDAO.class.getName());

    public List<AddContact> getAllContacts() {
        List<AddContact> contactList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT name, email, phone, subject, message,date FROM contact");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AddContact contact = new AddContact();
                contact.setName(resultSet.getString("name"));
                contact.setEmail(resultSet.getString("email"));
                contact.setPhone(resultSet.getString("phone"));
                contact.setSubject(resultSet.getString("subject"));
                contact.setMessage(resultSet.getString("message"));
                contact.setDate(resultSet.getString("date"));
                contactList.add(contact);
            }

        } catch (SQLException e) {
            // Log the exception
            logger.log(Level.SEVERE, "Error fetching all contacts", e);
        }
        return contactList;
    }

    public AddContact getContactById(String contactId) {
        AddContact contact = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT name, email, phone, subject, message,date FROM contact WHERE cid = ?")) {

            preparedStatement.setString(1, contactId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    contact = new AddContact();
                    contact.setName(resultSet.getString("name"));
                    contact.setEmail(resultSet.getString("email"));
                    contact.setPhone(resultSet.getString("phone"));
                    contact.setSubject(resultSet.getString("subject"));
                    contact.setMessage(resultSet.getString("message"));
                    contact.setDate(resultSet.getString("date"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching contact by ID", e);
        }
        return contact;
    }

    public boolean addContact(AddContact contact) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO contact (name, email, phone, subject, message,date) VALUES (?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getPhone());
            preparedStatement.setString(4, contact.getSubject());
            preparedStatement.setString(5, contact.getMessage());
            preparedStatement.setString(6, contact.getDate());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding contact", e);
            return false;
        }
    }

    public boolean updateContact(AddContact contact) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE contact SET name = ?, email = ?, phone = ?, subject = ?, message = ? WHERE cid = ?")) {

            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getPhone());
            preparedStatement.setString(4, contact.getSubject());
            preparedStatement.setString(5, contact.getMessage());
            preparedStatement.setString(6, contact.getDate());
            // Remove the line below since "cid" is removed
            // preparedStatement.setString(6, contact.getCid());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating contact", e);
            return false;
        }
    }

    public boolean deleteContact(String contactId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM contact WHERE cid = ?")) {

            preparedStatement.setString(1, contactId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting contact", e);
            return false;
        }
    }
}
