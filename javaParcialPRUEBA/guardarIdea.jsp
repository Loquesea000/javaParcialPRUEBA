<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardar Idea</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU9.jpg');
            background-size: cover;
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
        .container {
            margin-top: 50px;
        }
        footer {
            background-color: #333333;
            margin-top: 400px;
            color: white;
            padding: 1rem;
            text-align: center;
            bottom: 0;
            width: 100%;
        }
        .alert {
            margin-top: 20px;
        }
        .btn {
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

<!-- Contenido principal -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <h2>Guardando Nueva Idea</h2>

            <!-- Insertar la nueva idea en la base de datos -->
            <sql:update dataSource="${DataSource}" var="result">
                INSERT INTO ideas (nombre, cantidad_estudiantes, est) VALUES (?, 0, 1)
                <sql:param value="${param.nombre}" />
            </sql:update>

            <!-- Mostrar mensaje de éxito o error -->
            <c:choose>
                <c:when test="${result >= 1}">
                    <div class="alert alert-success" role="alert">
                        <strong>¡Éxito!</strong> La idea se ha guardado correctamente.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-danger" role="alert">
                        <strong>Error:</strong> Hubo un problema al guardar la idea.
                    </div>
                </c:otherwise>
            </c:choose>

            <!-- Botón para volver a la gestión de ideas -->
            <a href="gestionarIdeas.jsp" class="btn btn-primary">
                <i class="fas fa-arrow-left"></i> Volver a Gestionar Ideas
            </a>
        </div>
    </div>
</div>

<!-- Pie de página -->
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
