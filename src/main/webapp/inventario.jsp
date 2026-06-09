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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inventario - Refaccionaria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">⚙️ Sistema Refaccionaria</a>
            <div class="d-flex text-white align-items-center">
                <span class="me-4">👤 <%= usu.getNombre_usuario() %></span>
                <a href="Principal.jsp" class="btn btn-outline-light btn-sm">🏠 Volver al Menu</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-secondary fw-bold text-white">📦 Gestion de Inventario</h2>
            
            <% if (usu.getRol().equalsIgnoreCase("Administrador"))
               { %>
                <a href="RefaccionController?accion=nuevo" class="btn btn-success shadow-sm">
                    ➕ Agregar Nueva Pieza
                </a>
            <% } %>
        </div>

        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                
                <div class="table-responsive">
                    <table class="table table-striped table-hover mb-0 text-center align-middle">
                        <thead class="table-dark">
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
                                <td class="fw-bold text-secondary"><%= ref.getCodigo() %></td>
                                <td><%= ref.getNombre() %></td>
                                <td class="text-success fw-bold">$<%= ref.getPrecio() %></td>
                                <td>
                                    <span class="badge <%= ref.getStock() < 10 ? "bg-danger" : "bg-primary" %>">
                                        <%= ref.getStock() %> pz
                                    </span>
                                </td>
                                <td><%= ref.getCategoria() %></td>
                                
                                <% if (usu.getRol().equalsIgnoreCase("Administrador"))
                                   { %>
                                <td>
                                    <a href="RefaccionController?accion=editar&id=<%= ref.getId_refaccion() %>" class="btn btn-warning btn-sm shadow-sm">✏️ Editar</a>
                                    <a href="RefaccionController?accion=borrar&id=<%= ref.getId_refaccion() %>" onclick="return confirm('¿Seguro que desea borrar esta pieza?')" class="btn btn-danger btn-sm shadow-sm">🗑️ Borrar</a>
                                </td>
                                <% } %>
                            </tr>
                            <%
                                    }
                                } else 
                                {
                            %>
                            <tr>
                                <td colspan="6" class="py-4 text-muted">No hay refacciones registradas en el inventario.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        
    </div>

</body>
</html>
