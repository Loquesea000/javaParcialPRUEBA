<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Idea</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU8.jpg');
            background-size: cover;
        }

        .container {
            margin-top: 50px;
        }

        .alert {
            margin-top: 20px;
        }

        header {
            background-color: white;
            border-bottom: 3px solid #e6e6e6;
            padding: 5px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header img {
            width: 150px;
        }

        footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            bottom: 0;
            width: 100%;
             margin-top: 300px;
        }

        footer p {
            margin: 5px 0;
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
    <h1 class="text-center">Actualizar Idea</h1> 

    <c:set var="ideaId" value="${param.id_idea}" />
    <c:set var="nuevoNombre" value="${param.nombre}" />

    <c:choose>
        <c:when test="${not empty ideaId and not empty nuevoNombre}">
            <sql:update dataSource="${DataSource}">
                UPDATE ideas SET nombre = ? WHERE id_idea = ?
                <sql:param value="${nuevoNombre}" />
                <sql:param value="${ideaId}" />
            </sql:update>

            <div class="alert alert-success text-center" role="alert">
                <i class="fas fa-check-circle"></i> Idea actualizada con éxito.
            </div>
        </c:when>

        <c:otherwise>
            <div class="alert alert-warning text-center" role="alert">
                <i class="fas fa-exclamation-triangle"></i> Los parámetros necesarios no fueron proporcionados.
            </div>
        </c:otherwise>
    </c:choose>

    <a href="gestionarIdeas.jsp" class="btn btn-secondary btn-block mt-3">Volver a Gestionar Ideas</a>
</div>

<!-- Pie de página -->
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
