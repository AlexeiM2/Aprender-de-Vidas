<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>

<%
    try {
        // Obtener parámetros del formulario
        String nombresApellidos = request.getParameter("nombresApellidos");
        String estadoCivil = request.getParameter("estadoCivil");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        int id_per = 2;

        // Validar nombre
        String[] palabras = nombresApellidos.split("\\s+");
        boolean nombreValido = false;
        for (String palabra : palabras) {
            if (Character.isUpperCase(palabra.charAt(0))) {
                nombreValido = true;
                break;
            }
        }

        if (!nombreValido) {
            out.println("El nombre debe tener al menos una palabra con la primera letra en mayúscula.");
            return;
        }

        // Validar correo
        String regexCorreo = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern patternCorreo = Pattern.compile(regexCorreo);
        Matcher matcherCorreo = patternCorreo.matcher(correo);
        boolean correoValido = matcherCorreo.matches();

        if (!correoValido) {
            out.println("El correo electrónico no tiene un formato válido.");
            return;
        }

        // Validar clave
        String regexClave = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";
        Pattern patternClave = Pattern.compile(regexClave);
        Matcher matcherClave = patternClave.matcher(clave);
        boolean claveValida = matcherClave.matches();

        if (!claveValida) {
            out.println("La clave no cumple con los requisitos mínimos.");
            return;
        }

        // Crear instancia de Usuario y asignar valores
        Usuario nuevoUsuario = new Usuario(nombresApellidos, "NA", correo, clave, id_per, 1);
        nuevoUsuario.setNombre(nombresApellidos);
        nuevoUsuario.setCedula("NA");
        nuevoUsuario.setPerfilId(1);

        // Asignar estado civil según selección del usuario
        if (estadoCivil.equals("Soltero")) {
            nuevoUsuario.setEstadoId(1);
        } else if (estadoCivil.equals("Casado")) {
            nuevoUsuario.setEstadoId(2);
        } else if (estadoCivil.equals("Divorciado")) {
            nuevoUsuario.setEstadoId(3);
        }

        nuevoUsuario.setCorreo(correo);
        nuevoUsuario.setClave(clave);

        // Intentar registrar el nuevo usuario
        String resultado = nuevoUsuario.ingresarCliente();
        if (resultado.equals("Inserción correcta")) {
        	response.sendRedirect("login.jsp");
        } else {
            out.println(resultado);
            
        }
    } catch (IOException ex) {
        // Manejar errores de E/S
        Logger.getLogger("procesar_registro.jsp").log(Level.SEVERE, null, ex);
        out.println("Error de entrada/salida: " + ex.getMessage());
    } catch (Exception ex) {
        // Manejar otros errores
        Logger.getLogger("procesar_registro.jsp").log(Level.SEVERE, null, ex);
        out.println("Error desconocido: " + ex.getMessage());
    }
%>
