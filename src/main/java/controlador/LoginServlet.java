package controlador;

import dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import modelo.Usuario;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet 
{

    //El DAO para poder buscar al usuario
    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        //Saca lo que se escribio en los cuadros de texto
        String usuario = request.getParameter("txtUsuario");
        String contra = request.getParameter("txtContra");

        //Manda los datos al DAO para ver si esta en la bd
        Usuario usu = dao.iniciarSesion(usuario, contra);

        //Revisa que respondio
        if (usu != null) {
            //Crea una sesion para que no se ande cerrando a cada rato
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", usu);
            
            //Pantalla al sistema
            response.sendRedirect("Principal.jsp");
            
        } else {
            //Si se pone mal algo se regresa el login y manda un mensaje de error
            request.setAttribute("Error", "usuario o contraseña incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
