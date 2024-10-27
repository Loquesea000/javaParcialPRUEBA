<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestión de Usuarios</title>

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        }

        /* Botón de volver */
        .btn-volver {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-volver:hover {
            background-color: #0056b3;
        }

        /* Estilo para la tabla */
        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Sombra flotante */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .table:hover {
            transform: translateY(-10px); /* Efecto flotante al hacer hover */
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            margin: 5px;
        }
        
        /* Margen adicional */
        .btn-agregar-usuario {
            margin-top: 10px;
            margin-bottom: 20px;
        }

        /* Contenedor con márgenes */
        .container {
            margin-bottom: 5rem;
        }

        /* Estilos de las pestañas */
        .nav-tabs .nav-link {
            background-color: #f8f9fa; /* Color gris claro para pestañas no seleccionadas */
            border: 1px solid #dee2e6;
            border-bottom-color: transparent;
            color: #495057;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .nav-tabs .nav-link:hover {
            background-color: #e2e6ea;
            color: #007bff;
        }

        .nav-tabs .nav-link.active {
            background-color: white;
            border-color: #dee2e6 #dee2e6 #fff;
            color: #007bff;
        }
         footer p {
             margin: 5px 0;
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
    
    <h1 class="text-center">Gestión de Usuarios</h1>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="todos-tab" data-toggle="tab" href="#todos" role="tab" aria-controls="todos" aria-selected="true">Todos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="estudiantes-tab" data-toggle="tab" href="#estudiantes" role="tab" aria-controls="estudiantes" aria-selected="false">Estudiantes</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="docentes-tab" data-toggle="tab" href="#docentes" role="tab" aria-controls="docentes" aria-selected="false">Docentes</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="coordinadores-tab" data-toggle="tab" href="#coordinadores" role="tab" aria-controls="coordinadores" aria-selected="false">Coordinadores</a>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        <!-- Todos -->
        <div class="tab-pane fade show active" id="todos" role="tabpanel" aria-labelledby="todos-tab">
            <div class="mb-3 btn-agregar-usuario">
                <a href="agregarUsuario.jsp" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar Usuario</a>
            </div>
            <sql:query var="todos" dataSource="${DataSource}">
                SELECT u.cedula, u.nombre, u.telefono, u.correo, u.contra, u.fecha_registro, r.id_rol
                FROM usuarios u
                JOIN rol_usuario r ON u.cedula = r.cedula
            </sql:query>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                <tr>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Contraseña</th>
                    <th>Fecha de Registro</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty todos.rows}">
                    <c:forEach var="row" items="${todos.rows}">
                        <tr>
                            <td>${row.cedula}</td>
                            <td>${row.nombre}</td>
                            <td>${row.telefono}</td>
                            <td>${row.correo}</td>
                            <td>${row.contra}</td>
                            <td>${row.fecha_registro}</td>
                            <td>
                                <a href="actualizarUsuario.jsp?cedula=${row.cedula}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</a>
                                <a href="eliminarUsuario.jsp?cedula=${row.cedula}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty todos.rows}">
                    <tr>
                        <td colspan="7" class="text-danger text-center">No hay usuarios registrados.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <!-- Estudiantes -->
        <div class="tab-pane fade" id="estudiantes" role="tabpanel" aria-labelledby="estudiantes-tab">
            <sql:query var="estudiantes" dataSource="${DataSource}">
                SELECT u.cedula, u.nombre, u.telefono, u.correo, u.contra, u.fecha_registro, r.id_rol
                FROM usuarios u
                JOIN rol_usuario r ON u.cedula = r.cedula
                WHERE r.id_rol = 1  -- 1 es el ID para estudiantes
            </sql:query>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Contraseña</th>
                    <th>Fecha de Registro</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty estudiantes.rows}">
                    <c:forEach var="row" items="${estudiantes.rows}">
                        <tr>
                            <td>${row.cedula}</td>
                            <td>${row.nombre}</td>
                            <td>${row.telefono}</td>
                            <td>${row.correo}</td>
                            <td>${row.contra}</td>
                            <td>${row.fecha_registro}</td>
                            <td>
                                <a href="actualizarUsuario.jsp?cedula=${row.cedula}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</a>
                                <a href="eliminarUsuario.jsp?cedula=${row.cedula}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty estudiantes.rows}">
                    <tr>
                        <td colspan="7" class="text-danger text-center">No hay estudiantes registrados.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <!-- Docentes -->
        <div class="tab-pane fade" id="docentes" role="tabpanel" aria-labelledby="docentes-tab">
            <sql:query var="docentes" dataSource="${DataSource}">
                SELECT u.cedula, u.nombre, u.telefono, u.correo, u.contra, u.fecha_registro, r.id_rol
                FROM usuarios u
                JOIN rol_usuario r ON u.cedula = r.cedula
                WHERE r.id_rol = 2  -- 2 es el ID para docentes
            </sql:query>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Contraseña</th>
                    <th>Fecha de Registro</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty docentes.rows}">
                    <c:forEach var="row" items="${docentes.rows}">
                        <tr>
                            <td>${row.cedula}</td>
                            <td>${row.nombre}</td>
                            <td>${row.telefono}</td>
                            <td>${row.correo}</td>
                            <td>${row.contra}</td>
                            <td>${row.fecha_registro}</td>
                            <td>
                                <a href="actualizarUsuario.jsp?cedula=${row.cedula}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</a>
                                <a href="eliminarUsuario.jsp?cedula=${row.cedula}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty docentes.rows}">
                    <tr>
                        <td colspan="7" class="text-danger text-center">No hay docentes registrados.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <!-- Coordinadores -->
        <div class="tab-pane fade" id="coordinadores" role="tabpanel" aria-labelledby="coordinadores-tab">
            <sql:query var="coordinadores" dataSource="${DataSource}">
                SELECT u.cedula, u.nombre, u.telefono, u.correo, u.contra, u.fecha_registro, r.id_rol
                FROM usuarios u
                JOIN rol_usuario r ON u.cedula = r.cedula
                WHERE r.id_rol = 3  -- 3 es el ID para coordinadores
            </sql:query>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Contraseña</th>
                    <th>Fecha de Registro</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty coordinadores.rows}">
                    <c:forEach var="row" items="${coordinadores.rows}">
                        <tr>
                            <td>${row.cedula}</td>
                            <td>${row.nombre}</td>
                            <td>${row.telefono}</td>
                            <td>${row.correo}</td>
                            <td>${row.contra}</td>
                            <td>${row.fecha_registro}</td>
                            <td>
                                <a href="actualizarUsuario.jsp?cedula=${row.cedula}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</a>
                                <a href="eliminarUsuario.jsp?cedula=${row.cedula}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty coordinadores.rows}">
                    <tr>
                        <td colspan="7" class="text-danger text-center">No hay coordinadores registrados.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
    <div class="header-container">
        <a href="menuAdmin.jsp" class="btn btn-volver">
            <i class="fas fa-arrow-left"></i> Volver
        </a>
    </div>
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
