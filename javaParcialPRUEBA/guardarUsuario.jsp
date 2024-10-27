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
    <title>Gestión de Usuarios</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU9.jpg');
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
            width: 150px;
        }
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
    <h1 class="text-center">Gestión de Usuarios</h1>

    <c:set var="cedula" value="${param.cedula}"/>
    <c:set var="nombre" value="${param.nombre}"/>
    <c:set var="telefono" value="${param.telefono}"/>
    <c:set var="correo" value="${param.correo}"/>
    <c:set var="contra" value="${param.contra}"/>
    <c:set var="fechaRegistro" value="${param.fecha_registro}"/>
    <c:set var="direccion" value="${param.direccion}"/>
    <c:set var="rol" value="${param.rol}"/>
    <c:set var="cargo" value="${param.cargo}"/>
    
    <!-- Validar si la cédula ya existe -->
    <sql:query var="checkCedula" dataSource="${DataSource}">
        SELECT COUNT(*) AS count FROM usuarios WHERE cedula = ?
        <sql:param value="${cedula}" />
    </sql:query>

    <c:choose>
        <c:when test="${checkCedula.rows[0].count > 0}">
            <div class="alert alert-danger" role="alert">
                La cédula ya existe. Por favor, ingrese una cédula diferente.
            </div>
            <a href="gestionarUsuarios.jsp" class="btn btn-secondary">Volver a la gestión de usuarios</a>
        </c:when>
        <c:otherwise>
            <!-- Manejo de transacciones para garantizar consistencia -->
            <sql:transaction dataSource="${DataSource}">
                <!-- Inserción en la tabla usuarios -->
                <sql:update var="insertUserResult">
                    INSERT INTO usuarios (cedula, nombre, telefono, correo, contra, fecha_registro) 
                    VALUES (?, ?, ?, ?, ?, ?)
                    <sql:param value="${cedula}" />
                    <sql:param value="${nombre}" />
                    <sql:param value="${telefono}" />
                    <sql:param value="${correo}" />
                    <sql:param value="${contra}" />
                    <sql:param value="${fechaRegistro}" />
                </sql:update>

                <c:choose>
                    <c:when test="${insertUserResult == 0}">
                        <div class="alert alert-danger" role="alert">
                            No se pudo registrar el usuario. Inténtalo de nuevo.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Definir ID de rol -->
                        <c:set var="idRol">
                            <c:choose>
                                <c:when test="${rol == 'ESTUDIANTE'}">1</c:when>
                                <c:when test="${rol == 'DOCENTE'}">2</c:when>
                                <c:when test="${rol == 'COORDINADOR'}">3</c:when>
                                <c:otherwise>0</c:otherwise>
                            </c:choose>
                        </c:set>

                        <!-- Inserción en rol_usuario -->
                        <sql:update var="insertRolUserResult">
                            INSERT INTO rol_usuario (cedula, id_rol) VALUES (?, ?)
                            <sql:param value="${cedula}" />
                            <sql:param value="${idRol}" />
                        </sql:update>

                        <c:choose>
                            <c:when test="${rol == 'ESTUDIANTE'}">
                                <!-- Inserción para estudiantes -->
                                <sql:update var="insertStudentResult">
                                    INSERT INTO estudiantes (cedula, nombre, telefono, direccion, correo, contra) 
                                    VALUES (?, ?, ?, ?, ?, ?)
                                    <sql:param value="${cedula}" />
                                    <sql:param value="${nombre}" />
                                    <sql:param value="${telefono}" />
                                    <sql:param value="${direccion}" />
                                    <sql:param value="${correo}" />
                                    <sql:param value="${contra}" />
                                </sql:update>

                                <c:if test="${insertStudentResult == 0}">
                                    <div class="alert alert-danger" role="alert">
                                        No se pudo registrar el estudiante.
                                    </div>
                                </c:if>
                            </c:when>

                            <c:when test="${rol == 'DOCENTE'}">
                                <!-- Definir ID de cargo -->
                                <c:set var="idCargo">
                                    <c:choose>
                                        <c:when test="${cargo == 'DIRECTOR'}">1</c:when>
                                        <c:when test="${cargo == 'EVALUADOR'}">2</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                                </c:set>

                                <!-- Inserción para docentes -->
                                <sql:update var="insertTeacherResult">
                                    INSERT INTO docentes (cedula, nombre, telefono, direccion, correo, contra, id_cargo) 
                                    VALUES (?, ?, ?, ?, ?, ?, ?)
                                    <sql:param value="${cedula}" />
                                    <sql:param value="${nombre}" />
                                    <sql:param value="${telefono}" />
                                    <sql:param value="${direccion}" />
                                    <sql:param value="${correo}" />
                                    <sql:param value="${contra}" />
                                    <sql:param value="${idCargo}" />
                                </sql:update>

                                <c:if test="${insertTeacherResult == 0}">
                                    <div class="alert alert-danger" role="alert">
                                        No se pudo registrar el docente.
                                    </div>
                                </c:if>
                            </c:when>
                        </c:choose>

                        <div class="alert alert-success" role="alert">
                            Usuario registrado exitosamente.
                        </div>
                        <a href="gestionarUsuarios.jsp" class="btn btn-primary">Volver a la gestión de usuarios</a>
                    </c:otherwise>
                </c:choose>
            </sql:transaction>
        </c:otherwise>
    </c:choose>
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
 