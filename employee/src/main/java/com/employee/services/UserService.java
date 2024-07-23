package com.employee.services;

import com.employee.DAO.UserDao;
import com.employee.bean.user;

public class UserService {
    private UserDao userDao;

    public UserService() {
        this.userDao = new UserDao();
    }

    public user authenticateUser(int userId, String password) {
        return userDao.getUserByIdAndPassword(userId, password);
    }

    public boolean updatePassword(int userId, String oldPassword, String newPassword) {
        return userDao.updatePassword(userId, oldPassword, newPassword);
    }

    public boolean verifyOldPassword(int userId, String oldPassword) {
        user user = userDao.getUserByIdAndPassword(userId, oldPassword);
        return user != null;
    }
}