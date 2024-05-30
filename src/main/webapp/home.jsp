<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productos.negocio.Usuario" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylebase.css">
    <title>Mi Sitio de Cursos</title>
</head>

<body>
    <header>
        <h1>Mi Sitio de Cursos</h1>
    </header>

		<nav>
            <div class="enlaces">
                <a href="home.jsp" > Inicio </a>
                <a href="Listado.jsp" >Buscar Curso</a>
                <a href="perfil.jsp" >Perfil</a>
                <a href="index.jsp" >Cerrar Sesión</a>
            </div>
        </nav>
        
        
        <section class="cursos">
		    <div class="curso-item">
		        <img src="source/c_python.jpg" alt="Curso 1" class="curso-imagen">
		        <div class="curso-info">
		            <h3>Curso de Programación en Python</h3>
		            <p>Aprende a programar en Python desde cero.</p>
		            <a href="detalle_curso.jsp?id=1">Ver detalles</a>
		        </div>
		    </div>
		    <div class="curso-item">
		        <img src="source/c_java.jpg" alt="Curso 2" class="curso-imagen">
		        <div class="curso-info">
		            <h3>Curso de Programación en Java</h3>
		            <p>Aprende a programar en Java desde cero.</p>
		            <a href="detalle_curso.jsp?id=2">Ver detalles</a>
		        </div>
		    </div>
		    
		</section>
		 <section class="perfil">
            <% 
            	Usuario user = (Usuario) session.getAttribute("usuario");
             %>
        </section>

    <footer>
        <p>© 2024 Aprender de la vida</p>
    </footer>
</body>

</html>
