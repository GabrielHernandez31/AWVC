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
    private int id_auto;
    private int id_caseta;
    private String fecha_paso;
    private String hora_paso;

    public int getId_registro_paso() {
        return id_registro_paso;
    }

    public void setId_registro_paso(int id_registro_paso) {
        this.id_registro_paso = id_registro_paso;
    }

    public int getId_auto() {
        return id_auto;
    }

    public void setId_auto(int id_auto) {
        this.id_auto = id_auto;
    }

    public int getId_caseta() {
        return id_caseta;
    }

    public void setId_caseta(int id_caseta) {
        this.id_caseta = id_caseta;
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
    
    public Registro_Paso() {

    }

    public boolean createRegistroPaso() {
        try {
            final String sql = "Insert into registro_paso values (default,?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setInt(1, getId_auto());
            insertarUsuario.setInt(2, getId_caseta());
            insertarUsuario.setString(3, getFecha_paso());
            insertarUsuario.setString(4, getHora_paso());
            insertarUsuario.executeUpdate();
            insertarUsuario.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String[][] consultarRegistrosPasos() {
        try {
            final String sql = "Select "
                    + "(id_registro_paso, nombre_usuario,  app_usuario, apm_usuario, placa_auto, serial_rfid, nombre_caseta, nombre_servicio, ubicacion_servicio, fecha_paso, hora_paso) "
                    + "from registro_paso "
                    + "inner join automovil on registro_paso.id_auto=automovil.id_auto "
                    + "inner join usuario on automovil.id_usuario=usuario.id_usuario "
                    + "inner join rfid on automovil.id_rfid=rfid.id_rfid "
                    + "inner join caseta on registro_paso.id_caseta=caseta.id_caseta "
                    + "inner join servicio on registro_paso.id_servicio=servicio.id_servicio";
            Conexion conex = new Conexion();
            PreparedStatement consultarProducto = conex.obtenerConnexion().prepareStatement(sql);
            ResultSet resulProducto = consultarProducto.executeQuery();
            int cuenta = -1;
            String[][] arreglo_servicio = new String[contarRegistrosPasos()][9];
            while (resulProducto.next()) {
                cuenta++;
                arreglo_servicio[cuenta][0] = resulProducto.getString("id_registro_paso");
                arreglo_servicio[cuenta][1] = resulProducto.getString("nombre_usuario") + " " + resulProducto.getString("app_usuario") + " " + resulProducto.getString("apm_usuario").charAt(0) + "." ;
                arreglo_servicio[cuenta][2] = resulProducto.getString("placa_auto");
                arreglo_servicio[cuenta][3] = resulProducto.getString("serial_refid");
                arreglo_servicio[cuenta][4] = resulProducto.getString("nombre_caseta");
                arreglo_servicio[cuenta][5] = resulProducto.getString("nombre_servicio");
                arreglo_servicio[cuenta][6] = resulProducto.getString("ubicacion_servicio");
                arreglo_servicio[cuenta][7] = resulProducto.getString("fecha_paso");
                arreglo_servicio[cuenta][8] = resulProducto.getString("hora_paso");
            }
            consultarProducto.close();
            resulProducto.close();
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
                return resultado;
            } else {
                consultarProducto.close();
                resulProducto.close();
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
                return true;
            } else {
                consultarProducto.close();
                resulProducto.close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
