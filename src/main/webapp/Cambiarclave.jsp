<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Clave</title>
    <link rel="stylesheet" href="stylereg.css">
    <link rel="stylesheet" href="stylebase.css">
    <% 
      Usuario user = (Usuario) session.getAttribute("usuario");
    %>
    
</head>

<body>
    <header>
        <h1>Aprender de Vidas</h1>
    </header>

    <div class="container">
        <h2>Cambiar Clave</h2>
        <form id="cambiarClaveForm" action="Cambiarclave.jsp" method="post"> 
            <input type="hidden" id="correo" name="correo" value="<%= user.getCorreo() %>">    
                    
            <label for="claveAnterior">Clave Anterior:</label>
            <input type="password" id="claveAnterior" name="claveAnterior" required>
            
            <label for="nuevaClave1">Nueva Clave:</label>
            <input type="password" id="nuevaClave1" name="nuevaClave1" required>
            
            <label for="nuevaClave2">Confirmar Nueva Clave:</label>
            <input type="password" id="nuevaClave2" name="nuevaClave2" required>
            
            <input type="submit" value="Confirmar">
        </form>
    </div>

    <footer>
        <p>© 2024 Aprender de la vida</p>
    </footer>
    
    <% 
      
	    String correo = request.getParameter("correo");
	    String claveAnterior = request.getParameter("claveAnterior");
	    String nuevaClave1 = request.getParameter("nuevaClave1");
	    String nuevaClave2 = request.getParameter("nuevaClave2");
	    
	    if (nuevaClave1 == null || nuevaClave2 == null || !nuevaClave1.equals(nuevaClave2)) {
	    	
	    } else {
	        
	        Usuario usuario = new Usuario("", "", correo, claveAnterior, 0, 0);
	        String resultado = usuario.autenticar(correo, claveAnterior);

	        if (resultado.equals("index.jsp")) {
	            out.println("La contraseña anterior es incorrecta.");
	        } else {
	            
	            String resultadoActualizacion = usuario.actualizarContraseña(correo, nuevaClave1);

	            if (resultadoActualizacion.equals("Contraseña actualizada correctamente")) {
	                response.sendRedirect("login.jsp"); 
	            } else {
	                out.println("Error: " + resultadoActualizacion);
	            }
	        }
	    }
	%>
</body>

</html>
