package com.real.serviceimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.AddRoles;
import com.real.bean.AddUserlist;
import com.real.utility.DBUtil;

public class AddUserlistServiceimpl {

    private static final Logger logger = Logger.getLogger(AddUserlistServiceimpl.class.getName());

    public static List<AddUserlist> getAllUsers() {
        List<AddUserlist> userList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, username, email, phone, password, image, roleId FROM users");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AddUserlist user = new AddUserlist();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setPassword(resultSet.getString("password"));
                user.setImage(resultSet.getString("image"));
                user.setRoleId(resultSet.getInt("roleId"));

                userList.add(user);
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching all users", e);
        }
        return userList;
    }

    public static AddUserlist getUserById(int userId) {
        AddUserlist user = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, username, email, phone, password, image, roleId FROM users WHERE id = ?")) {

            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new AddUserlist();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPhone(resultSet.getString("phone"));
                    user.setPassword(resultSet.getString("password"));
                    user.setImage(resultSet.getString("image"));
                    user.setRoleId(resultSet.getInt("roleId"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching user by ID", e);
        }
        return user;
    }

    public static List<AddUserlist> getUsersByRoleId(int roleId) {
        List<AddUserlist> userList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, username, email, phone, password, image, roleId FROM users WHERE roleId = ?")) {

            preparedStatement.setInt(1, roleId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    AddUserlist user = new AddUserlist();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPhone(resultSet.getString("phone"));
                    user.setPassword(resultSet.getString("password"));
                    user.setImage(resultSet.getString("image"));
                    user.setRoleId(resultSet.getInt("roleId"));

                    userList.add(user);
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching users by role ID", e);
        }
        return userList;
    }

    public static boolean addUser(AddUserlist user) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users (username, email, phone, password, image, roleId) VALUES (?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getImage());
            preparedStatement.setInt(6, user.getRoleId());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding user", e);
            return false;
        }
    }

    public static boolean updateUser(AddUserlist user) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET username = ?, email = ?, phone = ?, password = ?, image = ?, roleId = ? WHERE id = ?")) {

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getImage());
            preparedStatement.setInt(6, user.getRoleId());
            preparedStatement.setInt(7, user.getId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating user", e);
            return false;
        }
    }

    public static boolean deleteUser(int userId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM users WHERE id = ?")) {

            preparedStatement.setInt(1, userId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting user", e);
            return false;
        }
    }

    public static AddRoles getRoleById(int roleId) {
        AddRoles role = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT RoleID, RoleName, Description FROM roles WHERE RoleID = ?")) {

            preparedStatement.setInt(1, roleId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    role = new AddRoles();
                    role.setRoleID(resultSet.getString("RoleID"));
                    role.setRoleName(resultSet.getString("RoleName"));
                    role.setDescription(resultSet.getString("Description"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error getting role by ID", e);
        }
        return role;
    }
}
