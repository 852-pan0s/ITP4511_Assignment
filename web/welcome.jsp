<%-- 
    Document   : welcome
    Created on : 2019年12月6日, 上午12:10:23
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
        <%@include file="header.jsp" %>
        <jsp:useBean id="user" class="ict.bean.User" scope="session" />
        <b> Hello,   <jsp:getProperty name="user" property="username" /></b>
        <p>Welcome to the ICT</p>
        <form method="post" action="login">
            <input type="hidden" name="action" value="logout">
            <input type="submit" valye="Logout" value="Logout" name="logoutButton">
        </form>
        <a href="brandController?action=list">getAllBrands</a><br>
    </body>
</html>
