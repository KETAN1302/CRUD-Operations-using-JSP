
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Delete User</h1>
    <%
        int id = Integer.parseInt(request.getParameter("id"));

        String deleteSQL = "DELETE FROM users WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(deleteSQL)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            out.println("<p>User deleted successfully!</p>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error deleting user!</p>");
        }
    %>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
