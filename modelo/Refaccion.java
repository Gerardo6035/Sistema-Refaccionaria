package modelo;

public class Refaccion
{
    private int id_refaccion;
    private String codigo;
    private String nombre;
    private String descripcion;
    private double precio;
    private int stock;
    private String categoria;

    public Refaccion(){
    }

    public Refaccion(String codigo, String nombre, String descripcion, double precio, int stock, String categoria) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
    }
    
    public Refaccion(int id_refaccion, String codigo, String nombre, String descripcion, double precio, int stock, String categoria) {
        this.id_refaccion = id_refaccion;
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
    }

    public int getId_refaccion() {
        return id_refaccion;
    }

    public void setId_refaccion(int id_refaccion) {
        this.id_refaccion = id_refaccion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}