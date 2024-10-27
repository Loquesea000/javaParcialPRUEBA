<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Actualizar Rol</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU9.jpg'); /* Fondo de imagen */
            background-size: cover;
            color: #343a40; /* Color de texto predeterminado */
        }
        /* Encabezado */
        header {
            background-color: white;
            border-bottom: 3px solid #e6e6e6;
            padding: 5px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header img {
            width: 150px; /* Tamaño del logo */
        }
        /* Pie de página */
        footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            margin-top: 350px;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Encabezado -->
<header>
    <div>
        <img src="img/LOGO_UTS.png" alt="Logo Institucional">
    </div>
</header>

<div class="container mt-5">
    <h1 class="text-center">Actualizar Rol</h1>

    <c:choose>
        <c:when test="${not empty param.id_rol && not empty param.descripcion}">
            <!-- Actualización en la base de datos -->
            <sql:update var="result" dataSource="${DataSource}">
                UPDATE roles
                SET descripcion = ?
                WHERE id_rol = ?;
                <sql:param value="${param.descripcion}"/>
                <sql:param value="${param.id_rol}"/>
            </sql:update>

            <c:if test="${result >= 1}">
                <div class="alert alert-success" role="alert">
                    Rol actualizado correctamente.
                </div>
            </c:if>
            <c:if test="${result == 0}">
                <div class="alert alert-danger" role="alert">
                    Error al actualizar el rol. Intenta de nuevo.
                </div>
            </c:if>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning" role="alert">
                Información incompleta. Por favor, inténtalo de nuevo.
            </div>
        </c:otherwise>
    </c:choose>

    <a href="gestionarRoles.jsp" class="btn btn-primary">Volver a la gestión de roles</a>
</div>

<!-- Pie de página -->
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<!-- Bootstrap y scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
