<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException" %>
<%
    // Parámetros de conexión
    String jdbcUrl = "jdbc:mysql://localhost:3306/bdjava?useSSL=false&serverTimezone=UTC"; 
    String dbUser = "root";
    String dbPassword = ""; 

    Connection conn = null;
    try {
        // Cargar el driver JDBC
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establecer la conexión
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        // Almacenar la conexión en el ámbito de la aplicación
        application.setAttribute("conn", conn);
    } catch (SQLException e) {
        out.println("Error de conexión: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Error: No se pudo cargar el driver JDBC.");
    }
%>
