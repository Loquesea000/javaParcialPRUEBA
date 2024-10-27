<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Menú Evaluador</title>
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


           footer {
            background-color: #333333;
            color: white;
            padding: 1rem;
            text-align: center;
            bottom: 0;
            width: 100%;
            margin-top: 100px;
        }

        .h1 {
            margin-top: 100px;
        }

        /* Estilo para la tarjeta de información del director */
        .user-info {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .user-info h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #343a40;
        }

        .user-info p {
            font-size: 18px;
            color: #6c757d;
        }

        .user-info i {
            color: #007bff;
            margin-right: 10px;
        }

        .user-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #d3d3d3; /* Fondo gris para el icono de usuario */
        }

        .user-image {
    width: 100px; /* Ajusta el ancho según sea necesario */
    height: 100px; /* Ajusta la altura según sea necesario */
    background-size: cover; /* Para cubrir todo el contenedor */
    background-position: center; /* Para centrar la imagen de fondo */
    border-radius: 50%; /* Para darle un estilo circular, opcional */
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

  footer p {
             margin: 5px 0;
        }

             /* Botón de cerrar sesión en la parte superior derecha */
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

<div class="container">
    <h1 class="text-center mb-5 mt-5">Menú Evaluador</h1>

    <!-- Almacenar cedulaEvaluador en la sesión si está en el request -->
    <c:if test="${not empty param.cedulaEstudiante}">
        <c:set var="cedulaEstudiante" value="${param.cedulaEstudiante}" scope="session" />
    </c:if>

    <!-- Si no hay cedulaEvaluador en el request, tomarla de la sesión -->
    <c:if test="${empty param.cedulaEstudiante && not empty sessionScope.cedulaEstudiante}">
        <c:set var="cedulaEstudiante" value="${sessionScope.cedulaEstudiante}" />
    </c:if>

    <c:choose>
        <c:when test="${not empty cedulaEstudiante}">
            <div class="row">
                <!-- Card de Datos del Evaluador -->
                <div class="col-md-8">
                    <div class="user-info h-100">
                            <h3 class="text-center">Datos del Evaluador</h3>
                            <sql:query dataSource="${DataSource}" var="evaluadorInfo">
                                SELECT * FROM docentes WHERE cedula = ?
                                <sql:param value="${cedulaEstudiante}" />
                            </sql:query>
                            <c:forEach var="evaluador" items="${evaluadorInfo.rows}">
                            <div class="user-image mb-3" style="background-image: url('img/icono_info.png');"></div>

                                <p><i class="fas fa-id-card"></i>Cédula:<strong> ${evaluador.cedula}</strong></p>
                                <p><i class="fas fa-user"></i>Nombre:<strong> ${evaluador.nombre}</strong></p>
                                <p><i class="fas fa-envelope"></i>Email:<strong> ${evaluador.correo}</strong></p>
                            </c:forEach>
                    </div>
                </div>

                            <!-- Cards de Acciones -->
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-custom h-100 text-center ">
                                <div class="card-body">
                                    <a href="https://www.uts.edu.co/sitio/calendario-academico/" target="_blank" class="btn btn-link">
                                        <i class="fas fa-calendar-alt fa-2x"></i>
                                        <h5 class="card-title">Calendario Académico</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card card-custom h-80 text-center mt-5">
                                <div class="card-body">
                                    <a href="https://www.uts.edu.co/sitio/modalidad-trabajos-de-grado/" target="_blank" class="btn btn-link">
                                        <i class="fas fa-file-alt fa-2x"></i>
                                        <h5 class="card-title">Formatos de Grado</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Muestra la tabla de anteproyectos donde el evaluador es el responsable -->
            <h2>Anteproyectos Asociados</h2>
            <sql:query dataSource="${DataSource}" var="anteproyectos">
                SELECT * FROM anteproyectos 
                WHERE id_evaluador = ?
                AND est = ?
                <sql:param value="${cedulaEstudiante}" />
                <sql:param value="${3}" />
            </sql:query>

             <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Anteproyecto</th>
                        <th>Nombre</th>
                        <th>ID Idea</th>
                        <th>ID Director</th>
                        <th>ID Estudiante 1</th>
                        <th>ID Estudiante 2</th>
                        <th>ID Evaluador</th>
                        <th>Estado</th>
                        <th>URL</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="anteproyecto" items="${anteproyectos.rows}">
                        <tr>
                            <td>${anteproyecto.id_anteproyecto}</td>
                            <td>${anteproyecto.nombre}</td>
                            <td>${anteproyecto.id_idea}</td>
                            <td>${anteproyecto.id_director}</td>
                            <td>${anteproyecto.id_estudiante1}</td>
                            <td>${anteproyecto.id_estudiante2}</td>
                            <td>${anteproyecto.id_evaluador}</td>
                            <td>
                                    <c:choose>
                                        <c:when test="${anteproyecto.est == 1 || anteproyecto.est == 3 }">
                                            <span class="status-pending">Pendiente</span>
                                        </c:when>
                                        <c:when test="${anteproyecto.est == 0 }">
                                            <span class="status-approved">Aprobado</span>
                                        </c:when>
                                        <c:when test="${anteproyecto.est == 2}">
                                            <span class="status-rejected">Rechazado</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-unknown">Estado desconocido</span>
                                        </c:otherwise>
                                    </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty anteproyecto.URL}">
                                        <a href="${anteproyecto.URL}" target="_blank">${anteproyecto.URL}</a>
                                    </c:when>
                                    <c:otherwise>
                                        No hay URL disponible
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="action-buttons">
                    <c:choose>
                        <c:when test="${anteproyecto.est == 3}">
                            <a href="AprobarEvaluador.jsp?idAnteproyecto=${anteproyecto.id_anteproyecto}&cedulaDirector=${cedulaDirector}" class="btn btn-success">
                                <i class="fas fa-check"></i> Aprobar
                            </a>
                        </c:when>
                    </c:choose>
                    <a href="reprobarAnteproyectoe.jsp?idAnteproyecto=${anteproyecto.id_anteproyecto}&cedulaDirector=${cedulaDirector}" class="btn btn-danger">
                        <i class="fas fa-times"></i> Reprobar
                    </a>
                </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty anteproyectos.rows}">
                <p>No hay anteproyectos asociados a este evaluador.</p>
            </c:if>
        </c:when>
        <c:otherwise>
            <p>Error: No se encontró información del evaluador.</p>
        </c:otherwise>
    </c:choose>
    </div>


  

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<footer>
    <p>© 2024 Unidades Tecnológicas de Santander.</p>
  <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>



</body>
</html>
