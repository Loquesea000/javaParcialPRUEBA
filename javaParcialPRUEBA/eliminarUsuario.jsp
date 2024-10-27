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
        .btn-danger {
            background-color: #dc3545; /* Color del botón de eliminar */
            border: none; /* Sin borde */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Color más oscuro al pasar el ratón */
        }
        .btn-secondary {
            background-color: #6c757d; /* Color del botón de cancelar */
            border: none; /* Sin borde */
        }
        .btn-secondary:hover {
            background-color: #5a6268; /* Color más oscuro al pasar el ratón */
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
            margin-top: 350px;
            position: relative; /* Para el pie de página */
            bottom: 0;
            width: 100%;
        }
    </style>
    <title>Eliminar Usuario</title>
</head>
<body>

<!-- Encabezado -->
<header>
    <img src="img/LOGO_UTS.png" alt="Logo Institucional">
</header>

<!-- Contenido principal -->
<div class="container">
    <h1 class="text-center">Eliminar Usuario</h1>
    <sql:query var="usuario" dataSource="${DataSource}">
        SELECT * FROM usuarios WHERE cedula = ?
        <sql:param value="${param.cedula}"/>
    </sql:query>

    <c:if test="${not empty usuario.rows}">
        <p class="text-center">¿Estás seguro de que deseas eliminar al usuario <strong>${usuario.rows[0].nombre}</strong>?</p>
        <form action="confirmarEliminarUsuario.jsp" method="post">
            <input type="hidden" name="cedula" value="${usuario.rows[0].cedula}"/>
            <div class="text-center">
                <button type="submit" class="btn btn-danger">Eliminar</button>
                <a href="gestionarUsuarios.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </c:if>
    <c:if test="${empty usuario.rows}">
        <p class="text-danger text-center">Usuario no encontrado.</p>
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
