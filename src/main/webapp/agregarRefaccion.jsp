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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Refaccion</title>
    </head>
    <body>
        <h2>Registrar Nueva Pieza</h2>
        <a href="RefaccionController?accion=listar">Regresar al Inventario</a>
        <hr>
        
        <form action="RefaccionController" method="POST">
            <input type="hidden" name="accion" value="guardar">
            
            <label>Codigo de la pieza:</label><br>
            <input type="text" name="txtCodigo" required><br><br>
            
            <label>Nombre:</label><br>
            <input type="text" name="txtNombre" required><br><br>
            
            <label>Descripcion:</label><br>
            <input type="text" name="txtDescripcion"><br><br>
            
            <label>Precio:</label><br>
            <input type="number" step="0.01" name="txtPrecio" required><br><br>
            
            <label>Stock (Cantidad):</label><br>
            <input type="number" name="txtStock" required><br><br>
            
            <label>Categoria:</label><br>
            <select name="txtCategoria">
                <option value="Motor">Motor</option>
                <option value="Frenos">Frenos</option>
                <option value="Suspension">Suspensión</option>
                <option value="Electrico">Eléctrico</option>
                <option value="Lubricantes">Lubricantes</option>
            </select><br><br>
            
            <input type="submit" value="Guardar Refaccion">
        </form>
    </body>
</html>