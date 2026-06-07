<%@page import="modelo.Usuario"%>
<%@page import="modelo.Refaccion"%>
<%@page import="modelo.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Candado de seguridad
    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
    if(usu == null)
    {
        response.sendRedirect("index.jsp");
        return;
    }

    //Recupera el carrito y el total de la sesion
    List<DetalleVenta> carrito = (List<DetalleVenta>) session.getAttribute("carrito");
    Double totalVenta = (Double) session.getAttribute("totalVenta");
    if (totalVenta == null) totalVenta = 0.0;
    
    //Atrapa la pieza si es que se acaba de buscar un codigo
    Refaccion productoEncontrado = (Refaccion) request.getAttribute("productoEncontrado");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Punto de Venta</title>
    </head>
    <body>
        <h2>🛒 Punto de Venta</h2>
        <a href="Principal.jsp">Regresar al Menú Principal</a>
        <hr>

        <form action="VentaController" method="POST">
            <input type="hidden" name="accion" value="buscarProducto">
            <label>Código de la pieza:</label>
            <input type="text" name="txtCodigo" required autofocus>
            <input type="submit" value="Buscar">
        </form>
        <br>

        <% if (productoEncontrado != null && productoEncontrado.getNombre() != null) { %>
            <div style="background-color: #e6f7ff; padding: 10px; border: 1px solid #91d5ff;">
                <form action="VentaController" method="POST">
                    <input type="hidden" name="accion" value="agregarCarrito">
                    
                    <input type="hidden" name="txtIdRefaccion" value="<%= productoEncontrado.getId_refaccion() %>">
                    <input type="hidden" name="txtNombre" value="<%= productoEncontrado.getNombre() %>">
                    <input type="hidden" name="txtPrecio" value="<%= productoEncontrado.getPrecio() %>">
                    <input type="hidden" name="txtCodigoOriginal" value="<%= productoEncontrado.getCodigo() %>">
                    
                    <strong>Pieza:</strong> <%= productoEncontrado.getNombre() %> | 
                    <strong>Precio:</strong> $<%= productoEncontrado.getPrecio() %> | 
                    <strong>Stock disp:</strong> <%= productoEncontrado.getStock() %> <br><br>
                    
                    <label>Cantidad a vender:</label>
                    <input type="number" name="txtCantidad" value="1" min="1" max="<%= productoEncontrado.getStock() %>" required>
                    <input type="submit" value="Agregar al Carrito">
                </form>
            </div>
        <% } 
           else if (productoEncontrado != null)
           { %>
            <p style="color: red;">❌ No se encontro ninguna pieza con ese codigo o no hay stock.</p>
        <% } %>

        <hr>

        <h3>Lista de Compras</h3>
        <table border="1" width="60%">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Precio Unitario</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (carrito != null && !carrito.isEmpty())
                    {
                        for (DetalleVenta det : carrito) 
                        {
                %>
                <tr>
                    <td><%= det.getRefaccion().getCodigo() %></td>
                    <td><%= det.getRefaccion().getNombre() %></td>
                    <td>$<%= det.getPrecio_unitario() %></td>
                    <td><%= det.getCantidad() %></td>
                    <td>$<%= det.getSubtotal() %></td>
                </tr>
                <% 
                        }
                    } else
                   {
                %>
                <tr>
                    <td colspan="5" align="center">El carrito está vacío</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <h3>Total a Pagar: $<%= totalVenta %></h3>
        
        <% if (carrito != null && !carrito.isEmpty()) 
           { %>
            <form action="VentaController" method="POST" style="display:inline;">
                <input type="hidden" name="accion" value="generarVenta">
                <input type="submit" value="Cobrar y Finalizar" style="background-color: #52c41a; color: white; padding: 10px; font-weight: bold; cursor: pointer;">
            </form>
            
            <form action="VentaController" method="POST" style="display:inline;">
                <input type="hidden" name="accion" value="cancelarVenta">
                <input type="submit" value="Cancelar Venta" style="background-color: #ff4d4f; color: white; padding: 10px; cursor: pointer;">
            </form>
        <% } %>

    </body>
</html>