package modelo;

public class Inventario {
    private int id_inventario;
    private int id_producto;
    private int stock_actual;
    private int stock_minimo;
    
    public Inventario() {
    }

    public Inventario(int id_inventario, int id_producto, int stock_actual, int stock_minimo) {
        this.id_inventario = id_inventario;
        this.id_producto = id_producto;
        this.stock_actual = stock_actual;
        this.stock_minimo = stock_minimo;
    }

    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getStock_actual() {
        return stock_actual;
    }

    public void setStock_actual(int stock_actual) {
        this.stock_actual = stock_actual;
    }

    public int getStock_minimo() {
        return stock_minimo;
    }

    public void setStock_minimo(int stock_minimo) {
        this.stock_minimo = stock_minimo;
    }
    
}