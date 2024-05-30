<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<%@ page import="com.productos.negocio.Cursos" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/Examen/stylebase.css">
    <title>Curso de Python</title>
    <%
        String idInfoActual = request.getParameter("id") != null ? request.getParameter("id") : "1";
		Usuario user = (Usuario) session.getAttribute("usuario");
		Cursos curso = new Cursos();
    	curso.obtenerCursoPorId(Integer.parseInt("2"));
     %>
    <script>
	   
        var idInfoActual = '<%= idInfoActual %>';
        var idCurso = '<%= curso.getIdCurso() %>';
        function irADocumentacion() {
            window.location.href = "/Examen/Documentacion/Documentacion_id_2.jsp";
        }

        function cargarAudioInicial() {
            var audio = document.getElementById('audioElement');
            audio.src = "Info_java/jv_a1.mp3"; 
            audio.load(); 
            audio.play(); 
        }

        function cambiarImagenYAudio() {
            var nuevoIdInfo = parseInt(idInfoActual) + 1;

            var nuevaDirImagen = "Info_java/jv_" + nuevoIdInfo + ".png";
            var nuevoNombreAudio = "Info_java/jv_a" + nuevoIdInfo + ".mp3";

            var img = new Image();
            img.onload = function() {
                document.querySelector('.info img').setAttribute('src', nuevaDirImagen);

                
                var audio = document.getElementById('audioElement');
                audio.setAttribute('src', nuevoNombreAudio);
                audio.load(); 
                audio.play(); 

                idInfoActual = nuevoIdInfo.toString();
            };
            img.onerror = function() {
                alert('¡Gracias por ver todas las imágenes y escuchar todos los audios!');
                document.getElementById('descargarCertificado').style.display = 'block';       
            };
            img.src = nuevaDirImagen;
        }
        window.onload = function() {
            cargarAudioInicial();
        };
    </script>
</head>
<body>
    <header>
        <h1>Cursos</h1>
    </header>
    <input  type="submit" value="Daltonismo" onclick="cargarEstiloDaltonismo()">
    <nav>
        <div class="enlaces">
            <a href="../home.jsp">Inicio</a>
            <a href="/Examen/perfil.jsp">Perfil</a>
            <a href="/Examen/index.jsp">Cerrar Sesión</a>
        </div>
    </nav>
    <div class="content">
        <div class="info">
            <img src="Info_java/jv_<%= idInfoActual %>.png">
            <audio id="audioElement" controls autoplay>
                <source src="Info_java/jv_a1.mp3" type="audio/mpeg"> 
            </audio>
        </div>
    </div>

    <button onclick="cambiarImagenYAudio()">Siguiente Imagen</button>
    <button onclick="irADocumentacion()">Inicio del Curso</button>    
    <a id="descargarCertificado" href="/Examen/certificado.jsp?idCurso=2" style="display: none;"  >Descargar Certificado</a>
    

    <footer>
        <p>© 2024 Aprender de la vida</p>
    </footer>
    	<script>
	        function cargarEstiloDaltonismo() {
	            var stylesheet = document.getElementById('stylesheet');
	            stylesheet.href = '../styledalto.css'; 
	        }
	    </script>
</body>
</html>
