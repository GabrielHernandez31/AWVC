/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author boowe
 */
public class Caseta {

    private int id_caseta;
    private String nombre_caseta;
    private String ubicacion_caseta;
    private String costo_caseta;
    private String estatus_caseta;

    public int getId_caseta() {
        return id_caseta;
    }

    public void setId_caseta(int id_caseta) {
        this.id_caseta = id_caseta;
    }

    public String getNombre_caseta() {
        return nombre_caseta;
    }

    public void setNombre_caseta(String nombre_caseta) {
        this.nombre_caseta = nombre_caseta;
    }

    public String getUbicacion_caseta() {
        return ubicacion_caseta;
    }

    public void setUbicacion_caseta(String ubicacion_caseta) {
        this.ubicacion_caseta = ubicacion_caseta;
    }

    public String getCosto_caseta() {
        return costo_caseta;
    }

    public void setCosto_caseta(String costo_caseta) {
        this.costo_caseta = costo_caseta;
    }

    public String getEstatus_caseta() {
        return estatus_caseta;
    }

    public void setEstatus_caseta(String estatus_caseta) {
        this.estatus_caseta = estatus_caseta;
    }

    public Caseta() {

    }

    public boolean createCaseta() {
        try {
            final String sql = "Insert into caseta values (default,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_caseta());
            insertarUsuario.setString(2, getUbicacion_caseta());
            insertarUsuario.setInt(3, Integer.parseInt(getCosto_caseta()));
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validarUbicacionRegistro() {
        try {
            final String sql = "Select * from caseta where ubicacion_caseta = ?";
            Conexion conex = new Conexion();
            PreparedStatement validarCorreo = conex.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getUbicacion_caseta());
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                validarCorreo.close();
                validar.close();
                conex.obtenerConnexion().close();
                return false;
            } else {
                validarCorreo.close();
                validar.close();
                conex.obtenerConnexion().close();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateCaseta() {
        try {
            final String sql = "Update caseta set nombre_caseta=?, costo_caseta=? where id_caseta= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, getNombre_caseta());
            actualizarUsuario.setInt(2, Integer.parseInt(getCosto_caseta()));
            actualizarUsuario.setInt(3, getId_caseta());
            actualizarUsuario.executeUpdate();
            actualizarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCaseta() {
        try {
            final String sql = "Update caseta set estado_caseta='Baja' where id_caseta= ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_caseta());
            eliminarUsuario.executeUpdate();
            eliminarUsuario.close();
            conex.obtenerConnexion().close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String[][] consultarCasetas() {
        try {
            final String sql = "Select * from caseta";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarCasetas()][4];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_caseta");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_caseta");
                arreglo_servicio[cuenta][2] = resulProducto.getString("ubicacion_caseta");
                arreglo_servicio[cuenta][3] = resulProducto.getString("costo_caseta");
            }
            consultarProducto.close();
            resulProducto.close();
            conex.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }
    
    public String[][] consultarCasetasModificar() {
        try {
            final String sql = "Select * from caseta where id_caseta = ?";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.setInt(1, getId_caseta());
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarCasetas()][4];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_caseta");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_caseta");
                arreglo_servicio[cuenta][2] = resulProducto.getString("ubicacion_caseta");
                arreglo_servicio[cuenta][3] = resulProducto.getString("costo_caseta");
            }
            consultarProducto.close();
            resulProducto.close();
            conex.obtenerConnexion().close();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }

    public int contarCasetas() {
        try {
            int resultado;
            final String sql = "Select count(*) from caseta";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenCasetas() {
        try {
            final String sql = "Select * from caseta";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
