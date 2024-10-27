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
    <title>Confirmar Eliminación de Usuario</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU9.jpg');
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

<!-- Contenido principal -->
<div class="container mt-5">
    <h1 class="text-center">Confirmar Eliminación de Usuario</h1>

    <sql:query var="usuario" dataSource="${DataSource}">
        SELECT * FROM usuarios WHERE cedula = ?
        <sql:param value="${param.cedula}"/>
    </sql:query>

    <c:if test="${not empty usuario.rows}">
       
        
        <sql:query var="rol" dataSource="${DataSource}">
            SELECT id_rol FROM rol_usuario WHERE cedula = ?
            <sql:param value="${param.cedula}"/>
        </sql:query>
        
        <c:choose>
            <c:when test="${rol.rows[0].id_rol == 1}">
                <sql:update dataSource="${DataSource}">
                    DELETE FROM estudiantes WHERE cedula = ?
                    <sql:param value="${param.cedula}"/>
                </sql:update>
            </c:when>
            <c:when test="${rol.rows[0].id_rol == 2}">
                <sql:update dataSource="${DataSource}">
                    DELETE FROM docentes WHERE cedula = ?
                    <sql:param value="${param.cedula}"/>
                </sql:update>
            </c:when>
        </c:choose>

        <sql:update dataSource="${DataSource}">
            DELETE FROM usuarios WHERE cedula = ?
            <sql:param value="${param.cedula}"/>
        </sql:update>
        
        <c:set var="resultado" value="${not empty usuario.rows}" />
        <c:if test="${resultado}">
            <div class="alert alert-success" role="alert">
                Usuario eliminado exitosamente.
            </div>
        </c:if>
        <c:if test="${empty resultado}">
            <div class="alert alert-danger" role="alert">
                Error al eliminar el usuario. No se encontró el usuario.
            </div>
        </c:if>
        
        <a href="gestionarUsuarios.jsp" class="btn btn-primary">Volver a la gestión de usuarios</a>
    </c:if>
    
    <c:if test="${empty usuario.rows}">
        <div class="alert alert-danger" role="alert">
            Usuario no encontrado.
        </div>
        <a href="gestionarUsuarios.jsp" class="btn btn-primary">Volver a la gestión de usuarios</a>
    </c:if>
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
