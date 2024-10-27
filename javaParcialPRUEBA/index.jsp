<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('img/FONDO_LOGIN.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            display: flex;
            width: 80%;
            max-width: 900px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco semitransparente */
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .login-form {
            flex: 1;
            padding: 3rem;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: bold;
            font-size: 2em;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn-login {
            background-color: #007bff;
            border: none;
            padding: 0.75rem;
            width: 100%;
            border-radius: 5px;
            font-size: 1.1rem;
            color: white;
            margin-top: 1rem;
        }

        .btn-login:hover {
            background-color: #0056b3;
        }

        .right-content {
            flex: 1;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        
            text-align: center;
        }

        .right-content img {
            width: 100%;
        }

        .alert-danger {
            display: none;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Formulario de login -->
        <div class="login-form">
            <h2>Iniciar Sesión</h2>
            <form action="login.jsp" method="POST">
                <div class="form-group">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingresa tu correo" required>
                </div>
                <div class="form-group">
                    <label for="contra">Contraseña</label>
                    <input type="password" class="form-control" id="contra" name="contra" placeholder="Ingresa tu contraseña" required>
                </div>
                <button type="submit" class="btn-login">Ingresar</button>
            </form>

            <!-- Mostrar mensaje de error si el parámetro 'error' está presente -->
            <c:if test="${param.error != null}">
                <div class="alert alert-danger mt-3" role="alert">
                    Correo o contraseña incorrectos. Inténtalo de nuevo.
                </div>
            </c:if>
        </div>

        <!-- Columna derecha con contenido adicional -->
        <div class="right-content">
            <img src="img/LOGO_UTS.jpg" alt="Logo UTS">
        </div>
    </div>

    <script>
        // Mostrar el mensaje de error si existe el parámetro 'error' en la URL
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
            document.querySelector('.alert-danger').style.display = 'block';
        }
    </script>
</body>
</html>
