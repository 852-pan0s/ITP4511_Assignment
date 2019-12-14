/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

/**
 *
 * @author panos
 */
import ict.bean.Classes;
import ict.bean.Student;
import ict.bean.User;
import ict.db.ProjDB;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class TestQueryUser {

    public static void main(String[] arg) {

        // Connect DB
        String url = "jdbc:mysql://localhost:3306/itp4511_assignment";
        String username = "root";
        String password = "";
        ProjDB db = new ProjDB(url, username, password);

        // Query All Customer
        ArrayList<User> list = db.queryUser();
        System.out.println("---Query All Customers---");
        for (User u : list) {
            System.out.println("ID: " + u.getUid());
        }
        Classes c = db.queryClassByTid("jesse");
        System.out.println("Class ID: " +c.getTid());
        for(Student s: c.getStudents()){
        System.out.println("Studnet: " +s.getFirstName());    
        }
    }
}
