package modelo;

import java.sql.Timestamp;

public class HistorialMovimiento {
    private int id_movimiento;
    private int id_usuario;
    private int id_inventario;
    private String tipo_movimiento;
    private Timestamp fecha;
    
    public HistorialMovimiento() {
    }

    public HistorialMovimiento(int id_movimiento, int id_usuario, int id_inventario, String tipo_movimiento, Timestamp fecha) {
        this.id_movimiento = id_movimiento;
        this.id_usuario = id_usuario;
        this.id_inventario = id_inventario;
        this.tipo_movimiento = tipo_movimiento;
        this.fecha = fecha;
    }

    public int getId_movimiento() {
        return id_movimiento;
    }

    public void setId_movimiento(int id_movimiento) {
        this.id_movimiento = id_movimiento;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
    }

    public String getTipo_movimiento() {
        return tipo_movimiento;
    }

    public void setTipo_movimiento(String tipo_movimiento) {
        this.tipo_movimiento = tipo_movimiento;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
    
}