<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Inicio de Sesión</title>
    <link rel="stylesheet" href="stylebase.css">
</head>
<body>
    
    <header>
        <h1>Aprender de Vidas</h1>
    </header>

    <div style="opacity: 0.8;" class="form-container"><br>
        <form action="login.jsp" method="post" class="form-item">
            <div class="container">
                <h2>Inicio de Sesión</h2>
                <div class="username">
                    <label for="uname"><b>Nombre de Usuario</b></label>
                    <input type="text" placeholder="Ingresa tu nombre de usuario" name="uname" id="uname" required>
                </div>
                <div class="password">
                    <label for="psw"><b>Contraseña</b></label>
                    <input type="password" placeholder="Ingresa tu contraseña" name="psw" id="psw" required>
                </div>

                <div class="cance">
                    <button type="submit">Iniciar Sesión</button>
                    <span class="psw"><br><br>¿Olvidaste tu <a href="forgot_pass.jsp">contraseña?</a></span>
                    <span class="regist">Regístrate <a href="register.jsp">aquí</a></span>
                </div>
            </div>
        </form>
    </div>

    <%-- Obtener parámetros de inicio de sesión --%>
    <% String username = request.getParameter("uname");
       String password = request.getParameter("psw");

       if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
           Usuario user = new Usuario("", "", username, password, 0, 0); 
           String redirectPage = user.autenticar(username, password);

           if (redirectPage != null && !redirectPage.isEmpty()) {
               // Obtener datos del usuario
               String nombreUsuario = user.getNombre();
               String correoUsuario = user.getCorreo();
               user.DatosUser(username);
               

               // Guardar datos del usuario en el objeto request
               
               request.setAttribute("nombreUsuario", nombreUsuario);
               request.setAttribute("correoUsuario", correoUsuario);
               session.setAttribute("usuario", user);
               request.getRequestDispatcher(redirectPage).forward(request, response);
           } else {
               // Manejar caso de autenticación fallida
               out.println("<p>Error: Nombre de usuario o contraseña incorrectos</p>");
           }
       } else {
           // Manejar caso donde los parámetros son nulos o vacíos
       }
    %>

    <footer>
        
                <a href="https://es-la.facebook.com/">
                    <img src="./source//ICONOS/facebook.png" alt="" height="30px" width=auto>
                </a>
                <a href="https://www.instagram.com/">
                    <img src="./source//ICONOS/instagram.png" alt="" height="30px" width=auto>
                </a>
                <a href="https://twitter.com/i/flow/login?redirect_after_login=%2FInicio%2F">
                    <img src="./source//ICONOS/twitter.png" alt="" height="30px" width=auto>
                </a>
         
         
         <p>© 2024 Aprender de la vida</p>
    </footer>
</body>
</html>
