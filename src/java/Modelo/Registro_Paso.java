/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

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
}
