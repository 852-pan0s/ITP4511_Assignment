<%-- 
    Document   : loginError
    Created on : 2019年12月6日, 上午12:10:14
    Author     : panos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Incorrect Password</p>
        <% out.println("<a href=\""+request.getContextPath()+"/login.jsp\">Login again</a>"); %>
    </body>
</html>
