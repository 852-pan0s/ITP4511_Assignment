/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.User;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author panos
 */
public class UserDB {

    private String dburl;
    private String dbUser;
    private String dbPassword;

    public UserDB(String dburl, String dbUser, String dbPassword) {
        this.dburl = dburl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }

    public User login(String user, String pwd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        User u = null;
        try {
            //1. get Connectiong
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM user WHERE username=? and password=?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                u = new User();
                // set the record detail to the customer bean
                u.setUid(rs.getString("uid"));
                u.setUsername(rs.getString("username"));
                u.setType(rs.getInt("type"));
                u.setPassword(rs.getString("password"));
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return u;
    }

    void CreateUserInfoTable() {

    }

    public boolean addUserInfo(String id, String user, String pwd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO USERINFO VALUES (?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            pStmnt.setString(2, user);
            pStmnt.setString(3, pwd);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return DriverManager.getConnection(dburl, dbUser, dbPassword);
    }

    public ArrayList<User> queryUser() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        User u = null;
        ArrayList<User> list = new ArrayList();
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * FROM user";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                u = new User();
                // set the record detail to the customer bean
                u.setUid(rs.getString("uid"));
                u.setUsername(rs.getString("username"));
                u.setType(rs.getInt("type"));
                u.setPassword(rs.getString("password"));
                list.add(u);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

}
