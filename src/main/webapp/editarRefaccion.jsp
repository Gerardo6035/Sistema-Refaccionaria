<%@page import="modelo.Refaccion"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Candado de seguridad
    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
    if(usu == null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
    //Recupera el objeto que mando el controlador
    Refaccion ref = (Refaccion) request.getAttribute("refaccionEditar");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar Refacción</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow-lg border-0">
                        <div class="card-header bg-dark text-white text-center py-3">
                            <h4 class="mb-0 fw-bold">✏️ Editar Pieza</h4>
                        </div>
                        <div class="card-body p-4">
                            
                            <form action="RefaccionController" method="POST">
                                <input type="hidden" name="accion" value="actualizar">
                                <input type="hidden" name="txtId" value="<%= ref.getId_refaccion() %>">
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Código de la pieza:</label>
                                    <input type="text" name="txtCodigo" class="form-control bg-light" value="<%= ref.getCodigo() %>" required readonly>
                                    <small class="text-muted">El código no se puede modificar.</small>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Nombre:</label>
                                    <input type="text" name="txtNombre" class="form-control" value="<%= ref.getNombre() %>" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Descripción:</label>
                                    <textarea name="txtDescripcion" class="form-control" rows="2"><%= ref.getDescripcion() != null ? ref.getDescripcion() : "" %></textarea>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <label class="form-label fw-bold">Precio:</label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" step="0.01" name="txtPrecio" class="form-control" value="<%= ref.getPrecio() %>" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label fw-bold">Stock (Cant):</label>
                                        <input type="number" name="txtStock" class="form-control" value="<%= ref.getStock() %>" required>
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <label class="form-label fw-bold">Categoría:</label>
                                    <select name="txtCategoria" class="form-select">
                                        <option value="Motor" <%= ref.getCategoria().equals("Motor") ? "selected" : "" %>>Motor</option>
                                        <option value="Frenos" <%= ref.getCategoria().equals("Frenos") ? "selected" : "" %>>Frenos</option>
                                        <option value="Suspensión" <%= ref.getCategoria().equals("Suspensión") ? "selected" : "" %>>Suspensión</option>
                                        <option value="Eléctrico" <%= ref.getCategoria().equals("Eléctrico") ? "selected" : "" %>>Eléctrico</option>
                                        <option value="Lubricantes" <%= ref.getCategoria().equals("Lubricantes") ? "selected" : "" %>>Lubricantes</option>
                                    </select>
                                </div>
                                
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-warning btn-lg fw-bold text-dark">Guardar Cambios</button>
                                    <a href="RefaccionController?accion=listar" class="btn btn-outline-secondary text-black">Cancelar y Regresar</a>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
