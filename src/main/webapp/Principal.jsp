<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Checa usuario guardado
    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
    if(usu == null){
        //Si saltan el login regresa al index
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Principal - Refaccionaria</title>
    </head>
    <body>
        <h2>¡Bienvenido al sistema de la Refaccionaria!</h2>
        
        <!-- Muestra el nombre y el rol de quien ingreso -->
        <h3>Hola, <%= usu.getNombre_usuario() %> (Rol: <%= usu.getRol() %>)</h3>
        
        <p>Todo bien</p>
        
        <hr>
        <p>Menu para el Inventario, Ventas y los movimientos.</p>
        
        <br>
        <a href="index.jsp">Regresar al Login (provisional)</a>
    </body>
</html>
