package com.employee.DAO;

import com.employee.bean.user;
import com.employee.util.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private static final String SELECT_USER_BY_ID_AND_PASSWORD = "SELECT * FROM users WHERE user_id = ? AND password = ?";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE user_id = ?";
    private static final String UPDATE_PASSWORD_BY_USER_ID = "UPDATE users SET password = ? WHERE user_id = ?";

    public user getUserByIdAndPassword(int userId, String password) {
        user user = null;
        try (Connection connection = db.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID_AND_PASSWORD)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.setString(2, password);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    user = new user();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public user getUserById(int userId) {
        user user = null;
        try (Connection connection = db.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    user = new user();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updatePassword(int userId, String oldPassword, String newPassword) {
        boolean passwordUpdated = false;
        user user = getUserByIdAndPassword(userId, oldPassword);
        if (user != null) {
            try (Connection connection = db.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PASSWORD_BY_USER_ID)) {
                preparedStatement.setString(1, newPassword);
                preparedStatement.setInt(2, userId);
                passwordUpdated = preparedStatement.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return passwordUpdated;
    }
}