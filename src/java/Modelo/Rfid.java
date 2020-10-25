/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author boowe
 */
public class Rfid {
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
}
