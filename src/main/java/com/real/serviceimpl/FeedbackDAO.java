package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.AddFeedback;
import com.real.utility.DBUtil;

public class FeedbackDAO {

    private static final Logger logger = Logger.getLogger(FeedbackDAO.class.getName());

    public List<AddFeedback> getAllFeedbacks() {
        List<AddFeedback> feedbackList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM feedback");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AddFeedback feedback = new AddFeedback();
                feedback.setName(resultSet.getString("Name"));
                feedback.setPhoneNumber(resultSet.getString("PhoneNumber"));
                feedback.setDescription(resultSet.getString("Description"));

                feedbackList.add(feedback);
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching all feedbacks", e);
        }
        return feedbackList;
    }

    public AddFeedback getFeedbackById(String feedbackId) {
        AddFeedback feedback = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM feedback WHERE fid = ?")) {

            preparedStatement.setString(1, feedbackId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    feedback = new AddFeedback();
                    feedback.setName(resultSet.getString("Name"));
                    feedback.setPhoneNumber(resultSet.getString("PhoneNumber"));
                    feedback.setDescription(resultSet.getString("Description"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching feedback by ID", e);
        }
        return feedback;
    }

    public boolean addFeedback(AddFeedback feedback) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO feedback (Name, PhoneNumber, Description) VALUES (?, ?, ?)")) {

            preparedStatement.setString(1, feedback.getName());
            preparedStatement.setString(2, feedback.getPhoneNumber());
            preparedStatement.setString(3, feedback.getDescription());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding feedback", e);
            return false;
        }
    }

    public boolean updateFeedback(AddFeedback feedback) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE feedback SET Name = ?, PhoneNumber = ?, Description = ? WHERE fid = ?")) {

            preparedStatement.setString(1, feedback.getName());
            preparedStatement.setString(2, feedback.getPhoneNumber());
            preparedStatement.setString(3, feedback.getDescription());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating feedback", e);
            return false;
        }
    }

    public boolean deleteFeedback(String feedbackId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM feedback WHERE fid = ?")) {

            preparedStatement.setString(1, feedbackId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting feedback", e);
            return false;
        }
    }
}
