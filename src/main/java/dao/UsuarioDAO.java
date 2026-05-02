package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Usuario;

public class UsuarioDAO 
{
    
    //Variables  para conectar a la base
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    //Metodo que checa si el usuario y la contraseña son correctos
    public Usuario iniciarSesion(String nombreUser, String pass) 
    {
        Usuario usu = null; //Vacío por si pone mal la contraseña
        //Query para buscarlo en la tabla
        String sql = "SELECT * FROM usuario WHERE nombre_usuario = ? AND contrasena = ?";
        
        try 
        {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            //Se le pone el nombre y la contra a los signos de interrogacion
            ps.setString(1, nombreUser); 
            ps.setString(2, pass);  
            
            //Busqueda
            rs = ps.executeQuery();
            
            //Si encuentr sacam sus datos y los mete
            if (rs.next()) 
            {
                usu = new Usuario(); 
                usu.setId_usuario(rs.getInt("id_usuario"));
                usu.setNombre_usuario(rs.getString("nombre_usuario"));
                usu.setContrasena(rs.getString("contrasena"));
                usu.setRol(rs.getString("rol"));
            }
            
        } catch (Exception e) 
        {
            System.out.println("Tronó algo en el login: " + e.getMessage());
        } finally 
        {
            //Cierra la conexion para que no saturar
            cn.desconectar();
        }
        
        //Regresa al usuario ya con datos y si no encuentra se queda nulo 
        return usu;
    }
}
