<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="WEB-INF/jspf/conexionJSTL.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Usuario</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            margin-top: 30px; /* Se ajustó el margen superior */
            margin-bottom: 50px; /* Se ajustó el margen inferior */
            color: #333;
        }
        .form-title {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
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

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container">
                <h2 class="form-title">Agregar Usuario</h2>
                <form action="guardarUsuario.jsp" method="post">
                    <div class="form-group">
                        <label for="cedula">Cédula:</label>
                        <input type="text" class="form-control" name="cedula" placeholder="Ingrese cédula" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" name="nombre" placeholder="Ingrese nombre completo" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" name="telefono" placeholder="Ingrese teléfono" required>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" name="correo" placeholder="Ingrese correo electrónico" required>
                    </div>
                    <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" name="contra" placeholder="Ingrese contraseña" required>
                    </div>
                    <div class="form-group">
                        <label for="fecha_registro">Fecha de Registro:</label>
                        <input type="date" class="form-control" name="fecha_registro" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" class="form-control" name="direccion" placeholder="Ingrese dirección" required>
                    </div>
                    <div class="form-group">
                        <label for="rol">Rol:</label>
                        <select class="form-control" name="rol" required>
                            <option value="ESTUDIANTE">Estudiante</option>
                            <option value="DOCENTE">Docente</option>
                            <option value="COORDINADOR">Coordinador</option>
                        </select>
                    </div>
                    <div class="form-group" id="cargoContainer" style="display: none;">
                        <label for="cargo">Cargo:</label>
                        <select class="form-control" name="cargo">
                            <option value="DIRECTOR">Director</option>
                            <option value="EVALUADOR">Evaluador</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-block">Agregar Usuario</button>
                        <a href="gestionarUsuarios.jsp" class="btn btn-secondary btn-block mt-2">Volver</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<footer>
  <p>© 2024 Unidades Tecnológicas de Santander.</p>
  <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<script>
    const rolSelect = document.querySelector('select[name="rol"]');
    const cargoContainer = document.getElementById('cargoContainer');

    rolSelect.addEventListener('change', function () {
        if (this.value === 'DOCENTE') {
            cargoContainer.style.display = 'block';
        } else {
            cargoContainer.style.display = 'none';
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
