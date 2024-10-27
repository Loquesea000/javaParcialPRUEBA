<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Elegir Propuesta de Grado</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU7.jpg'); /* Fondo de la página */
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
            width: 150px; /* Tamaño del logo */
        }

        footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            bottom: 0;
            width: 100%;
            margin-top: 100px;
        }

        footer p {
            margin: 5px 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8); /* Fondo blanco semi-transparente */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
        }

        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 999;
        }

        .logout-btn .btn-danger {
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 30px;
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

<!-- Botón de Cerrar Sesión flotante -->
<div class="logout-btn">
    <a href="index.jsp" class="btn btn-danger">
        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
    </a>
</div>

<div class="container mt-4">
    <h1>Elegir Propuesta de Grado</h1>
    
    <p>Cédula recibida: ${param.cc}</p>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID Idea</th>
                <th>Nombre</th>
                <th>Cantidad de Estudiantes</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
        <sql:query dataSource="${DataSource}" var="ideas">
            SELECT * FROM ideas
            WHERE ideas.cantidad_estudiantes < 2
            AND ideas.est = 1 
        </sql:query>
            <c:forEach var="idea" items="${ideas.rows}">
                <tr>
                    <td>${idea.id_idea}</td>
                    <td>${idea.nombre}</td>
                    <td>${idea.cantidad_estudiantes}</td>
                    <td>
                        <form action="guardarEleccion.jsp" method="post">
                            <input type="hidden" name="id_idea" value="${idea.id_idea}">
                            <input type="hidden" name="cc" value="${param.cc}">
                            <button type="submit" class="btn btn-success">Elegir</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="menuSinProyecto.jsp" class="btn btn-primary">Volver</a>
</div>

<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
    <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
