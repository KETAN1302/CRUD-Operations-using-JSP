<%-- 
    Document   : create
    Created on : 29-Jul-2024, 1:28:53 pm
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Create User</h1>
        <form action="create.jsp" method="post">
            <label for="name">Name :</label>
            <input type="text" id="name" name="name" required>
            <label for="email">E-Mail :</label>
            <input type="text" id="email" name="email" required>
            <input type="submit" value="Create">
        </form>
        <a href="index.jsp">Back to Home</a>
        <%
        if("POST".equalsIgnoreCase(request.getMethod())){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        
        String sql = "insert into users (name,email) values(?,?)";
        
        try(PreparedStatement st = conn.prepareStatement(sql)){
        st.setString(1, name);
        st.setString(2, email);
        st.executeUpdate();
        out.println("<p>User Created Sucessfully ! </p>");
            }catch(Exception e){
            e.printStackTrace();
            out.println("<p> Error creating user ! ");
            }
            }
        %>
    </body>
</html>
