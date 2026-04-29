package modelo;

public class Producto {
    private int id_producto;
    private String nombre_producto;
    private double precio_venta;
    private int id_categoria;
    
    public Producto() {
    }

    public Producto(int id_producto, String nombre_producto, double precio_venta, int id_categoria) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.precio_venta = precio_venta;
        this.id_categoria = id_categoria;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }
    
}