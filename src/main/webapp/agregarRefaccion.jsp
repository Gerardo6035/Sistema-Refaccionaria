<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Candado para seguridad
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
        <title>Agregar Refacción</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow-lg border-0">
                        <div class="card-header bg-dark text-white text-center py-3">
                            <h4 class="mb-0">➕ Registrar Nueva Pieza</h4>
                        </div>
                        <div class="card-body p-4">
                            
                            <form action="RefaccionController" method="POST">
                                <input type="hidden" name="accion" value="guardar">
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Codigo de la pieza:</label>
                                    <input type="text" name="txtCodigo" class="form-control" required autofocus>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Nombre:</label>
                                    <input type="text" name="txtNombre" class="form-control" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Descripcion:</label>
                                    <textarea name="txtDescripcion" class="form-control" rows="2"></textarea>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <label class="form-label fw-bold">Precio:</label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" step="0.01" name="txtPrecio" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label fw-bold">Stock (Cant):</label>
                                        <input type="number" name="txtStock" class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <label class="form-label fw-bold">Categoria:</label>
                                    <select name="txtCategoria" class="form-select">
                                        <option value="Motor">Motor</option>
                                        <option value="Frenos">Frenos</option>
                                        <option value="Suspension">Suspension</option>
                                        <option value="Electrico">Electrico</option>
                                        <option value="Lubricantes">Lubricantes</option>
                                    </select>
                                </div>
                                
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-success btn-lg">Guardar Refaccion</button>
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
