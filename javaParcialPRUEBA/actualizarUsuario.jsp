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
    <title>Actualizar Usuario</title>
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
        }

        footer p {
            margin: 5px 0;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
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
    <h1 class="text-center">Actualizar Usuario</h1>

    <c:if test="${not empty param.cedula}">
        <sql:query var="usuario" dataSource="${DataSource}">
            SELECT * FROM usuarios WHERE cedula = ?
            <sql:param value="${param.cedula}"/>
        </sql:query>

        <c:if test="${not empty usuario.rows}">
            <div class="form-container">
                <form action="confirmarActualizarUsuario.jsp" method="post">
                    <input type="hidden" name="cedula" value="${usuario.rows[0].cedula}">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="${usuario.rows[0].nombre}" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" value="${usuario.rows[0].telefono}" required>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo" value="${usuario.rows[0].correo}" required>
                    </div>
                    <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" id="contra" name="contra" value="${usuario.rows[0].contra}" required>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar Usuario</button>
                    <a href="gestionarUsuarios.jsp" class="btn btn-secondary">Volver a la gestión de usuarios</a>
                </form>
            </div>
        </c:if>
        <c:if test="${empty usuario.rows}">
            <p class="text-danger">No se encontró el usuario con la cédula proporcionada.</p>
            <a href="gestionarUsuarios.jsp" class="btn btn-secondary">Volver a la gestión de usuarios</a>
        </c:if>
    </c:if>
</div>

<footer>
  <p>© 2024 Unidades Tecnológicas de Santander.</p>
  <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
