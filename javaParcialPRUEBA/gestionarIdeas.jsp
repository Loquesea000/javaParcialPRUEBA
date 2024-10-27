<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionar Ideas</title>
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
            width: 150px;
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

        /* Estilo para la tabla */
        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .table:hover {
            transform: translateY(-10px);
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

        /* Contenedor con márgenes */
        .container {
            margin-bottom: 5rem;
        }

        /* Estilos de las pestañas */
        .nav-tabs .nav-link {
            background-color: #f8f9fa;
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

           /* Botón de volver */
        .btn-volver {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-volver:hover {
            background-color: #0056b3;
        }
         /* Margen adicional */
        .btn-crear-idea {
            margin-top: 10px;
            margin-bottom: 20px;
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
    <h1 class="text-center">Gestionar Ideas</h1>

    <!-- Pestañas para Ideas Disponibles y Seleccionadas -->
    <ul class="nav nav-tabs" id="ideasTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="disponibles-tab" data-toggle="tab" href="#disponibles" role="tab" aria-controls="disponibles" aria-selected="true">Ideas Disponibles</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="seleccionadas-tab" data-toggle="tab" href="#seleccionadas" role="tab" aria-controls="seleccionadas" aria-selected="false">Ideas Seleccionadas</a>
        </li>
    </ul>
     <div class="mb-3 btn-crear-idea">
                    <a href="crearIdea.jsp" class="btn btn-primary"><i class="fas fa-plus"></i>Crear Nueva Idea</a>
            </div>

    <!-- Contenido de las pestañas -->
    <div class="tab-content" id="ideasTabContent">
        <!-- Ideas Disponibles -->
        <div class="tab-pane fade show active" id="disponibles" role="tabpanel" aria-labelledby="disponibles-tab">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad de Estudiantes</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query var="ideasDisponibles" dataSource="${DataSource}">
                        SELECT * FROM ideas WHERE est = 1
                    </sql:query>

                    <c:forEach var="idea" items="${ideasDisponibles.rows}">
                        <tr>
                            <td>${idea.id_idea}</td>
                            <td>${idea.nombre}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${idea.cantidad_estudiantes == 0}">
                                        Sin Estudiantes Asignados
                                    </c:when>
                                    <c:otherwise>
                                        ${idea.cantidad_estudiantes}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="editarIdea.jsp?id_idea=${idea.id_idea}" class="btn btn-warning btn-sm">Actualizar</a>
                                <a href="eliminarIdea.jsp?id_idea=${idea.id_idea}" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Ideas Seleccionadas -->
        <div class="tab-pane fade" id="seleccionadas" role="tabpanel" aria-labelledby="seleccionadas-tab">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad de Estudiantes</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query var="ideasSeleccionadas" dataSource="${DataSource}">
                        SELECT * FROM ideas WHERE est = 0
                    </sql:query>

                    <c:forEach var="idea" items="${ideasSeleccionadas.rows}">
                        <tr>
                            <td>${idea.id_idea}</td>
                            <td>${idea.nombre}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${idea.cantidad_estudiantes == 0}">
                                        Sin Estudiantes Asignados
                                    </c:when>
                                    <c:otherwise>
                                        ${idea.cantidad_estudiantes}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="asignarDocente.jsp?id_idea=${idea.id_idea}" class="btn btn-success">Asignar Docente</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

   
    <a href="menuCoordinador.jsp" class="btn btn-volver"> <i class="fas fa-arrow-left"></i>Volver al Menú de Coordinador</a>
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
