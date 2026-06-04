<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Checa que la memoria traiga un usuario
    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
    if(usu == null){
        //Regresa al index si no se ha logiado
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio - Refaccionaria</title>
    </head>
    <body>
        <h2>Bienvenido al sistema de la Refaccionaria</h2>
        
        <h3>Hola <%= usu.getNombre_usuario() %> | Nivel de acceso: <%= usu.getRol() %></h3>
        
        <hr>
        
        <h3>Seleccione una opción</h3>
        <ul>
            <li>
                <a href="RefaccionController?accion=listar">Checar el Inventario</a>
            </li>
            <li>
                <a href="Ventas.jsp">Cobrar y Ventas</a>
            </li>
        </ul>
        
        <hr>
        
        <form action="LogoutServlet" method="POST">
            <input type="submit" value="Cerrar sesión y salir">
        </form>
        
    </body>
</html>
