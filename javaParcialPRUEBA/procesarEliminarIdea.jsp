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
    <title>Resultado de Eliminación</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU9.jpg'); /* Imagen de fondo */
            background-size: cover; /* Cubrir toda la pantalla */
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
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con transparencia */
            border-radius: 5px; /* Bordes redondeados */
            padding: 20px; /* Espaciado interno */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Sombra sutil */
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

<!-- Contenido principal -->
<div class="container mt-5">
    <h1 class="text-center">Resultado de la Eliminación</h1>

    <c:set var="ideaId" value="${param.id_idea}" />

    <!-- Proceso de eliminación -->
    <sql:update dataSource="${DataSource}" var="result">
        DELETE FROM ideas WHERE id_idea = ?
        <sql:param value="${ideaId}" />
    </sql:update>

    <c:choose>
        <c:when test="${result > 0}">
            <div class="alert alert-success" role="alert">
                La idea con ID <strong>${ideaId}</strong> ha sido eliminada exitosamente.
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger" role="alert">
                No se pudo eliminar la idea. Puede que no exista o ya haya sido eliminada.
            </div>
        </c:otherwise>
    </c:choose>

    <a href="gestionarIdeas.jsp" class="btn btn-primary">Volver a Gestionar Ideas</a>
</div>

<!-- Pie de página -->
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
