/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.util.ArrayList;

/**
 *
 * @author panos
 */
public class Classes {
    private String cid;
    private String tid;
    private ArrayList<Student> students;
    private String startTime;
    private String endTime;
    private String day;

    public Classes() {
    }

    public Classes(String cid, String tid, ArrayList<Student> students, String startTime, String endTime, String day) {
        this.cid = cid;
        this.tid = tid;
        this.students = students;
        this.startTime = startTime;
        this.endTime = endTime;
        this.day = day;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }
    
    
}
