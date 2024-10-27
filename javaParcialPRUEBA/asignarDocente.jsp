<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asignar Docente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
    <h1 class="text-center">Asignar Docentes a la Idea</h1>
    
    <div class="form-container">
        <form action="procesarAsignacion.jsp" method="post">
            <input type="hidden" name="id_idea" value="${param.id_idea}"> 
            
            <div class="form-group">
                <label for="docenteDirector">Seleccionar Docente Director:</label>
                <select class="form-control" id="docenteDirector" name="docenteDirector" required>
                    <option value="">Seleccione un docente director</option>
                    <sql:query var="docentesDirectores" dataSource="${DataSource}">
                        SELECT * FROM docentes WHERE id_cargo = 1
                    </sql:query>
                    <c:forEach var="docenteDirector" items="${docentesDirectores.rows}">
                        <option value="${docenteDirector.cedula}">${docenteDirector.nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="docenteEvaluador">Seleccionar Docente Evaluador:</label>
                <select class="form-control" id="docenteEvaluador" name="docenteEvaluador" required>
                    <option value="">Seleccione un docente evaluador</option>
                    <sql:query var="docentesEvaluadores" dataSource="${DataSource}">
                        SELECT * FROM docentes WHERE id_cargo = 2
                    </sql:query>
                    <c:forEach var="docenteEvaluador" items="${docentesEvaluadores.rows}">
                        <option value="${docenteEvaluador.cedula}">${docenteEvaluador.nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-success">Asignar Docentes <i class="fas fa-check"></i></button>
        </form>
        
        <a href="gestionarIdeas.jsp" class="btn btn-secondary mt-4"><i class="fas fa-arrow-left"></i> Volver</a>
    </div>
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
