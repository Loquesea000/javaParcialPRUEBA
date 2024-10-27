<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Menú Administrador</title>
    <!-- Incluir Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Incluir Iconos (Font Awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Estilos personalizados -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_MENU6.jpg');
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
            width: 150px; /* Tamaño del logo */
        }

        header h1 {
            font-size: 24px;
            color: #1a4c77;
            margin: 0;
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

        /* Estilo para las tarjetas (cards) */
        .card-custom {
            transition: transform 0.2s;
            border-radius: 10px;
            background-color: white;
            border: 2px solid black; /* Borde azul */
            padding: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
        }

        .icon-large {
            font-size: 48px;
            color: #007bff; /* Azul */
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

        /* Separadores entre secciones */
        .section-divider {
            border-top: 4px solid #007bff;
            margin: 2rem 0;
            text-align: center;
        }

        .section-divider h4 {
            display: inline-block;
            padding: 0 20px;
            margin-top: 20px;
            font-size: 20px;
            color: black;
            
        }
         footer p {
             margin: 5px 0;
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

    <!-- Contenedor principal -->
    <div class="container mt-5">
        <div class="jumbotron jumbotron-custom text-center">
            <h2>Bienvenido al Panel de Administración</h2>
            <p class="lead">Gestiona usuarios y roles desde el panel administrativo.</p>
            <hr class="my-4">
        </div>

        <!-- Separador para "Gestión de Usuarios" -->
        <div class="section-divider">
         <h4>ACCIONES</h4>
        </div>

        <!-- Tarjetas (cards) para la gestión de usuarios y roles -->
        <div class="row">
            <!-- Card para Administrar Usuarios -->
            <div class="col-md-6 mb-4">
                <div class="card card-custom h-100 text-center">
                    <div class="card-body">
                        <i class="fas fa-users icon-large mb-3"></i>
                        <h5 class="card-title">Administrar Usuarios</h5>
                        <p class="card-text">Gestiona los usuarios del sistema, incluyendo creación, edición y eliminación.</p>
                        <a href="gestionarUsuarios.jsp" class="btn btn-custom">Ir a Gestión de Usuarios</a>
                    </div>
                </div>
            </div>

            <!-- Card para Administrar Roles -->
            <div class="col-md-6 mb-4">
                <div class="card card-custom h-100 text-center">
                    <div class="card-body">
                        <i class="fas fa-user-tag icon-large mb-3"></i>
                        <h5 class="card-title">Administrar Roles</h5>
                        <p class="card-text">Configura y gestiona los roles de los usuarios, asignando permisos y privilegios.</p>
                        <a href="gestionarRoles.jsp" class="btn btn-custom">Ir a Gestión de Roles</a>
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

    <!-- Scripts de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
