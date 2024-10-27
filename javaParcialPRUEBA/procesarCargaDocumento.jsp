<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Carga Documento</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU9.jpg');
            background-size: cover;
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
            bottom: 0;
            width: 100%;
            margin-top: 400px;
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
<div class="container">
    <h2 class="text-center my-4">Resultado de la Carga</h2>

    <c:choose>
        <c:when test="${not empty param.link and not empty param.idAnteproyecto}">
            <sql:update dataSource="${DataSource}">
                UPDATE anteproyectos 
                SET URL = ?, 
                est = ?
                WHERE id_anteproyecto = ?
                <sql:param value="${param.link}" />
                <sql:param value="1"/>
                <sql:param value="${param.idAnteproyecto}" />
            </sql:update>

            <div class="alert alert-success">
                Documento cargado exitosamente.
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger">
                Error al cargar el documento. Por favor, inténtalo de nuevo.
            </div>
        </c:otherwise>
    </c:choose>

    <a href="menuEstudiante.jsp?cedulaEstudiante=${param.cedulaEstudiante}" class="btn btn-primary">Volver al Menú</a>
</div>

<!-- Pie de página -->
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<!-- Bootstrap y scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
