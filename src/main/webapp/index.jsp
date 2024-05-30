<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link id="stylesheet" rel="stylesheet" href="stylebase.css"> 
    <title>Document</title>	
</head>

<body>
   		<script>
	        function cargarEstiloDaltonismo() {
	            var stylesheet = document.getElementById('stylesheet');
	            stylesheet.href = 'styledalto.css'; 
	        }
	    </script>
        <header>
            <h1>Aprender de Vidas</h1>
            <img src="source/logo.jpg" alt="Imagen 1" style="max-width: 10%; height: auto;">
        </header>
                	<input  type="submit" value="Daltonismo" onclick="cargarEstiloDaltonismo()">
        	<div class="content">
		        <div class="main-content">
		            <p>Emprende un viaje a este mundo lleno de conocimientos</p>
		            <p>Llénate de gozo al aprender de la ciencias</p>
		
		            <form action="register.jsp" method="post">
		                <input type="submit" value="Empezar">
		            </form>
		
		            <p>¿Ya tienes una cuenta? Inicia Sesión</p>
		
		            <form action="login.jsp" method="post">
		                <input type="submit" value="Iniciar Sesión">
		            </form>
		        </div>
				
		        <div class="image-container">
		            <img src="source/pexels-julia-m-cameron-4144533.jpg" alt="Imagen 1" style="max-width: 100%; height: auto;">
		        </div>
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
         <p>Desarrollado por: Alexandro Mendoza</p>  <a href="https://www.linkedin.com/in/alexandro-mendoza-03030b174/"></a>
    </footer>
		

    
</body>

</html>
