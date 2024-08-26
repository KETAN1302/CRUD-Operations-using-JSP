<%-- 
    Document   : list
    Created on : 29-Jul-2024, 1:40:23 pm
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Users</title>
        <link rel="stylesheet" type = "text/css" href="styles.css"/>
    </head>
    <body>
        <h1>List of Users ! </h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            <% String sql = "select * from users";
            try(Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql)){
                while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                %>
                <tr>
                    <td><%=id%></td>
                    <td><%=name%></td>
                    <td><%=email%></td>
                    <td>
                        <a href="edit.jsp?id=<%= id %>" class="button edit">Edit</a>
                        <a href="delete.jsp?id=<%= id %>" class="button delete">Delete</a>


                    </td>
                </tr>
                <%
                }
                }catch(Exception e){
                    e.printStackTrace();
                }
            %>
        </table>
        <a href="index.jsp">Back to Home</a>
    </body>
</html>
