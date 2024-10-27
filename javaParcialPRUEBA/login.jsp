<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <c:if test="${not empty param.correo and not empty param.contra}">
            <c:choose>
                <c:when test="${param.correo == 'admin@root' and param.contra == 'admin'}">
                    <c:redirect url="menuAdmin.jsp"/>
                </c:when>
                <c:otherwise>
                    <sql:query var="userQuery" dataSource="${DataSource}">
                        SELECT cedula FROM usuarios WHERE correo = ? AND contra = ? 
                        <sql:param value="${param.correo}" />
                        <sql:param value="${param.contra}" />
                    </sql:query>

                    <c:choose>
                        <c:when test="${not empty userQuery.rows}">
                            <c:set var="cedula" value="${userQuery.rows[0].cedula}" />

                            <sql:query var="roleQuery" dataSource="${DataSource}">
                                SELECT id_rol FROM rol_usuario WHERE cedula = ?
                                <sql:param value="${cedula}" />
                            </sql:query>

                            <c:choose>
                                <c:when test="${not empty roleQuery.rows}">
                                    <c:set var="idRol" value="${roleQuery.rows[0].id_rol}" />

                                    <c:choose>
                                        <c:when test="${idRol == 1}">
                                            <!-- Estudiante -->
                                            <sql:query var="anteproyectoQuery" dataSource="${DataSource}">
                                                SELECT * FROM estudiantes WHERE cedula = ?
                                                <sql:param value="${cedula}" />
                                            </sql:query>

                                            <c:choose>
                                                <c:when test="${not empty anteproyectoQuery.rows}">
                                                    <c:set var="cedulaEstudiante" value="${anteproyectoQuery.rows[0].cedula}" scope="session"/>
                                                    <c:set var="nombreEstudiante" value="${anteproyectoQuery.rows[0].nombre}" scope="session"/>
                                                    <c:set var="telefonoEstudiante" value="${anteproyectoQuery.rows[0].telefono}" scope="session"/>
                                                    <c:set var="direccionEstudiante" value="${anteproyectoQuery.rows[0].direccion}" scope="session"/>
                                                    <c:set var="correoEstudiante" value="${anteproyectoQuery.rows[0].correo}" scope="session"/>
                                                    <c:set var="idAnteproyecto" value="${anteproyectoQuery.rows[0].id_anteproyecto}" scope="session" />

                                                    <c:if test="${idAnteproyecto == null}">
                                                        <c:set var="mensaje" value="Estudiante sin anteproyecto" />
                                                        <c:redirect url="menuSinProyecto.jsp?cedula=${fn:escapeXml(cedulaEstudiante)}&nombre=${fn:escapeXml(nombreEstudiante)}&telefono=${fn:escapeXml(telefonoEstudiante)}&direccion=${fn:escapeXml(direccionEstudiante)}&correo=${fn:escapeXml(correoEstudiante)}&mensaje=${fn:escapeXml(mensaje)}"/>
                                                    </c:if>
                                                    <c:if test="${idAnteproyecto != null}">
                                                        <c:redirect url="menuEstudiante.jsp?cedula=${fn:escapeXml(cedulaEstudiante)}&nombre=${fn:escapeXml(nombreEstudiante)}&telefono=${fn:escapeXml(telefonoEstudiante)}&direccion=${fn:escapeXml(direccionEstudiante)}&correo=${fn:escapeXml(correoEstudiante)}"/>
                                                    </c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:redirect url="error.jsp?mensaje=Estudiante no encontrado"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${idRol == 2}">
                                            <!-- Docente -->
                                            <sql:query var="cargoQuery" dataSource="${DataSource}">
                                                SELECT * FROM docentes WHERE cedula = ?
                                                <sql:param value="${cedula}" />
                                            </sql:query>

                                            <c:choose>
                                                <c:when test="${not empty cargoQuery.rows}">
                                                    <c:set var="DocentesQuery" value="${cargoQuery.rows[0].id_cargo}" />
                                                    <c:choose>
                                                        <c:when test="${DocentesQuery == 1}">
                                                            <c:choose>
                                                                <c:when test="${not empty DocentesQuery}">
                                                                    <c:set var="cedulaEstudiante" value="${cargoQuery.rows[0].cedula}" scope="session"/>
                                                                    <c:set var="nombreEstudiante" value="${cargoQuery.rows[0].nombre}" scope="session"/>
                                                                    <c:set var="telefonoEstudiante" value="${cargoQuery.rows[0].telefono}" scope="session"/>
                                                                    <c:set var="direccionEstudiante" value="${cargoQuery.rows[0].direccion}" scope="session"/>
                                                                    <c:set var="correoEstudiante" value="${cargoQuery.rows[0].correo}" scope="session"/>
                                                                    <c:set var="est" value="${cargoQuery.rows[0].est}" />
                                                                    <c:redirect url="menuDirector.jsp?cedula=${fn:escapeXml(cedulaEstudiante)}&nombre=${fn:escapeXml(nombreEstudiante)}&telefono=${fn:escapeXml(telefonoEstudiante)}&direccion=${fn:escapeXml(direccionEstudiante)}&correo=${fn:escapeXml(correoEstudiante)}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:redirect url="error.jsp?mensaje=Estudiante no encontrado"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:when test="${DocentesQuery == 2}">
                                                            <c:choose>
                                                                <c:when test="${not empty DocentesQuery}">
                                                                    <c:set var="cedulaEstudiante" value="${cargoQuery.rows[0].cedula}" scope="session"/>
                                                                    <c:set var="nombreEstudiante" value="${cargoQuery.rows[0].nombre}" scope="session"/>
                                                                    <c:set var="telefonoEstudiante" value="${cargoQuery.rows[0].telefono}" scope="session"/>
                                                                    <c:set var="direccionEstudiante" value="${cargoQuery.rows[0].direccion}" scope="session"/>
                                                                    <c:set var="correoEstudiante" value="${cargoQuery.rows[0].correo}" scope="session"/>
                                                                    <c:set var="est" value="${cargoQuery.rows[0].est}" />
                                                                    <c:redirect url="menuEvaluador.jsp?cedula=${fn:escapeXml(cedulaEstudiante)}&nombre=${fn:escapeXml(nombreEstudiante)}&telefono=${fn:escapeXml(telefonoEstudiante)}&direccion=${fn:escapeXml(direccionEstudiante)}&correo=${fn:escapeXml(correoEstudiante)}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:redirect url="error.jsp?mensaje=Evaluador no encontrado"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:redirect url="error.jsp?mensaje=Docente sin cargo válido"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:redirect url="error.jsp?mensaje=Docente no encontrado"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${idRol == 3}">
                                            <!-- Coordinador -->
                                            <c:redirect url="menuCoordinador.jsp"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:redirect url="error.jsp?mensaje=Rol no válido"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <c:redirect url="error.jsp?mensaje=Rol no encontrado para el usuario"/>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <script>
                                alert('Correo o contraseña incorrecta');
                                window.location.href = 'index.jsp';
                            </script>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
