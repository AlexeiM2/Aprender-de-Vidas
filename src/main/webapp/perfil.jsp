<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Usuario</title>
    <link rel="stylesheet" href="stylebase.css">
</head>
<body>
    
    <header>
        <h1>Aprender de Vidas</h1>
    </header>
    	<nav>
            <div class="enlaces">
                <a href="home.jsp" > Inicio </a>
                <a href="#" >Perfil</a>
                <a href="index.jsp" >Cerrar Sesión</a>
            </div>
        </nav>
	<div class="container">
        <section class="perfil">
            <h2>Datos del Usuario</h2>
            <% 
                // Obtener datos del usuario desde el objeto session
                Usuario user = (Usuario) session.getAttribute("usuario");
                if (user != null) {
            %>
                <p>Nombre: <%= user.getNombre() %></p>
                <p>Estado Civil: <%= user.Cambiar_estado(user.getEstadoId()) %></p>
                <p>Correo Electrónico: <%= user.getCorreo() %></p>
                <p>Tipo de Usuario: Cliente</p>
                <form action="Cambiarclave.jsp" method="post">
		                <input type="submit" value="Cambiar Contraseña">
		        </form>
            <% } else { %>
                <p>No se encontraron datos de usuario.</p>
            <% } %>
        </section>
      </div>

    <footer>
        <p>© 2024 Aprender de la vida</p>
    </footer>

</body>
</html>
