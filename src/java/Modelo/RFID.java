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
public class RFID {

    private int id_rfid;
    private String serial_rfid;
    private String estatus_rfid;

    public int getId_rfid() {
        return id_rfid;
    }

    public void setId_rfid(int id_rfid) {
        this.id_rfid = id_rfid;
    }

    public String getSerial_rfid() {
        return serial_rfid;
    }

    public void setSerial_rfid(String serial_rfid) {
        this.serial_rfid = serial_rfid;
    }

    public String getEstatus_rfid() {
        return estatus_rfid;
    }

    public void setEstatus_rfid(String estatus_rfid) {
        this.estatus_rfid = estatus_rfid;
    }

    public RFID() {

    }

    public boolean createRFID() {
        try {
            final String sql = "Insert into rfid values (default,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getSerial_rfid());
            insertarUsuario.setString(2, getEstatus_rfid());
            insertarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validarSerialRegistro() {
        try {
            final String sql = "Select * from rfid where serial_rfid = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, serial_rfid);
            ResultSet validar = validarCorreo.executeQuery();
            if (validar.next()) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateRFID() {
        try {
            final String sql = "Update rfid set estatus_rfid=? where id_rfid= ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, estatus_rfid);
            actualizarUsuario.setInt(3, id_rfid);
            actualizarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCaseta() {
        try {
            final String sql = "Delete from rfid where id_rfid= ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_rfid());
            eliminarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String obtenerNombreRFID(String id) {
        try {
            final String sql = "Select * from rfid where id_rfid = ?";
            Conexion conex = new Conexion();
            PreparedStatement existenCategorias = conex.obtenerConnexion().prepareStatement(sql);
            existenCategorias.setInt(1, Integer.parseInt(id));
            ResultSet resulExistenCategorias = existenCategorias.executeQuery();
            if (resulExistenCategorias.next()) {
                String nombre = resulExistenCategorias.getString("serial_rfid");
                return nombre;
            } else {
                String nombre2 = "Sin asignar aun.";
                return nombre2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String nombre3 = "Sin asignar aun.";
        return nombre3;
    }

    public String[][] consultarRFID() {
        try {
            final String sql = "Select * from rfid";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarCasetas()][3];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_rfid");
                arreglo_servicio[cuenta][1] = resulProducto.getString("serial_rfid");
                arreglo_servicio[cuenta][2] = resulProducto.getString("estatus_rfid");
            }
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
            final String sql = "Select count(*) from rfid";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                return resultado;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenCasetas() {
        try {
            final String sql = "Select * from rfid";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
