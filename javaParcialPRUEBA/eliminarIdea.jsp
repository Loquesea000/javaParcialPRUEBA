<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Idea</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('img/FONDO_MENU9.jpg'); /* Imagen de fondo */
            background-size: cover; /* Cubrir toda la pantalla */
            color: #343a40; /* Color de texto predeterminado */
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con transparencia */
            border-radius: 5px; /* Bordes redondeados */
            padding: 20px; /* Espaciado interno */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Sombra sutil */
            margin-top: 50px; /* Margen superior para separar del borde */
        }
        h1 {
            color: #dc3545; /* Color rojo para el encabezado */
        }
        .text-danger {
            font-weight: bold; /* Texto de advertencia en negrita */
        }
        /* Encabezado */
        header {
            background-color: white;
            border-bottom: 3px solid #e6e6e6;
            padding: 10px;
            display: flex;
            align-items: center;
        }
        header img {
            width: 150px; /* Tamaño del logo */
            margin-right: auto; /* Espacio a la derecha del logo */
        }
        /* Pie de página */
        footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            margin-top: 50px; /* Espacio antes del pie de página */
            position: relative; /* Para el pie de página */
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Encabezado -->
<header>
    <img src="img/LOGO_UTS.png" alt="Logo Institucional">
</header>

<!-- Contenido principal -->
<div class="container mt-5">
    <h1 class="text-center">Eliminar Idea</h1>

    <c:set var="ideaId" value="${param.id_idea}" />

    <!-- Obtener la idea desde la base de datos -->
    <sql:query var="idea" dataSource="${DataSource}">
        SELECT * FROM ideas WHERE id_idea = ?
        <sql:param value="${ideaId}" />
    </sql:query>

    <c:if test="${not empty idea.rows}">
        <c:set var="currentIdea" value="${idea.rows[0]}" />
        
    

        <p class="text-center"><strong>¿Estás seguro de que deseas eliminar esta idea?</strong></p>

        <form action="procesarEliminarIdea.jsp" method="post">
            <input type="hidden" name="id_idea" value="${currentIdea.id_idea}" />
             <div class="text-center">
            <button type="submit" class="btn btn-danger">Eliminar Idea</button>
            <a href="gestionarIdeas.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </c:if>

    <c:if test="${empty idea.rows}">
        <div class="alert alert-danger" role="alert">
            No se encontró la idea con el ID especificado.
        </div>
    </c:if>
</div>

<!-- Pie de página -->
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
