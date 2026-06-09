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
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Punto de Venta - Refaccionaria</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">🛒 Punto de Venta</a>
                <div class="d-flex text-white align-items-center">
                    <span class="me-4">👤 Cajero: <%= usu.getNombre_usuario() %></span>
                    <a href="Principal.jsp" class="btn btn-outline-light btn-sm">Menu Principal</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="row">
                
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm border-0 mb-3">
                        <div class="card-body">
                            <h5 class="card-title fw-bold text-secondary">🔍 Buscar Pieza</h5>
                            <form action="VentaController" method="POST" class="d-flex mt-3">
                                <input type="hidden" name="accion" value="buscarProducto">
                                <input type="text" name="txtCodigo" class="form-control me-2" placeholder="Codigo..." required autofocus>
                                <button type="submit" class="btn btn-primary">Buscar</button>
                            </form>
                        </div>
                    </div>

                    <% if (productoEncontrado != null && productoEncontrado.getNombre() != null)
                       { %>
                        <div class="card border-primary shadow-sm">
                            <div class="card-header bg-primary text-white fw-bold">
                                Pieza Encontrada
                            </div>
                            <div class="card-body">
                                <form action="VentaController" method="POST">
                                    <input type="hidden" name="accion" value="agregarCarrito">
                                    <input type="hidden" name="txtIdRefaccion" value="<%= productoEncontrado.getId_refaccion() %>">
                                    <input type="hidden" name="txtNombre" value="<%= productoEncontrado.getNombre() %>">
                                    <input type="hidden" name="txtPrecio" value="<%= productoEncontrado.getPrecio() %>">
                                    <input type="hidden" name="txtCodigoOriginal" value="<%= productoEncontrado.getCodigo() %>">
                                    
                                    <h5 class="fw-bold"><%= productoEncontrado.getNombre() %></h5>
                                    <p class="mb-1 text-success fw-bold fs-5">$<%= productoEncontrado.getPrecio() %></p>
                                    <p class="text-muted small">Stock disponible: <span class="badge bg-secondary"><%= productoEncontrado.getStock() %> pz</span></p>
                                    
                                    <div class="input-group mt-3">
                                        <span class="input-group-text">Cantidad</span>
                                        <input type="number" name="txtCantidad" class="form-control" value="1" min="1" max="<%= productoEncontrado.getStock() %>" required>
                                        <button type="submit" class="btn btn-success">➕ Agregar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    <% } else if (productoEncontrado != null)
                       { %>
                        <div class="alert alert-danger shadow-sm text-center" role="alert">
                            No se encontro la pieza o no hay stock.
                        </div>
                    <% } %>
                </div>

                <div class="col-md-8">
                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <h4 class="fw-bold text-secondary">Lista de Compras</h4>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped text-center align-middle mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Nombre</th>
                                            <th>Precio Unit.</th>
                                            <th>Cantidad</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            if (carrito != null && !carrito.isEmpty()) {
                                                for (DetalleVenta det : carrito) {
                                        %>
                                        <tr>
                                            <td class="fw-bold text-muted"><%= det.getRefaccion().getCodigo() %></td>
                                            <td><%= det.getRefaccion().getNombre() %></td>
                                            <td>$<%= det.getPrecio_unitario() %></td>
                                            <td><span class="badge bg-primary rounded-pill px-3"><%= det.getCantidad() %></span></td>
                                            <td class="fw-bold text-success">$<%= det.getSubtotal() %></td>
                                        </tr>
                                        <% 
                                                }
                                            } else {
                                        %>
                                        <tr>
                                            <td colspan="5" class="py-5 text-muted">Carrito vacio</td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="card-footer bg-light p-4 text-end">
                            <h2 class="fw-bold text-success mb-4">Total: $<%= totalVenta %></h2>
                            
                            <% if (carrito != null && !carrito.isEmpty()) { %>
                                <div class="d-flex justify-content-end gap-2">
                                    <form action="VentaController" method="POST" class="m-0">
                                        <input type="hidden" name="accion" value="cancelarVenta">
                                        <button type="submit" class="btn btn-outline-danger btn-lg">Cancelar Venta</button>
                                    </form>
                                    <form action="VentaController" method="POST" class="m-0">
                                        <input type="hidden" name="accion" value="generarVenta">
                                        <button type="submit" class="btn btn-success btn-lg shadow">Cobrar y Finalizar</button>
                                    </form>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
