<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Edit User</h1>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        String name = "";
        String email = "";

        String selectSQL = "SELECT * FROM users WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(selectSQL)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <form action="edit.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" required>
        <input type="submit" value="Update">
    </form>
    <a href="index.jsp">Back to Home</a>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            id = Integer.parseInt(request.getParameter("id"));
            name = request.getParameter("name");
            email = request.getParameter("email");

            String updateSQL = "UPDATE users SET name = ?, email = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateSQL)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setInt(3, id);
                stmt.executeUpdate();
                out.println("<p>User updated successfully!</p>");
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error updating user!</p>");
            }
        }
    %>
</body>
</html>