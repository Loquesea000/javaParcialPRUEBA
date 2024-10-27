<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba de Conexión JSTL</title>
</head>
<body>
    <h1>Prueba de Conexión JSTL</h1>

    <sql:query dataSource="${DataSource}" var="resultado">
        SELECT * FROM usuarios LIMIT 5
    </sql:query>

    <h2>Lista de Usuarios:</h2>
    <c:if test="${not empty resultado.rows}">
        <table border="1">
            <tr>
                <th>Cédula</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Estado Civil</th>
            </tr>
            <c:forEach var="usuario" items="${resultado.rows}">
                <tr>
                    <td>${usuario.cedula}</td>
                    <td>${usuario.nombre}</td>
                    <td>${usuario.correo}</td>
                    <td>${usuario.telefono}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty resultado.rows}">
        <p>No se encontraron usuarios en la base de datos.</p>
    </c:if>
</body>
</html>
