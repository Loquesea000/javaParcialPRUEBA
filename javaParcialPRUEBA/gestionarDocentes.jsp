<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Docentes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .estado-finalizado { color: green; }
        .estado-activo { color: blue; }
        .estado-revision { color: orange; }
        .estado-desconocido { color: red; }

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

        footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            bottom: 0;
            width: 100%;
        }

        .btn-volver {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-volver:hover {
            background-color: #0056b3;
        }

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

        .container {
            margin-bottom: 5rem;
        }

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
    </style>
</head>
<body>

<header>
    <div>
        <img src="img/LOGO_UTS.png" alt="Logo Institucional">
    </div>
</header>

<div class="container mt-5">
    <h1 class="text-center">Gestión de Anteproyectos</h1>
    
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#todosDirectores">Directores</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#todosEvaluadores">Evaluadores</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#buscarDirector">Buscar Director</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#buscarEvaluador">Buscar Evaluador</a>
        </li>
    </ul>

    <div class="tab-content">
        <!-- Tabla Todos los Directores -->
        <div class="tab-pane fade show active" id="todosDirectores">
            <h3 class="mt-4">Anteproyectos de Directores</h3>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID Anteproyecto</th>
                        <th>Nombre</th>
                        <th>URL</th>
                        <th>Calificación Director</th>
                        <th>Calificación Evaluador</th>
                        <th>ID Idea</th>
                        <th>ID Evaluador</th>
                        <th>ID Director</th>
                        <th>ID Estudiante 1</th>
                        <th>ID Estudiante 2</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${DataSource}" var="anteproyectosDirectores">
                        SELECT id_anteproyecto, nombre, URL, calificacion_director, calificacion_evaluador, 
                               COALESCE(id_idea, 'No Registra') AS id_idea, 
                               COALESCE(id_evaluador, 'No Registra') AS id_evaluador, 
                               id_director, COALESCE(id_estudiante1, 'No Registra') AS id_estudiante1, 
                               COALESCE(id_estudiante2, 'No Registra') AS id_estudiante2, est
                        FROM anteproyectos
                        WHERE id_director IS NOT NULL;
                    </sql:query>
                    <c:forEach var="anteproyecto" items="${anteproyectosDirectores.rows}">
                        <tr>
                            <td>${anteproyecto.id_anteproyecto}</td>
                            <td>${anteproyecto.nombre}</td>
                            <td><a href="${anteproyecto.URL}" target="_blank">${anteproyecto.URL}</a></td>
                            <td>${anteproyecto.calificacion_director}</td>
                            <td>${anteproyecto.calificacion_evaluador}</td>
                            <td>${anteproyecto.id_idea}</td>
                            <td>${anteproyecto.id_evaluador}</td>
                            <td>${anteproyecto.id_director}</td>
                            <td>${anteproyecto.id_estudiante1}</td>
                            <td>${anteproyecto.id_estudiante2}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${anteproyecto.est == 0}">
                                        <span class="estado-finalizado"><i class="fas fa-check-circle"></i> Finalizado</span>
                                    </c:when>
                                    <c:when test="${anteproyecto.est == 1}">
                                        <span class="estado-activo"><i class="fas fa-play-circle"></i> Activo</span>
                                    </c:when>
                                    <c:when test="${anteproyecto.est == 2}">
                                        <span class="estado-revision"><i class="fas fa-sync-alt"></i> Revisión</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="estado-desconocido"><i class="fas fa-times-circle"></i> No Registra</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Tabla Todos los Evaluadores -->
        <div class="tab-pane fade" id="todosEvaluadores">
            <h3 class="mt-4">Anteproyectos de Evaluadores</h3>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID Anteproyecto</th>
                        <th>Nombre</th>
                        <th>URL</th>
                        <th>Calificación Director</th>
                        <th>Calificación Evaluador</th>
                        <th>ID Idea</th>
                        <th>ID Evaluador</th>
                        <th>ID Director</th>
                        <th>ID Estudiante 1</th>
                        <th>ID Estudiante 2</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${DataSource}" var="anteproyectosEvaluadores">
                        SELECT id_anteproyecto, nombre, URL, calificacion_director, calificacion_evaluador, 
                               COALESCE(id_idea, 'No Registra') AS id_idea, 
                               COALESCE(id_evaluador, 'No Registra') AS id_evaluador, 
                               id_director, COALESCE(id_estudiante1, 'No Registra') AS id_estudiante1, 
                               COALESCE(id_estudiante2, 'No Registra') AS id_estudiante2, est
                        FROM anteproyectos
                        WHERE id_evaluador IS NOT NULL;
                    </sql:query>
                    <c:forEach var="anteproyecto" items="${anteproyectosEvaluadores.rows}">
                        <tr>
                            <td>${anteproyecto.id_anteproyecto}</td>
                            <td>${anteproyecto.nombre}</td>
                            <td><a href="${anteproyecto.URL}" target="_blank">${anteproyecto.URL}</a></td>
                            <td>${anteproyecto.calificacion_director}</td>
                            <td>${anteproyecto.calificacion_evaluador}</td>
                            <td>${anteproyecto.id_idea}</td>
                            <td>${anteproyecto.id_evaluador}</td>
                            <td>${anteproyecto.id_director}</td>
                            <td>${anteproyecto.id_estudiante1}</td>
                            <td>${anteproyecto.id_estudiante2}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${anteproyecto.est == 0}">
                                        <span class="estado-finalizado"><i class="fas fa-check-circle"></i> Finalizado</span>
                                    </c:when>
                                    <c:when test="${anteproyecto.est == 1}">
                                        <span class="estado-activo"><i class="fas fa-play-circle"></i> Activo</span>
                                    </c:when>
                                    <c:when test="${anteproyecto.est == 2}">
                                        <span class="estado-revision"><i class="fas fa-sync-alt"></i> Revisión</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="estado-desconocido"><i class="fas fa-times-circle"></i> No Registra</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Buscar Director -->
        <div class="tab-pane fade" id="buscarDirector">
            <h3 class="mt-4">Buscar Director</h3>
            <form action="gestionarDocentes.jsp" method="get" class="form-inline mb-4">
                <input type="hidden" id="activeTab" name="tab" value="buscarDirector" />
                <input type="text" name="cedula_director" class="form-control" placeholder="Buscar por Cédula" required>
                <button type="submit" class="btn btn-primary ml-2">Buscar</button>
            </form>

            <c:if test="${not empty param.cedula_director}">
                <sql:query dataSource="${DataSource}" var="resultadoDirectores">
                    SELECT * FROM anteproyectos WHERE id_director = ?
                    <sql:param value="${param.cedula_director}" />
                </sql:query>

                <c:choose>
                    <c:when test="${not empty resultadoDirectores.rows}">
                        <table class="table table-bordered table-hover mt-3">
                            <thead>
                                <tr>
                                    <th>ID Anteproyecto</th>
                                    <th>Nombre</th>
                                    <th>Calificación Director</th>
                                    <th>Calificación Evaluador</th>
                                    <th>ID Idea</th>
                                    <th>ID Evaluador</th>
                                    <th>ID Director</th>
                                    <th>ID Estudiante 1</th>
                                    <th>ID Estudiante 2</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="anteproyecto" items="${resultadoDirectores.rows}">
                                    <tr>
                                        <td>${anteproyecto.id_anteproyecto}</td>
                                        <td>${anteproyecto.nombre}</td>
                                        <td>${anteproyecto.calificacion_director}</td>
                                        <td>${anteproyecto.calificacion_evaluador}</td>
                                        <td>${anteproyecto.id_idea}</td>
                                        <td>${anteproyecto.id_evaluador}</td>
                                        <td>${anteproyecto.id_director}</td>
                                        <td>${anteproyecto.id_estudiante1}</td>
                                        <td>${anteproyecto.id_estudiante2}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${anteproyecto.est == 0}">
                                                    <span class="estado-finalizado"><i class="fas fa-check-circle"></i> Finalizado</span>
                                                </c:when>
                                                <c:when test="${anteproyecto.est == 1}">
                                                    <span class="estado-activo"><i class="fas fa-play-circle"></i> Activo</span>
                                                </c:when>
                                                <c:when test="${anteproyecto.est == 2}">
                                                    <span class="estado-revision"><i class="fas fa-sync-alt"></i> Revisión</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="estado-desconocido"><i class="fas fa-times-circle"></i> No Registra</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning" role="alert">
                            No se encontraron resultados para la cédula proporcionada.
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>

        <!-- Buscar Evaluador -->
        <div class="tab-pane fade" id="buscarEvaluador">
            <h3 class="mt-4">Buscar Evaluador</h3>
            <form action="gestionarDocentes.jsp" method="get" class="form-inline mb-4">
                <input type="hidden" id="activeTab" name="tab" value="buscarEvaluador" />
                <input type="text" name="cedula_evaluador" class="form-control" placeholder="Buscar por Cédula" required>
                <button type="submit" class="btn btn-primary ml-2">Buscar</button>
            </form>

            <c:if test="${not empty param.cedula_evaluador}">
                <sql:query dataSource="${DataSource}" var="resultadoEvaluadores">
                    SELECT * FROM anteproyectos WHERE id_evaluador = ?
                    <sql:param value="${param.cedula_evaluador}" />
                </sql:query>

                <c:choose>
                    <c:when test="${not empty resultadoEvaluadores.rows}">
                        <table class="table table-bordered table-hover mt-3">
                            <thead>
                                <tr>
                                    <th>ID Anteproyecto</th>
                                    <th>Nombre</th>
                                    <th>Calificación Director</th>
                                    <th>Calificación Evaluador</th>
                                    <th>ID Idea</th>
                                    <th>ID Evaluador</th>
                                    <th>ID Director</th>
                                    <th>ID Estudiante 1</th>
                                    <th>ID Estudiante 2</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="anteproyecto" items="${resultadoEvaluadores.rows}">
                                    <tr>
                                        <td>${anteproyecto.id_anteproyecto}</td>
                                        <td>${anteproyecto.nombre}</td>
                                        <td>${anteproyecto.calificacion_director}</td>
                                        <td>${anteproyecto.calificacion_evaluador}</td>
                                        <td>${anteproyecto.id_idea}</td>
                                        <td>${anteproyecto.id_evaluador}</td>
                                        <td>${anteproyecto.id_director}</td>
                                        <td>${anteproyecto.id_estudiante1}</td>
                                        <td>${anteproyecto.id_estudiante2}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${anteproyecto.est == 0}">
                                                    <span class="estado-finalizado"><i class="fas fa-check-circle"></i> Finalizado</span>
                                                </c:when>
                                                <c:when test="${anteproyecto.est == 1}">
                                                    <span class="estado-activo"><i class="fas fa-play-circle"></i> Activo</span>
                                                </c:when>
                                                <c:when test="${anteproyecto.est == 2}">
                                                    <span class="estado-revision"><i class="fas fa-sync-alt"></i> Revisión</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="estado-desconocido"><i class="fas fa-times-circle"></i> No Registra</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning" role="alert">
                            No se encontraron resultados para la cédula proporcionada.
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
        <div class="header-container">
        <a href="menuCoordinador.jsp" class="btn btn-volver">
            <i class="fas fa-arrow-left"></i> Volver al Menú de Coordinador
        </a>
    </div>
    </div>
</div>

<footer>
  <p>© 2024 Unidades Tecnológicas de Santander.</p>
  <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        // Mantener la pestaña activa al recargar
        var activeTab = localStorage.getItem('activeTab');
        if (activeTab) {
            $('.nav-tabs .nav-link').removeClass('active');
            $('.tab-content .tab-pane').removeClass('show active');
            $('[href="' + activeTab + '"]').addClass('active');
            $(activeTab).addClass('show active');
        }

        $('.nav-tabs .nav-link').on('click', function() {
            var target = $(this).attr('href');
            localStorage.setItem('activeTab', target);
        });
    });
</script>

</body>
</html>
