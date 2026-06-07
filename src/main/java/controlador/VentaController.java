package controlador;

import dao.RefaccionDAO;
import dao.VentaDAO;
import modelo.Refaccion;
import modelo.Venta;
import modelo.DetalleVenta;
import modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "VentaController", urlPatterns = {"/VentaController"})
public class VentaController extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        //Candado para seguridad
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) 
        {
            response.sendRedirect("index.jsp");
            return;
        }

        //Recupera el carrito de la sesion o lo crea si no existe
        List<DetalleVenta> carrito = (List<DetalleVenta>) session.getAttribute("carrito");
        if (carrito == null) 
        {
            carrito = new ArrayList<>();
            session.setAttribute("carrito", carrito);
        }

        String accion = request.getParameter("accion");
        RefaccionDAO rDao = new RefaccionDAO();
        VentaDAO vDao = new VentaDAO();

        if (accion == null || accion.equals("nuevaVenta")) 
        {
            //Redirige a la pantalla principal de cobro
            request.getRequestDispatcher("ventas.jsp").forward(request, response);
        }
        else if (accion.equals("buscarProducto")) 
        {
            //Busca el codigo que tecleo el cajero
            String codigo = request.getParameter("txtCodigo");
            Refaccion ref = rDao.buscarCodigo(codigo);
            
            //Manda la pieza de regreso para la cantidad
            request.setAttribute("productoEncontrado", ref);
            request.getRequestDispatcher("ventas.jsp").forward(request, response);
        }
        else if (accion.equals("agregarCarrito")) 
        {
            //Atrapa datos de la pieza que va al carrito
            int idRefaccion = Integer.parseInt(request.getParameter("txtIdRefaccion"));
            String nombre = request.getParameter("txtNombre");
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            
            //Calcula el subtotal de esa fila
            double subtotal = precio * cantidad;
            
            //Detalles de venta
            DetalleVenta detalle = new DetalleVenta();
            detalle.setId_refaccion(idRefaccion);
            detalle.setCantidad(cantidad);
            detalle.setPrecio_unitario(precio);
            detalle.setSubtotal(subtotal);
            
            //Nombre temporal para mostrar en la tabla visual
            Refaccion ref = new Refaccion();
            ref.setNombre(nombre);
            ref.setCodigo(request.getParameter("txtCodigoOriginal"));
            detalle.setRefaccion(ref);
            
            //Mete a la lista del carrito
            carrito.add(detalle);
            
            //Calcula el total a pagar sumando todo el carrito
            double total = 0;
            for(DetalleVenta d : carrito)
            {
                total += d.getSubtotal();
            }
            session.setAttribute("totalVenta", total);
            
            response.sendRedirect("VentaController?accion=nuevaVenta");
        }
        else if (accion.equals("generarVenta")) 
        {
            //Recupera el usuario que cobra en la caja
            Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
            double total = (double) session.getAttribute("totalVenta");
            
            //Arma el ticket general
            Venta venta = new Venta();
            venta.setId_usuario(usu.getId_usuario());
            venta.setTotal_venta(total);
            
            //Manda todo al dao para que guarde el ticket y reste el stock
            boolean exito = vDao.registrarVenta(venta, carrito);
            
            if (exito) 
            {
                //Si se cobro bien en postgre limpia el mostrador
                carrito.clear();
                session.setAttribute("totalVenta", 0.0);
            } 
            
            response.sendRedirect("VentaController?accion=nuevaVenta");
        }
        else if (accion.equals("cancelarVenta")) 
        {
            //Vacia el carrito si se cancela el pedido
            carrito.clear();
            session.setAttribute("totalVenta", 0.0);
            response.sendRedirect("VentaController?accion=nuevaVenta");
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