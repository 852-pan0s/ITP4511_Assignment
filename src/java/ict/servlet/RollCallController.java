/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

// import library
import ict.bean.Classes;
import ict.db.ProjDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author panos
 */

// map the servlet to url, brandController
@WebServlet(name = "RollCallController", urlPatterns = {"/RollCallController"})
public class RollCallController extends HttpServlet {

    private ProjDB userDb;

    public void init() { 
    /* initialize a brandDB*/ 
        userDb = new ProjDB();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String tid = request.getParameter("uid");
        if ("rollCall".equalsIgnoreCase(action)) {
            Classes roll = userDb.queryClassByTid(tid);
//            PrintWriter out = response.getWriter();
//        out.println("<html>");
//        out.println("<head><title>radio button</title></head>");
//        out.println("<body>");
//        out.println("your company size :" + tid);
//        out.println("</body></html>");
            request.setAttribute("roll", roll);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/roll_call.jsp");
            rd.forward(request, response);
        } else {
            PrintWriter out = response.getWriter();
            out.println("NO such action :" + action);
        }
    }
}
