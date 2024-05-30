<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<%@ page import="com.productos.negocio.Cursos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/Examen/stylebase.css">
    <title>Certificado de Curso</title>
</head>
<body>
    <header>
        <h1>Certificado de Curso</h1>
    </header>
    <nav>
        <div class="enlaces">
            <a href="/Examen/home.jsp">Inicio</a>
            <a href="/Examen/perfil.jsp">Perfil</a>
            <a href="/Examen/index.jsp">Cerrar Sesión</a>
        </div>
    </nav>
    <main>
        <section class="certificado">
            <h2>Certificado de Finalización</h2>
            <%
                Usuario user = (Usuario) session.getAttribute("usuario");
                String idCursoStr = request.getParameter("idCurso");
                if (idCursoStr != null) {
                    try {
                        int idCurso = Integer.parseInt(idCursoStr);
                        Cursos curso = new Cursos();
                        curso.obtenerCursoPorId(idCurso);

                        // Verificar que se haya encontrado el curso
                        if (curso.getNombreCurso() != null) {
            %>
                            <p>Este certificado está otorgado a: <%= user.getNombre() %></p>
                            <p>Por haber completado satisfactoriamente el curso: <%= curso.getNombreCurso() %></p>
                            <p>Fecha de emisión: <%= new java.util.Date() %></p>
                            <p>Firma digital del instructor <img src="source/logo.jpg" style="max-width: 10%; height: auto;"	></p>
            <%
                        } else {
            %>
                            <p>No se encontró el curso especificado.</p>
            <%
                        }
                    } catch (NumberFormatException e) {
            %>
                        <p>El ID del curso no es válido.</p>
            <%
                    }
                } else {
            %>
                    <p>ID del curso no especificado.</p>
            <%
                }
            %>
        </section>
    </main>
    <footer>
        <p>© 2024 Aprender de la vida</p>
    </footer>
</body>
</html>