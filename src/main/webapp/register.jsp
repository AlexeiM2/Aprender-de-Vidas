<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.datos.conexion" %>
<%@ page import="com.productos.negocio.Usuario" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Registro de Clientes</title>
    <link rel="stylesheet" href="stylebase.css">
</head>

<body>

    <header>
        <h1>Aprender de Vidas</h1>
    </header>

    <div class="container"> 
        <h2>Registro de Nuevos Clientes</h2>
        
        <form action="procesar_formulario.jsp" method="post">
            <label for="nombresApellidos">Nombres y Apellidos:</label>
            <input type="text" id="nombresApellidos" name="nombresApellidos" required>
            
            <label for="estadoCivil">Estado Civil:</label>
            <select id="estadoCivil" name="estadoCivil">
                <option value="soltero">Soltero</option>
                <option value="casado">Casado</option>
                <option value="divorciado">Divorciado</option>
            </select>
            
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" required>
            
            <label for="clave">Clave:</label>
            <input type="password" id="clave" name="clave" required>
            
            <input type="submit" value="Enviar">
        </form>
    </div>

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
