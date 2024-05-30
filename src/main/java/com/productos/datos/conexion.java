package com.productos.datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class conexion {
    private String driver;
    private String user;
    private String pwd;
    private String cadena;
    private Connection con;
    
     public Connection crearConexion() {
        Connection conexion_ = null;
        try {
            Class.forName(this.driver);
            conexion_ = DriverManager.getConnection(this.cadena, this.user, this.pwd);
            System.out.println("Conexión exitosa");
        } catch (ClassNotFoundException e) {
            System.out.println("No se encontró el driver");
        } catch (SQLException e) {
            System.out.println("Error al conectar con la base de datos");
        }
        return conexion_;
    }

    public conexion() {
        this.driver = "org.postgresql.Driver";
        this.user = "postgres";
        this.pwd = "1234";
        this.cadena = "jdbc:postgresql://localhost:5432/db_productos";
        this.con = this.crearConexion();
    }

    public ResultSet consulta(String sql) {
        ResultSet rs = null;
        try {
            Statement stmt = this.con.createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("Error al ejecutar la consulta SQL: " + e.getMessage());
        }
        return rs;
    }
}

