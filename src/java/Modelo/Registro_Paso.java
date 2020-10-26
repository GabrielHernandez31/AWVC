/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Registro_Paso {
    private int id_rfid;
    private int id_caseta;
    private String fecha_paso;
    private String hora_paso;

    public int getId_rfid() {
        return id_rfid;
    }

    public void setId_rfid(int id_rfid) {
        this.id_rfid = id_rfid;
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

    public boolean createCaseta() {
        try {
            final String sql = "Insert into registro_paso values (?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setInt(1, getId_rfid());
            insertarUsuario.setInt(2, getId_caseta());
            insertarUsuario.setString(3, getFecha_paso());
            insertarUsuario.setString(4, getHora_paso());
            insertarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
