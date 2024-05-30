package com.productos.negocio;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.conexion;

public class Cursos {
    private Connection con;
    private int idCurso;
    private String nombreCurso;
    private String descripcionCurso;
    private Double precioCurso;

    public Cursos() {
        conexion conObj = new conexion();
        this.con = conObj.crearConexion();
    }


    public Cursos(int idCurso, String nombreCurso, String descripcionCurso, Double precioCurso) {
        conexion conObj = new conexion();
        this.con = conObj.crearConexion();
        this.setIdCurso(idCurso);
        this.setNombreCurso(nombreCurso);
        this.setDescripcionCurso(descripcionCurso);
        this.setPrecioCurso(precioCurso);
        
    }

    public void obtenerCursoPorId(int idCurso) {
        try {
            if (this.con != null) {
                String sql = "SELECT nombreCurso, descripcionCurso, precioCurso FROM tb_cursos WHERE idCurso = " + idCurso;
                conexion conObj = new conexion();
                ResultSet rs = conObj.consulta(sql);
                if (rs.next()) {
                    String nombreCurso = rs.getString("nombreCurso");
                    String descripcionCurso = rs.getString("descripcionCurso");
                    double precioCurso = rs.getDouble("precioCurso");
                    this.setNombreCurso(nombreCurso);
                    this.setDescripcionCurso(descripcionCurso);
                    this.setPrecioCurso(precioCurso);
                } else {
                    System.out.println("No se encontró ningún curso con el ID proporcionado.");
                }
                rs.close();
            } else {
                System.out.println("La conexión es nula.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void eliminar(int idProducto) {
	    conexion obj = new conexion();
	    String sql = "DELETE FROM tb_cursos WHERE idcurso = " + idProducto;

	    try {
	        obj.consulta(sql);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}




	public int getIdCurso() {
		return idCurso;
	}
	public void setIdCurso(int idCurso) {
		this.idCurso = idCurso;
	}
	public String getNombreCurso() {
		return nombreCurso;
	}
	public void setNombreCurso(String nombreCurso) {
		this.nombreCurso = nombreCurso;
	}
	public String getDescripcionCurso() {
		return descripcionCurso;
	}
	public void setDescripcionCurso(String descripcionCurso) {
		this.descripcionCurso = descripcionCurso;
	}
	public Double getPrecioCurso() {
		return precioCurso;
	}
	public void setPrecioCurso(Double precioCurso) {
		this.precioCurso = precioCurso;
	}

   
}
