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
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Gestionar Roles</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU7.jpg');
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
            margin-top: 150px;
        }

        /* Estilo para la tabla */
        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .btn-actualizar {
            background-color: #ffc107; /* Amarillo */
            color: white;
        }

        .btn-volver {
            background-color: #007bff; /* Azul */
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-volver:hover {
            background-color: #0056b3;
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
    <h1 class="text-center">Gestionar Roles</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <sql:query var="roles" dataSource="${DataSource}">
                SELECT * FROM roles;
            </sql:query>

            <c:forEach var="rol" items="${roles.rows}">
                <tr>
                    <td>${rol.id_rol}</td>
                    <td>${rol.nombre}</td>
                    <td>
                        <form action="actualizarRol.jsp" method="post" class="form-inline">
                            <input type="hidden" name="id_rol" value="${rol.id_rol}"/>
                            <input type="text" name="descripcion" value="${rol.descripcion}" required class="form-control mr-2 w-100"/>
                    </td>
                    <td>
                        <button  type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Actualizar
                        </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="menuAdmin.jsp" class="btn btn-volver">Volver al Inicio</a>
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
<!-- Font Awesome para íconos -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
