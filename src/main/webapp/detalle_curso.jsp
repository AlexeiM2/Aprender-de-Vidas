<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Cursos" %>
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
    <main>
        <section class="cursos">
            <h2>Detalles del Curso</h2>
            <%
                String idCursoStr = request.getParameter("id");
                if (idCursoStr != null) {
                    try {
                        int idCurso = Integer.parseInt(idCursoStr);
                        Cursos cursos = new Cursos();
                        cursos.obtenerCursoPorId(idCurso);
                        String doc = "Documentacion/Documentacion_id_" + idCursoStr + ".jsp";

                        if (cursos.getNombreCurso() != null) {
            %>
                            <h1><%= cursos.getNombreCurso() %></h1>
                            <p><%= cursos.getDescripcionCurso() %></p>
                            <p>Precio: $<%= cursos.getPrecioCurso() %></p>
                            <form action="<%= doc %>" method="post">
				                <input type="submit" value="Comenzar Curso">
				            </form>
            <%
                        } else {
            %>
                            <p>Curso no encontrado.</p>
            <%
                        }
                    } catch (NumberFormatException e) {
            %>
                        <p>ID de curso no válido.</p>
            <%
                    }
                } else {
            %>
                    <p>ID de curso no especificado.</p>
            <%
                }
            %>
        </section>
         <% 
           	Usuario user = (Usuario) session.getAttribute("usuario");
         %>
    </main>
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
