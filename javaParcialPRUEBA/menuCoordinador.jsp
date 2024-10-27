<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú del Coordinador</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU6.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
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

        /* Estilo para el logout */
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 999;
        }

        /* Cards */
        .card {
            border-radius: 15px;
            transition: transform 0.2s;
            min-height: 350px;
            background-color: #ffffffdd;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-title {
            color: #007bff;
        }

        .icono {
            font-size: 60px;
            color: #007bff;
        }

       .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #0056b3; /* Azul oscuro */
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

        .container {
            padding-top: 50px;
        }

        .card-footer {
            background-color: #f8f9fa;
        }

        .row {
            justify-content: center;
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

    <!-- Botón de cerrar sesión -->
    <div class="logout-btn">
        <a href="index.jsp" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
    </div>

    <!-- Contenedor principal -->
    <div class="container">
        <h1 class="text-center mb-5">Menú del Coordinador</h1>
        <div class="row">
            <!-- Card: Gestionar Ideas -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-lightbulb icono"></i>
                        <h5 class="card-title mt-3">Gestionar Ideas</h5>
                        <p class="card-text">Revisa y gestiona las ideas propuestas, asigna a las ideas seleccionadas sus respectivos docentes de acompañamiento.</p>
                    </div>
                    <div class="card-footer">
                        <a href="gestionarIdeas.jsp" class="btn btn-custom">Ir a Gestión de Ideas</a>
                    </div> 
                </div>
            </div>

            <!-- Card: Gestionar Alumnos -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-user-graduate icono"></i>
                        <h5 class="card-title mt-3">Gestionar Alumnos</h5>
                        <p class="card-text">Administra el registro de los anteproyectos presentados por los estudiantes.</p>
                    </div>
                    <div class="card-footer">
                        <a href="gestionarAlumnos.jsp" class="btn btn-custom">Ir a Gestión de Alumnos</a>
                    </div>
                </div>
            </div>

            <!-- Card: Gestionar Docentes -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-chalkboard-teacher icono"></i>
                        <h5 class="card-title mt-3">Gestionar Docentes</h5>
                        <p class="card-text">Administra el registro de los anteproyectos pertenecientes a cada docente.</p>
                    </div>
                    <div class="card-footer">
                        <a href="gestionarDocentes.jsp" class="btn btn-custom">Ir a Gestión de Docentes</a>
                    </div>
                </div>
            </div>

            <!-- Card: Consultar Calendario Académico -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-calendar-alt icono"></i>
                        <h5 class="card-title mt-3">Consultar Calendario Académico</h5>
                        <p class="card-text">Accede al calendario académico oficial y consulta fechas importantes.</p>
                    </div>
                    <div class="card-footer">
                        <a href="https://www.uts.edu.co/sitio/calendario-academico/" target="_blank" class="btn btn-custom">Consultar Calendario</a>
                    </div>
                </div>
            </div>

            <!-- Card: Consultar Formatos de Grado -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-file-alt icono"></i>
                        <h5 class="card-title mt-3">Consultar Formatos de Grado</h5>
                        <p class="card-text">Revisa y descarga los formatos oficiales para los trabajos de grado.</p>
                    </div>
                    <div class="card-footer">
                        <a href="https://www.uts.edu.co/sitio/modalidad-trabajos-de-grado/" target="_blank" class="btn btn-custom">Consultar Formatos</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pie de página -->
    <footer>
        <p>© 2024 Unidades Tecnológicas de Santander.</p>
        <p>Creado por: Eduard Mauricio Caro Castañeda y Jeferson Stiven Jerez Serrano.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
