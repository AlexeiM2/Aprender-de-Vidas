<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
            <a href="admin.jsp">Inicio</a>
            <a href="perfil.jsp">Perfil</a>
            <a href="index.jsp">Cerrar Sesión</a>
        </div>
    </nav>
    <p>Desarrollado por: <span><a href="https://www.linkedin.com/in/alexandro-mendoza-03030b174/">Alexandro Mendoza</a></span></p>
    <p>En esta página podrás eliminar los cursos que no se encuentren disponibles.</p>
    
    <form method="GET" action="admin.jsp">
        <select name="category">
            <% 
                com.productos.datos.conexion con = new com.productos.datos.conexion();
                java.sql.ResultSet rsCategory = con.consulta("SELECT * FROM tb_cursos");
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
            
            java.sql.ResultSet rsProducts = con.consulta(query);
            
            if (rsProducts != null) {
                java.util.ArrayList<String[]> results = new java.util.ArrayList<>();
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
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Acción</th>
                </tr>
                <% 
                    for (String[] result : results) {
                %>
                <tr>
                    <td><%= result[0] %></td>
                    <td><%= result[1] %></td>
                    <td><%= result[2] %></td>
                    <td><%= result[3] %></td>    
                    <td>
                        <form method="POST" action="EliminarCurso.jsp">
                            <input type="hidden" name="idCurso" value="<%= result[0] %>">
                            <input type="submit" value="Eliminar" onclick="return confirm('¿Estás seguro de eliminar este curso?')">
                        </form>
                    </td>     
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
