/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Classes;
import ict.bean.Student;
import ict.bean.User;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author panos
 */
public class ProjDB {

    private String dburl;
    private String dbUser;
    private String dbPassword;

    public ProjDB(String dburl, String dbUser, String dbPassword) {
        this.dburl = dburl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }

    public ProjDB() {
        this("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "");
    }

    public User login(String user, String pwd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        User u = null;
        try {
            //1. get Connectiong
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM user WHERE uid=? and password=?";
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

    public Classes queryClassByTid(String tid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Classes c = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * from teach_class where tid =?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, tid);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            c = new Classes();
            if (rs.next()) {
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = new java.util.Date();
                c.setDay(dateFormat.format(date));
                c.setStartTime(rs.getString("start_time"));
                c.setEndTime(rs.getString("end_time"));
                c.setCid(rs.getString("cid"));
                c.setTid(rs.getString("tid"));
                c.setStudents(queryStudentByCid(c.getCid()));
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
        return c;
    }

    public ArrayList<Student> queryStudentByCid(String cid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Student s = null;
        ArrayList<Student> list = new ArrayList();
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT c.cid, c.sid, firstName, lastName FROM class c, student s where cid = ? and s.sid = c.sid";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, cid);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                s = new Student();
                // set the record detail to the customer bean
                s.setUid(rs.getString("sid"));
                s.setFirstName(rs.getString("firstName"));
                s.setLastName(rs.getString("lastName"));
                list.add(s);
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
