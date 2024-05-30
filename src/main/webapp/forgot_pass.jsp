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
    
</head>

<body>
    <header>
        <h1>Aprender de Vidas</h1>
    </header>

    <div class="container">
        <h2>Cambiar Clave</h2>
        <form id="forgot_passForm" action="forgot_pass.jsp" method="post"> 
        	<label for="correo">Correo:</label>
            <input type="text" id="correo" name="correo" required>    
            
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
	    String nuevaClave1 = request.getParameter("nuevaClave1");
	    String nuevaClave2 = request.getParameter("nuevaClave2");
	    
	    if (nuevaClave1 == null || nuevaClave2 == null || !nuevaClave1.equals(nuevaClave2)) {
	    	
	    } else {
	        
	        Usuario usuario = new Usuario("", "", correo, "", 0, 0);
	        usuario.DatosUser(correo);
	        String resultadoActualizacion = usuario.actualizarContraseña(correo, nuevaClave1);
	        if (resultadoActualizacion.equals("Contraseña actualizada correctamente")) {
                response.sendRedirect("login.jsp"); 
            } else {
                out.println("Error: " + resultadoActualizacion);
            }
	    }
	%>
</body>

</html>
