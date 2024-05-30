<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<%@ page import="com.productos.negocio.Cursos" %>
<%@ page import="com.productos.datos.conexion" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Inicio de Sesión</title>
    <link rel="stylesheet" href="stylebase.css">
</head>
<body>
    
    <header>
        <h1>Aprender de Vidas</h1>
    </header>
    <nav>
            <div class="enlaces">
                <a href="home.jsp" > Inicio </a>
                <a href="Listado.jsp" >Buscar Curso</a>
                <a href="perfil.jsp" >Perfil</a>
                <a href="index.jsp" >Cerrar Sesión</a>
            </div>
        </nav>
    <form method="GET" action="Listado.jsp">
                <select name="category">
                    
                    <% 
                    conexion con = new conexion();
                    ResultSet rsCategory = con.consulta("SELECT * FROM tb_cursos");
                    while (rsCategory.next()) {
                        int categoryId = rsCategory.getInt("idcurso");
                        String categoryName = rsCategory.getString("nombrecurso");
                    %>
                    <option value="<%= categoryId %>"><%= categoryName %></option>
                    <% } %>
                </select>
                
                <button type="submit">Buscar</button>
            </form>

  	<% 
            String categoryIdParam = request.getParameter("category");
            String productNameParam = request.getParameter("productName");
            
            if ((categoryIdParam != null && !categoryIdParam.isEmpty()) || (productNameParam != null && !productNameParam.isEmpty())) {
                String query = "SELECT * FROM tb_cursos WHERE 1=1";
                
                if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                    query += " AND idcurso = " + Integer.parseInt(categoryIdParam);
                }
                if (productNameParam != null && !productNameParam.isEmpty()) {
                    query += " AND nombrecurso LIKE '%" + productNameParam + "%'";
                }
                
                ResultSet rsProducts = con.consulta(query);
                
                if (rsProducts != null) {
                    ArrayList<String[]> results = new ArrayList<>();
                    while(rsProducts.next()) { 
                        String[] result = new String[4];
                        result[0] = rsProducts.getInt("idcurso") + "";
                        result[1] = rsProducts.getString("nombrecurso");
                        result[2] = rsProducts.getString("descripcioncurso") + "";
                        result[3] = rsProducts.getDouble("preciocurso") + "";
                        results.add(result);
                    }
                    
                    if (!results.isEmpty()) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                </tr>
                <% 
                    for (String[] result : results) {
                %>
                <tr>
                    <td><%= result[0] %></td>
                    <td><%= result[1] %></td>
                    <td><%= result[2] %></td>
                    <td><%= result[3] %></td>                    
                </tr>
                <% 
                    }
                %>
            </table>
            <% 
                    } else {
                %>
            <p>No se encontraron productos para los criterios de búsqueda seleccionados.</p>
            <% 
                    }
                }
            }
            %>
    <footer>
        <p>© 2024 Aprender de la vida</p>
    </footer>
</body>
</html>
