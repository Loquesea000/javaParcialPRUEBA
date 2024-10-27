<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Confirmar Actualización de Usuario</title>
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
            margin-top: 400px;
            color: white;
            padding: 1rem;
            text-align: center;
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
    <h1 class="text-center">Confirmar Actualización de Usuario</h1>

    <c:if test="${not empty param.cedula}">
        <!-- Obtener el rol del usuario -->
        <sql:query var="rolUsuario" dataSource="${DataSource}">
            SELECT id_rol FROM rol_usuario WHERE cedula = ?
            <sql:param value="${param.cedula}"/>
        </sql:query>

        <c:if test="${not empty rolUsuario.rows}">
            <sql:update dataSource="${DataSource}">
                UPDATE usuarios SET
                nombre = ?, 
                telefono = ?, 
                correo = ?, 
                contra = ?
                WHERE cedula = ?
                <sql:param value="${param.nombre}"/>
                <sql:param value="${param.telefono}"/>
                <sql:param value="${param.correo}"/>
                <sql:param value="${param.contra}"/>
                <sql:param value="${param.cedula}"/>
            </sql:update>

            <!-- Verificar el rol y actualizar la tabla correspondiente -->
            <c:choose>
                <c:when test="${rolUsuario.rows[0].id_rol == 1}">
                    <!-- Actualizar en la tabla estudiantes -->
                    <sql:update dataSource="${DataSource}">
                        UPDATE estudiantes SET
                        nombre = ?, 
                        telefono = ?, 
                        correo = ?
                        WHERE cedula = ?
                        <sql:param value="${param.nombre}"/>
                        <sql:param value="${param.telefono}"/>
                        <sql:param value="${param.correo}"/>
                        <sql:param value="${param.cedula}"/>
                    </sql:update>
                </c:when>
                <c:when test="${rolUsuario.rows[0].id_rol == 2}">
                    <!-- Actualizar en la tabla docentes -->
                    <sql:update dataSource="${DataSource}">
                        UPDATE docentes SET
                        nombre = ?, 
                        telefono = ?, 
                        correo = ?
                        WHERE cedula = ?
                        <sql:param value="${param.nombre}"/>
                        <sql:param value="${param.telefono}"/>
                        <sql:param value="${param.correo}"/>
                        <sql:param value="${param.cedula}"/>
                    </sql:update>
                </c:when>
            </c:choose>

            <div class="alert alert-success" role="alert">
                El usuario ha sido actualizado correctamente.
            </div>
            <a href="gestionarUsuarios.jsp" class="btn btn-primary">Volver a la gestión de usuarios</a>
        </c:if>

        <c:if test="${empty rolUsuario.rows}">
            <div class="alert alert-danger" role="alert">
                Error: No se ha encontrado el rol del usuario.
            </div>
            <a href="gestionarUsuarios.jsp" class="btn btn-secondary">Volver a la gestión de usuarios</a>
        </c:if>
    </c:if>

    <c:if test="${empty param.cedula}">
        <div class="alert alert-danger" role="alert">
            Error: No se ha proporcionado la cédula del usuario.
        </div>
        <a href="gestionarUsuarios.jsp" class="btn btn-secondary">Volver a la gestión de usuarios</a>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
