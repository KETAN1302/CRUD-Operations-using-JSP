<%-- 
    Document   : db
    Created on : 29-Jul-2024, 1:21:49 pm
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        Connection conn = null;
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_db","root","root");
            }catch(Exception e){
            e.printStackTrace();
            }
        %>
    </body>
</html>
