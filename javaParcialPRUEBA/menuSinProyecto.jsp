<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Sin Proyecto</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU7.jpg');
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

        .user-info {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* Espacio entre tarjetas */
        }

        .user-info h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #343a40;
        }

        .user-image {
            width: 100px; /* Ajusta el ancho según sea necesario */
            height: 100px; /* Ajusta la altura según sea necesario */
            background-size: cover; /* Para cubrir todo el contenedor */
            background-position: center; /* Para centrar la imagen de fondo */
            border-radius: 50%; /* Para darle un estilo circular, opcional */
            margin-bottom: 20px;
        }

        .card-custom {
            transition: transform 0.2s;
            border-radius: 10px;
            background-color: white;
            padding: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

        .card-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
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
    </style>
</head>
<body>

<!-- Encabezado -->
<header>
    <div>
        <img src="img/LOGO_UTS.png" alt="Logo Institucional">
    </div>
</header>

<div class="container">
    <h1 class="text-center mb-5 mt-5">Información del Estudiante</h1>
    <c:choose>
        <c:when test="${not empty cedulaEstudiante}">
            <div class="row">
                <div class="col-md-6">
                    <div class="user-info">
                     <h2 class="text-center">Datos Personales</h2>
                        <sql:query dataSource="${DataSource}" var="estudianteInfo">
                            SELECT * FROM estudiantes WHERE cedula = ?
                            <sql:param value="${cedulaEstudiante}" />
                        </sql:query>
                        <c:forEach var="estudiante" items="${estudianteInfo.rows}">
                            <div class="user-image" style="background-image: url('img/icono_info.png');"></div>
                            <p><i class="fas fa-id-card"></i> Cédula: <strong>${estudiante.cedula}</strong></p>
                            <p><i class="fas fa-user"></i> Nombre: <strong>${estudiante.nombre}</strong></p>
                            <p><i class="fas fa-phone"></i> Teléfono: <strong>${estudiante.telefono}</strong></p>
                            <p><i class="fas fa-map-marker-alt"></i> Dirección: <strong>${estudiante.direccion}</strong></p>
                            <p><i class="fas fa-envelope"></i> Email: <strong>${estudiante.correo}</strong></p>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-6 text-center">
                    <h2>Acciones</h2>
                    <div class="card card-custom">
                        <div class="card-body">
                            <form action="elegirPropuesta.jsp" method="post">
                                <input type="hidden" name="cc" value="${cedulaEstudiante}">
                                <button type="submit" class="btn btn-primary">Elegir Propuesta de Grado</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <p>Error: No se encontró información del estudiante.</p>
        </c:otherwise>
    </c:choose>
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
