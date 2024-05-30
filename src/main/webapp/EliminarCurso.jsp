<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.productos.negocio.Cursos"%>
<%@ page import="com.productos.datos.conexion"%>
<%
    // Obtener el parámetro idCurso enviado desde el formulario
    String idCursoStr = request.getParameter("idCurso");
    
    if (idCursoStr != null && !idCursoStr.isEmpty()) {
        int idCurso = Integer.parseInt(idCursoStr);
        
        // Crear una instancia de la clase Cursos
        Cursos cursos = new Cursos();
        
        // Llamar al método eliminar con el ID del curso a eliminar
        cursos.eliminar(idCurso);
        
        // Redirigir de nuevo a admin.jsp después de eliminar
        response.sendRedirect("admin.jsp");
    } else {
        // Mensaje de error como texto plano
        out.println("Error: No se proporcionó un ID válido para eliminar el curso.");
    }
%>
