package dao;

import java.sql.*;
import java.util.List;
import modelo.Venta;
import modelo.DetalleVenta;
import config.Conexion;

public class VentaDAO
{
    Conexion conObj = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    //Metodo principal para registrar toda la venta en la base de datos
    public boolean registrarVenta(Venta venta, List<DetalleVenta> listaDetalle) 
    {
        String sqlVenta = "INSERT INTO venta (id_usuario, total_venta) VALUES (?, ?)";
        String sqlDetalle = "INSERT INTO detalleventa (id_venta, id_refaccion, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
        String sqlStock = "UPDATE refaccion SET stock = stock - ? WHERE id_refaccion = ?";
        
        int idVentaGenerado = 0;
        
        try{
            con = conObj.getConexion();
            //Desactiva el autocommit para que se ejecute como una sola transaccion
            con.setAutoCommit(false);
            
            //Inserta la venta general y pedimos que nos devuelva el id generado
            ps = con.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, venta.getId_usuario());
            ps.setDouble(2, venta.getTotal_venta());
            ps.executeUpdate();
            
            //Recupera el id de la venta que puso postgresql
            rs = ps.getGeneratedKeys();
            if (rs.next())
            {
                idVentaGenerado = rs.getInt(1);
            }
            
            //Prepara el insert para los detalles del carrito
            ps = con.prepareStatement(sqlDetalle);
            for (DetalleVenta detalle : listaDetalle) {
                ps.setInt(1, idVentaGenerado);//Usa el id que acaba de recuperar
                ps.setInt(2, detalle.getId_refaccion());
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecio_unitario());
                ps.setDouble(5, detalle.getSubtotal());
                ps.executeUpdate();
            }
            
            //Actualiza el stock de las refacciones una por una
            ps = con.prepareStatement(sqlStock);
            for (DetalleVenta detalle : listaDetalle)
            {
                ps.setInt(1, detalle.getCantidad());
                ps.setInt(2, detalle.getId_refaccion());//Id de la pieza
                ps.executeUpdate();
            }
            
            //Si salio bien guarda los cambios
            con.commit();
            con.close();
            return true;
            
        } 
        catch (Exception e) 
        {
            System.out.println("error al registrar la venta: " + e.getMessage());
            try {
                //Si algo falla cancela para no dejar datos incompletos
                if (con != null)
                {
                    con.rollback();
                }
            } catch (SQLException ex)
            {
                System.out.println("error en el rollback: " + ex.getMessage());
            }
            return false;
        }
    }
}