package modelo;

public class DetalleVenta {
    private int id_detalle;
    private int id_venta;
    private int id_refaccion;
    private int cantidad;
    private double precio_unitario;
    private double subtotal;
    
    //Objeto para poder traer el nombre o codigo de la pieza despues
    private Refaccion refaccion;
    
    public DetalleVenta() {
    }

    public DetalleVenta(int id_detalle, int id_venta, int id_refaccion, int cantidad, double precio_unitario, double subtotal) {
        this.id_detalle = id_detalle;
        this.id_venta = id_venta;
        this.id_refaccion = id_refaccion;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
        this.subtotal = subtotal;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_refaccion() {
        return id_refaccion;
    }

    public void setId_refaccion(int id_refaccion) {
        this.id_refaccion = id_refaccion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(double precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Refaccion getRefaccion() {
        return refaccion;
    }

    public void setRefaccion(Refaccion refaccion) {
        this.refaccion = refaccion;
    }
}
