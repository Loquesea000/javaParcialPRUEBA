<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cargar Documento</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
             margin-top: 200px;
        }

        footer p {
            margin: 5px 0;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
        }

        .btn-custom:hover {
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

<div class="container mt-5">
    <h2 class="text-center my-4">Cargar Documento del Proyecto</h2>

    <div class="form-container">
        <form action="procesarCargaDocumento.jsp" method="post">
            <input type="hidden" name="idAnteproyecto" value="${param.idAnteproyecto}">
            <input type="hidden" name="cedulaEstudiante" value="${param.cedulaEstudiante}">
            <div class="form-group">
                <label for="link">Enlace del Documento (Google Drive, GitHub, etc.):</label>
                <input type="url" class="form-control" id="link" name="link" required placeholder="Ingresa el enlace aquí...">
                <small class="form-text text-muted">Asegúrate de que el enlace sea accesible.</small>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom">
                    <i class="fas fa-upload"></i> Confirmar Carga
                </button>
            </div>
        </form>
    </div>

    <div class="text-center">
        <a href="menuEstudiante.jsp?cedula=${param.cedulaEstudiante}" class="btn btn-primary fas fa-arrow-left">Volver al Menú</a>
    </div>
</div>

<!-- Pie de página -->
<footer>
  <p>© 2024 Unidades Tecnológicas de Santander.</p>
  <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
