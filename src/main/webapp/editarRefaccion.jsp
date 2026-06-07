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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Refaccion</title>
    </head>
    <body>
        <h2>Editar Pieza</h2>
        <a href="RefaccionController?accion=listar">Regresar al Inventario</a>
        <hr>
        
        <form action="RefaccionController" method="POST">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="txtId" value="<%= ref.getId_refaccion() %>">
            
            <label>Codigo de la pieza:</label><br>
            <input type="text" name="txtCodigo" value="<%= ref.getCodigo() %>" required><br><br>
            
            <label>Nombre:</label><br>
            <input type="text" name="txtNombre" value="<%= ref.getNombre() %>" required><br><br>
            
            <label>Descripcion:</label><br>
            <input type="text" name="txtDescripcion" value="<%= ref.getDescripcion() != null ? ref.getDescripcion() : "" %>"><br><br>
            
            <label>Precio:</label><br>
            <input type="number" step="0.01" name="txtPrecio" value="<%= ref.getPrecio() %>" required><br><br>
            
            <label>Stock (Cantidad):</label><br>
            <input type="number" name="txtStock" value="<%= ref.getStock() %>" required><br><br>
            
            <label>Categoria (Actual: <%= ref.getCategoria() %>):</label><br>
            <select name="txtCategoria">
                <option value="Motor" <%= ref.getCategoria().equals("Motor") ? "selected" : "" %>>Motor</option>
                <option value="Frenos" <%= ref.getCategoria().equals("Frenos") ? "selected" : "" %>>Frenos</option>
                <option value="Suspensión" <%= ref.getCategoria().equals("Suspensión") ? "selected" : "" %>>Suspensión</option>
                <option value="Eléctrico" <%= ref.getCategoria().equals("Eléctrico") ? "selected" : "" %>>Eléctrico</option>
                <option value="Lubricantes" <%= ref.getCategoria().equals("Lubricantes") ? "selected" : "" %>>Lubricantes</option>
            </select><br><br>
            
            <input type="submit" value="Guardar Cambios">
        </form>
    </body>
</html>