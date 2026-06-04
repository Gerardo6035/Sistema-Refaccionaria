package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Refaccion;
import config.Conexion;

public class RefaccionDAO
{
    
    Conexion conObj = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    //Metodo para las refacciones y mostrarlas en una tabla
    public List<Refaccion> listarTodo() 
    {
        List<Refaccion> lista = new ArrayList<>();
        String sql = "SELECT * FROM refaccion";//Consulta SELECT
        
        try 
        {
            con = conObj.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) 
            {
                Refaccion ref = new Refaccion();
                ref.setId_refaccion(rs.getInt("id_refaccion"));
                ref.setCodigo(rs.getString("codigo"));
                ref.setNombre(rs.getString("nombre"));
                ref.setPrecio(rs.getDouble("precio"));
                ref.setStock(rs.getInt("stock"));
                ref.setCategoria(rs.getString("categoria"));
                
                lista.add(ref);
            }
            con.close();
        } catch (SQLException e)
        {
            System.out.println("Error al listar refacciones: " + e.getMessage());
        }
        return lista;
    }

    //Metodo para agregar una refaccion a la base de datos
    public boolean agregar(Refaccion ref) 
    {
        //INSERT con signos de interrogacion por seguridad
        String sql = "INSERT INTO refaccion (codigo, nombre, descripcion, precio, stock, categoria) VALUES (?, ?, ?, ?, ?, ?)";
        
        try 
        {
            con = conObj.getConexion();
            ps = con.prepareStatement(sql);
            
            
            ps.setString(1, ref.getCodigo());
            ps.setString(2, ref.getNombre());
            ps.setString(3, ref.getDescripcion());
            ps.setDouble(4, ref.getPrecio());
            ps.setInt(5, ref.getStock());
            ps.setString(6, ref.getCategoria());
            
            ps.executeUpdate();
            con.close();
            
            return true;
            
        } catch (Exception e) 
        {
            System.out.println("Error al insertar refacción: " + e.getMessage());
            return false;
        }
    }
}