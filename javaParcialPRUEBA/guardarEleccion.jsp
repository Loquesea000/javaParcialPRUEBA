<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<% 
    String idIdea = request.getParameter("id_idea");
    String cedulaEstudiante = request.getParameter("cc");
    

    if (idIdea == null || idIdea.isEmpty()) {
        out.println("<p>Error: id_idea no fue recibido.</p>");
    }

    if (cedulaEstudiante == null || cedulaEstudiante.isEmpty()) {
        out.println("<p>Error: cédula del estudiante no fue recibida.</p>");
    } else {
        out.println("<p>Cédula recibida: " + cedulaEstudiante + "</p>");
        out.println("<p>Cédula recibida: " + idIdea + "</p>");
    }
    request.setAttribute("idIdea", idIdea);
    %>

<!-- Consulta la cantidad de estudiantes y el nombre de la idea seleccionada -->
<sql:query dataSource="${DataSource}" var="ideaInfo">
    SELECT * FROM ideas WHERE id_idea = ?
    <sql:param value="${idIdea}" />
    
</sql:query>
<p>cant: ${idIdea}</p>
<c:choose>
    <c:when test="${ideaInfo.rows[0].cantidad_estudiantes == 0 }">   
        <sql:update dataSource="${DataSource}">
            INSERT INTO anteproyectos (nombre, id_idea, id_estudiante1) 
            VALUES (?, ?, ?)
            <sql:param value="${ideaInfo.rows[0].nombre}" />
            <sql:param value="${idIdea}" />
            <sql:param value="${cedulaEstudiante}" />
        </sql:update>

        <sql:update dataSource="${DataSource}">
            UPDATE ideas SET cantidad_estudiantes = 1 WHERE id_idea = ?
            <sql:param value="${idIdea}" />
        </sql:update>
        <sql:query dataSource="${DataSource}" var="idanteproyecto">
            SELECT * FROM anteproyectos WHERE id_estudiante1 = ?
            <sql:param value="${cedulaEstudiante}" />
        </sql:query>

        <c:if test="${not empty idanteproyecto.rows}">
    <sql:update dataSource ="${DataSource}">
        UPDATE estudiantes SET id_idea = ?, id_anteproyecto = ? WHERE cedula = ? 
        <sql:param value="${idIdea}" />
        <sql:param value="${idanteproyecto.rows[0].id_anteproyecto}" />
        <sql:param value="${cedulaEstudiante}" />
    </sql:update>
</c:if>


        <c:redirect url="menuEstudiante.jsp" />
    </c:when>

    <c:when test="${ideaInfo.rows[0].cantidad_estudiantes == 1}">
        <sql:update dataSource="${DataSource}">
            UPDATE anteproyectos SET id_estudiante2 = ? WHERE id_idea = ? 
            <sql:param value="${cedulaEstudiante}" />
            <sql:param value="${idIdea}" />
        </sql:update>

        <sql:update dataSource="${DataSource}">
            UPDATE ideas SET cantidad_estudiantes = 2 , est = 0 WHERE id_idea = ?
            <sql:param value="${idIdea}" />
        </sql:update>

        <sql:update dataSource ="${DataSource}">
            UPDATE estudiantes SET id_idea = ? WHERE cedula = ?
            <sql:param value="${idIdea}" />
            <sql:param value="${cedulaEstudiante}" />
        </sql:update>

        <sql:query dataSource="${DataSource}" var="idanteproyecto2">
            SELECT * FROM anteproyectos WHERE id_estudiante2 = ?
            <sql:param value="${cedulaEstudiante}" />
        </sql:query>

        <c:if test="${not empty idanteproyecto2.rows}">
    <sql:update dataSource ="${DataSource}">
        UPDATE estudiantes SET id_idea = ?, id_anteproyecto = ? WHERE cedula = ? 
        <sql:param value="${idIdea}" />
        <sql:param value="${idanteproyecto2.rows[0].id_anteproyecto}" />
        <sql:param value="${cedulaEstudiante}" />
    </sql:update>
</c:if>


        <c:redirect url="menuEstudiante.jsp" />
    </c:when>

    <c:otherwise>
        <h2>Lo siento, esta propuesta ya no está disponible.</h2>
        <a href="elegirPropuesta.jsp" class="btn btn-primary">Volver a Elegir Propuesta</a>
    </c:otherwise>
</c:choose>
