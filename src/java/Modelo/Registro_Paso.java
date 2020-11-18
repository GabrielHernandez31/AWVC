/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Registro_Paso {
    private int id_registro_paso;
    private String nombre_usuario;
    private String placa_auto;
    private String rfid;
    private String caseta;
    private String servicio;
    private String ubicacion_servicio;
    private String fecha_paso;
    private String hora_paso;

    public int getId_registro_paso() {
        return id_registro_paso;
    }

    public void setId_registro_paso(int id_registro_paso) {
        this.id_registro_paso = id_registro_paso;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getPlaca_auto() {
        return placa_auto;
    }

    public void setPlaca_auto(String placa_auto) {
        this.placa_auto = placa_auto;
    }

    public String getRfid() {
        return rfid;
    }

    public void setRfid(String rfid) {
        this.rfid = rfid;
    }

    public String getCaseta() {
        return caseta;
    }

    public void setCaseta(String caseta) {
        this.caseta = caseta;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public String getUbicacion_servicio() {
        return ubicacion_servicio;
    }

    public void setUbicacion_servicio(String ubicacion_servicio) {
        this.ubicacion_servicio = ubicacion_servicio;
    }

    public String getFecha_paso() {
        return fecha_paso;
    }

    public void setFecha_paso(String fecha_paso) {
        this.fecha_paso = fecha_paso;
    }

    public String getHora_paso() {
        return hora_paso;
    }

    public void setHora_paso(String hora_paso) {
        this.hora_paso = hora_paso;
    }

    
    public boolean createRegistroPaso() {
        try {
            final String sql = "Insert into registro_paso values (default,?,?,?,?,?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_usuario());
            insertarUsuario.setString(2, getPlaca_auto());
            insertarUsuario.setString(3, getRfid());
            insertarUsuario.setString(4, getCaseta());
            insertarUsuario.setString(5, getServicio());
            insertarUsuario.setString(6, getUbicacion_servicio());
            insertarUsuario.setString(7, getFecha_paso());
            insertarUsuario.setString(8, getHora_paso());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            conex.obtenerConnexion().close();
            closeDB();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String[][] consultarRegistrosPasos() {
        try {
            final String sql = "Select * from registro_paso";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarRegistrosPasos()][9];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_registro");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario");
                arreglo_servicio[cuenta][2] = resulProducto.getString("placa_auto");
                arreglo_servicio[cuenta][3] = resulProducto.getString("rfid");
                arreglo_servicio[cuenta][4] = resulProducto.getString("caseta");
                arreglo_servicio[cuenta][5] = resulProducto.getString("servicio");
                arreglo_servicio[cuenta][6] = resulProducto.getString("ubicacion_servicio");
                arreglo_servicio[cuenta][7] = resulProducto.getString("fecha_de_paso");
                arreglo_servicio[cuenta][8] = resulProducto.getString("hora_de_paso");
            }
            consultarProducto.close();
            resulProducto.close();
            conex.obtenerConnexion().close();
            closeDB();
            return arreglo_servicio;
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[][] arreglo_sinDatos = new String[0][0];
        return arreglo_sinDatos;
    }
    
    public int contarRegistrosPasos() {
        try {
            int resultado;
            final String sql = "Select count(*) from registro_paso";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                resultado = resulProducto.getInt("count");
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                closeDB();
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                closeDB();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean existenRegistrosPasos() {
        try {
            final String sql = "Select * from registro_paso";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            if (resulProducto.next()) {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                closeDB();
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                conex.obtenerConnexion().close();
                closeDB();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public void closeDB(){
        try {
            final String sql = "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='awcv'";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            consultarProducto.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
