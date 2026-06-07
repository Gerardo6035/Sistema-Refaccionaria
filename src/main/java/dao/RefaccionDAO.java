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

    //Metodo para listar todas las refacciones y mostrarlas en la tabla
    public List<Refaccion> listarTodo() 
    {
        List<Refaccion> lista = new ArrayList<>();
        String sql = "SELECT * FROM refaccion"; // consulta select
        
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
            System.out.println("error al listar refacciones: " + e.getMessage());
        }
        return lista;
    }

    //Metodo para agregar una refaccion a la base de datos
    public boolean agregar(Refaccion ref) 
    {
        //Insert con signos de interrogacion por seguridad
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
            System.out.println("error al insertar refaccion: " + e.getMessage());
            return false;
        }
    }

    //Metodo para eliminar una refaccion de la base de datos
    public void eliminar(int id) 
    {
        String sql = "DELETE FROM refaccion WHERE id_refaccion = ?";
        
        try 
        {
            con = conObj.getConexion(); 
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);//Pasa el id al signo de interrogacion
            
            ps.executeUpdate();//Ejecuta el borrado
            con.close(); 
            
        } catch (Exception e) 
        {
            System.out.println("error al eliminar refaccion: " + e.getMessage());
        }
    }

    //Metodo que busca una sola pieza por su id para llenar el formulario
    public Refaccion listarId(int id) 
    {
        Refaccion ref = new Refaccion();
        String sql = "SELECT * FROM refaccion WHERE id_refaccion = ?";
        
        try 
        {
            con = conObj.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) 
            {
                ref.setId_refaccion(rs.getInt("id_refaccion"));
                ref.setCodigo(rs.getString("codigo"));
                ref.setNombre(rs.getString("nombre"));
                ref.setDescripcion(rs.getString("descripcion"));
                ref.setPrecio(rs.getDouble("precio"));
                ref.setStock(rs.getInt("stock"));
                ref.setCategoria(rs.getString("categoria"));
            }
            con.close();
        } catch (Exception e) 
        {
            System.out.println("error al buscar por id: " + e.getMessage());
        }
        return ref;
    }

    //Metodo que ejecuta el update para guardar los cambios
    public boolean actualizar(Refaccion ref) 
    {
        String sql = "UPDATE refaccion SET codigo=?, nombre=?, descripcion=?, precio=?, stock=?, categoria=? WHERE id_refaccion=?";
        
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
            
            ps.setInt(7, ref.getId_refaccion());
            
            ps.executeUpdate();
            con.close();
            return true;
            
        } catch (Exception e) 
        {
            System.out.println("error al actualizar refaccion: " + e.getMessage());
            return false;
        }
    }

    //Metodo para buscar una refaccion por su codigo (para el punto de venta)
    public Refaccion buscarCodigo(String codigo) 
    {
        Refaccion ref = new Refaccion();
        String sql = "SELECT * FROM refaccion WHERE codigo = ?";
        
        try 
        {
            con = conObj.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, codigo);
            rs = ps.executeQuery();
            
            while (rs.next()) 
            {
                ref.setId_refaccion(rs.getInt("id_refaccion"));
                ref.setCodigo(rs.getString("codigo"));
                ref.setNombre(rs.getString("nombre"));
                ref.setPrecio(rs.getDouble("precio"));
                ref.setStock(rs.getInt("stock"));
            }
            con.close();
        } catch (Exception e) 
        {
            System.out.println("error al buscar codigo: " + e.getMessage());
        }
        return ref;
    }
}
