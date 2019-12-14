<%-- 
    Document   : roll_call
    Created on : 2019年12月14日, 下午04:19:27
    Author     : panos
--%>

<%@page import="ict.bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <jsp:useBean id="roll" scope="request"  class="ict.bean.Classes" />
        <div class="container">
            <table border="1">
                <tr>
                    <th>Attend</th>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Attend Time</th>
                    <th>Late</th>
                </tr>
                <%
                    out.print(String.format("<input type='hidden' id='sTime' value='%s'>",roll.getStartTime()));
                    for (Student s : roll.getStudents()) {
                        out.print("<tr>");
                        out.print("<td><input type='checkbox' class='attend' name='attend'></td>");
                        out.print(String.format("<td>%s</td>", s.getUid()));
                        out.print(String.format("<td>%s %s</td>", s.getLastName(), s.getFirstName()));
                        out.print("<td><input type='text' class='attendTime' name='attendTime'></td>");
                        out.print("<td><input type='checkbox' name='late'></td>");
                        out.print("</tr>");
                    }
                %>
            </table>
        </div>
            <script>
                $(".attend").click(function(){
                    console.log($($($($(this).parent()).siblings()[2]).children()[0]).val($("#sTime").val()));
                    $($($(this).parent().children()[3]).children()[0]).val($("#sTime").val());
                });
                </script>
    </body>
</html>
