<%-- 
    Document   : login
    Created on : 2019年12月6日, 上午12:10:08
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
        <div class="container">
            <form method="post" action="login">
                <input type="hidden" name="action" value="authenticate">
                <table border="0">
                    <tr>
                        <td><p align="right">login : </p></td>
                        <td><p><input type="text" name="username" maxlength="10" size="15"></p></td>
                    </tr>
                    <tr>
                        <td><p align="right">password : </p></td>
                        <td><p><input type="password" name="password" maxlength="10" size="15"></p></td>
                    </tr>
                    <tr>
                        <td colspan="2"><p align="center"><input type="submit" value="Login"></p></td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
