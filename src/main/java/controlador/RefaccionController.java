package controlador;

import dao.RefaccionDAO;
import modelo.Refaccion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RefaccionController", urlPatterns = {"/RefaccionController"})
public class RefaccionController extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        //Candado para la seguridad
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) 
        {
            response.sendRedirect("index.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        RefaccionDAO rDao = new RefaccionDAO();

        if (accion == null || accion.equals("listar")) 
        {
            List<Refaccion> lista = rDao.listarTodo();//Llama al DAO
            request.setAttribute("listaRefacciones", lista);
            //Redirige al JSP que mostrara la tabla
            request.getRequestDispatcher("inventario.jsp").forward(request, response);
        }
        else if (accion.equals("nuevo")) 
        {
            request.getRequestDispatcher("agregarRefaccion.jsp").forward(request, response);
        }
        else if (accion.equals("guardar")) 
        {
            //Atrapa los datos que el usuario dio en el formulario
            String codigo = request.getParameter("txtCodigo");
            String nombre = request.getParameter("txtNombre");
            String descripcion = request.getParameter("txtDescripcion");
            
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            
            String categoria = request.getParameter("txtCategoria");
            
            //Mete los datos al molde
            Refaccion nuevaRef = new Refaccion(codigo, nombre, descripcion, precio, stock, categoria);
            
            //El DAO guarda en PostgreSQL
            rDao.agregar(nuevaRef);
            
            //Regresa a la pantalla del inventario para que se la nueva pieza en la tabla
            response.sendRedirect("RefaccionController?accion=listar");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
    }
}