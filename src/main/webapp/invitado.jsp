<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productos.negocio.Usuario" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylebase.css">
    <title>Invitado</title>
</head>

<body>
    <header>
        <h1>Invitado</h1>
    </header>

		<nav>
            <div class="enlaces">
                <a href="#.jsp" > Inicio </a>
                <a href="index.jsp" >Cerrar Sesión</a>
            </div>
        </nav>
        
       <p>Desarrollado por: <span><a href="https://www.linkedin.com/in/alexandro-mendoza-03030b174/">Alexandro Mendoza</a></span></p>
	
        
        <section class="cursos">
		    <div class="curso-item">
		        <img src="source/c_python.jpg" alt="Curso 1" class="curso-imagen">
		        <div class="curso-info">
		            <h3>Curso de Programación en Python</h3>
		            <p>Aprende a programar en Python desde cero.</p>
		            <a href="detalle_curso.jsp?id=1">Ver detalles</a>
		        </div>
		    </div>
		    
		</section>
		 <section class="perfil">
            <% 
            	Usuario user = (Usuario) session.getAttribute("usuario");
             %>
        </section>

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
