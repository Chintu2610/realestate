package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.AddAbout;
import com.real.utility.DBUtil;

public class AboutDAO {

    private static final Logger logger = Logger.getLogger(AboutDAO.class.getName());

    public List<AddAbout> getAllAbouts() {
        List<AddAbout> aboutList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, title, content, image FROM about");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AddAbout about = new AddAbout();
                about.setId(resultSet.getString("id"));
                about.setTitle(resultSet.getString("title"));
                about.setContent(resultSet.getString("content"));
                about.setImage(resultSet.getString("image"));

                aboutList.add(about);
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching all abouts", e);
        }
        return aboutList;
    }

    public AddAbout getAboutById(String aboutId) {
        AddAbout about = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, title, content, image FROM about WHERE id = ?")) {

            preparedStatement.setString(1, aboutId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    about = new AddAbout();
                    about.setId(resultSet.getString("id"));
                    about.setTitle(resultSet.getString("title"));
                    about.setContent(resultSet.getString("content"));
                    about.setImage(resultSet.getString("image"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching about by ID", e);
        }
        return about;
    }

    public boolean addAbout(AddAbout about) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO about (title, content, image) VALUES (?, ?, ?)")) {

            preparedStatement.setString(1, about.getTitle());
            preparedStatement.setString(2, about.getContent());
            preparedStatement.setString(3, about.getImage());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding about", e);
            return false;
        }
    }

    public boolean updateAbout(AddAbout about) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE about SET title = ?, content = ?, image = ? WHERE id = ?")) {

            preparedStatement.setString(1, about.getTitle());
            preparedStatement.setString(2, about.getContent());
            preparedStatement.setString(3, about.getImage());
            preparedStatement.setString(4, about.getId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating about", e);
            return false;
        }
    }

    public boolean deleteAbout(String aboutId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM about WHERE id = ?")) {

            preparedStatement.setString(1, aboutId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting about", e);
            return false;
        }
    }
}
