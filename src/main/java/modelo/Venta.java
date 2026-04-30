package modelo;

import java.sql.Timestamp;

public class Venta {
    private int id_venta;
    private int id_usuario;
    private Timestamp fecha_hora;
    private double total_venta;
    
    public Venta() {
    }

    public Venta(int id_venta, int id_usuario, Timestamp fecha_hora, double total_venta) {
        this.id_venta = id_venta;
        this.id_usuario = id_usuario;
        this.fecha_hora = fecha_hora;
        this.total_venta = total_venta;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Timestamp getFecha_hora() {
        return fecha_hora;
    }

    public void setFecha_hora(Timestamp fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    public double getTotal_venta() {
        return total_venta;
    }

    public void setTotal_venta(double total_venta) {
        this.total_venta = total_venta;
    }
}