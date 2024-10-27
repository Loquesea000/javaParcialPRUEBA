<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Idea</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU8.jpg');
            background-size: cover;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
            margin-top: 30px;
            margin-bottom: 50px;
            color: #333;
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
            width: 150px; /* Tamaño del logo */
        }

        footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            bottom: 0;
            width: 100%;
             margin-top: 200px;
        }

        footer p {
            margin: 5px 0;
        }

        .alert {
            margin-top: 20px;
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
    <h1 class="text-center">Editar Idea</h1>

    <c:set var="ideaId" value="${param.id_idea}" />

    <!-- Obtener la idea desde la base de datos -->
    <sql:query var="idea" dataSource="${DataSource}">
        SELECT * FROM ideas WHERE id_idea = ?
        <sql:param value="${ideaId}" />
    </sql:query>

    <c:if test="${not empty idea.rows}">
        <c:set var="currentIdea" value="${idea.rows[0]}" />

        <div class="form-container">
            <form action="actualizarIdea.jsp" method="post">
                <input type="hidden" name="id_idea" value="${currentIdea.id_idea}" />

                <div class="form-group">
                    <label for="nombre">Nombre de la Idea:</label>
                    <input type="text" class="form-control" name="nombre" value="${currentIdea.nombre}" required>
                </div>

                <button type="submit" class="btn btn-success">Actualizar Idea</button>
                <a href="gestionarIdeas.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
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

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
