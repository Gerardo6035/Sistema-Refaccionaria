<%@page import="modelo.Refaccion"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Candado para la seguridad
    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
    if(usu == null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario - Refaccionaria</title>
    </head>
    <body>
        <h2>Gestión de Inventario</h2>
        <h3>Hola, <%= usu.getNombre_usuario() %></h3>
        <p><a href="Principal.jsp">Volver al Menu Principal</a> |
            <% if (usu.getRol().equalsIgnoreCase("Administrador"))
            { %>
            <a href="RefaccionController?accion=nuevo">Agregar Nueva Pieza</a>
            <% } %>
        </p>
        <hr>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Categoría</th>
                    <% if (usu.getRol().equalsIgnoreCase("Administrador"))
                    { %>
                    <th>Acciones</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <%
                    //Recupera la lista que mando el servlet
                    List<Refaccion> lista = (List<Refaccion>) request.getAttribute("listaRefacciones");
                    if (lista != null && !lista.isEmpty()) 
                    {
                        for (Refaccion ref : lista) 
                        {
                %>
                <tr>
                    <td><%= ref.getCodigo() %></td>
                    <td><%= ref.getNombre() %></td>
                    <td><%= ref.getPrecio() %></td>
                    <td><%= ref.getStock() %></td>
                    <td><%= ref.getCategoria() %></td>
                    <% if (usu.getRol().equalsIgnoreCase("Administrador"))
                    { %>
                    <td>
                        <a href="RefaccionController?accion=editar&id=<%= ref.getId_refaccion() %>">Editar️</a>
                        <a href="RefaccionController?accion=borrar&id=<%= ref.getId_refaccion() %>" onclick="return confirm('¿Seguro que desea borrar esta pieza?')">Borrar️</a>
                    </td>
                    <% } %>
                </tr>
                <%
                        }
                    } else 
                    {
                %>
                <tr>
                    <td colspan="6">No hay refacciones registradas aun en el inventario .</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
    </body>
</html>
