package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion 
{
    
    private final String BD = "bd_refaccionaria";
    private final String USUARIO = "postgres";
    private final String CLAVE = "12345";
    
    private final String URL = "jdbc:postgresql://localhost:5432/" + BD;
    
    private Connection conexion = null;

    public Connection getConexion() 
    {
        try 
        {

            Class.forName("org.postgresql.Driver");
            
            conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
            System.out.println("Conexipn exitosa a la bd de la Refaccionaria");
            
        } catch (ClassNotFoundException e) 
        {
            System.out.println("Error, no se encontro el driver de PostgreSQL. " + e.getMessage());
        } catch (SQLException e) 
        {
            System.out.println("Error, revisa contraseña o si el servidor esta encendido. " + e.getMessage());
        }
        return conexion;
    }

    public void desconectar() 
    {
        try 
        {
            if (conexion != null && !conexion.isClosed()) 
            {
                conexion.close();
                System.out.println("Conexion cerrada correctamente.");
            }
        } catch (SQLException e) 
        {
            System.out.println("Error al cerrar conexion " + e.getMessage());
        }
    }
}
