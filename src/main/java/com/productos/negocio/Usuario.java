package com.productos.negocio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.productos.datos.conexion;

public class Usuario {
    private String nombre;
    private String correo;
    private String clave;
    private String cedula;
    private int perfilId;
    private int estadoId;

    // Constructor
    public Usuario(String nombre,String cedula, String correo, String clave, int perfilId, int estadoId) {
        this.nombre = nombre;
        this.cedula = cedula;
        this.correo = correo;
        this.clave = clave;
        this.perfilId = perfilId;
        this.estadoId = estadoId;
    }

    // Método para ingresar un nuevo clientes
    public String ingresarCliente() {
        String result = "";
        conexion con = new conexion();
        Connection connection = null;
        PreparedStatement pr = null;

        String sql = "INSERT INTO tb_usuario (nombre_us, cedula_us, correo_us, clave_us, id_per, id_est) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            connection = con.crearConexion();
            pr = connection.prepareStatement(sql);
            pr.setString(1, this.nombre);
            pr.setString(2, this.cedula);
            pr.setString(3, this.correo);
            pr.setString(4, this.clave);
            pr.setInt(5, this.perfilId);
            pr.setInt(6, this.estadoId);

            int rowsAffected = pr.executeUpdate();
            if (rowsAffected == 1) {
                result = "Inserción correcta";
            } else {
                result = "Error en la inserción";
            }
        } catch (SQLException ex) {
            result = "Error en la inserción: " + ex.getMessage();
            ex.printStackTrace(); 
        } finally {
            try {
                if (pr != null) {
                    pr.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        return result;
    }
    public String autenticar(String username, String password) {
        String result = "";
        conexion con = new conexion();
        Connection connection = null;
        PreparedStatement pr = null;
        ResultSet rs = null;

        String sql = "SELECT id_per FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";

        try {
            connection = con.crearConexion();
            pr = connection.prepareStatement(sql);
            pr.setString(1, username);
            pr.setString(2, password);

            rs = pr.executeQuery();

            if (rs.next()) {
                int perfilId = rs.getInt("id_per");
               
                if (perfilId == 2) { 
                    result = "login.jsp";
                } else if (perfilId == 1) { 
                    result = "home.jsp";
                } else if (perfilId == 3){
                    result = "login.jsp"; 
                }
            } else {
                result = "login.jsp";
            }
        } catch (SQLException ex) {
            result = "Error en la autenticación: " + ex.getMessage();
            ex.printStackTrace(); 
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pr != null) {
                    pr.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        return result;
    }
    
    public void DatosUser(String username) {
        conexion con = new conexion();
        Connection connection = null;
        PreparedStatement pr = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM tb_usuario WHERE correo_us = ?";

        try {
            connection = con.crearConexion();
            pr = connection.prepareStatement(sql);
            pr.setString(1, username);

            rs = pr.executeQuery();

            if (rs.next()) {
                
                this.nombre = rs.getString("nombre_us");
                this.cedula = rs.getString("cedula_us");
                this.correo = rs.getString("correo_us");
                this.clave = rs.getString("clave_us");
                this.perfilId = rs.getInt("id_per");
                this.estadoId = rs.getInt("id_est");
            } else {
                
                System.out.println("Usuario no encontrado para el correo y contraseña proporcionados.");
            }
        } catch (SQLException ex) {
            System.out.println("Error en la autenticación: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pr != null) {
                    pr.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
    }
    public String actualizarContraseña(String correo, String nuevaContraseña) {
        String result = "";
        conexion con = new conexion();
        Connection connection = null;
        PreparedStatement pr = null;

        String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";

        try {
            connection = con.crearConexion();
            pr = connection.prepareStatement(sql);
            pr.setString(1, nuevaContraseña);
            pr.setString(2, correo);

            int rowsAffected = pr.executeUpdate();
            if (rowsAffected == 1) {
                result = "Contraseña actualizada correctamente";
            } else {
                result = "No se pudo actualizar la contraseña";
            }
        } catch (SQLException ex) {
            result = "Error al actualizar la contraseña: " + ex.getMessage();
            ex.printStackTrace(); 
        } finally {
            try {
                if (pr != null) {
                    pr.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        return result;
    }
    
    public String Cambiar_estado(int estadoCivil) {
    	String res = null;
    	if (estadoCivil==1) {
    		res = "Soltero";
        } else if (estadoCivil==2) {
        	res = "Casado";
        } else if (estadoCivil==3) {
        	res = "Divorciado";
        }
    	return res;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula	) {
    	if (cedula.equals("NA")) {
            // Generar cédula aleatoria basada en la fecha del sistema
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
            String fechaActual = dateFormat.format(new Date());

            Random random = new Random();
            int numAleatorio = random.nextInt(10000); // Genera un número aleatorio entre 0 y 9999

            this.cedula = fechaActual + String.format("%04d", numAleatorio);
        } else {
            this.cedula = cedula;
        }
    }
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getPerfilId() {
        return perfilId;
    }

    public void setPerfilId(int perfilId) {
        this.perfilId = perfilId;
    }

    public int getEstadoId() {
        return estadoId;
    }

    public void setEstadoId(int estadoId) {
        this.estadoId = estadoId;
    }
}


