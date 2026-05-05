<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Refaccionaria</title>
    </head>
    <body>
        <h2>Acceso al Sistema - Refaccionaria</h2>
        
        <!-- Formulario manda los datos directo al LoginServlet -->
        <form action="LoginServlet" method="POST">
            <label>Usuario:</label><br>
            <!-- Nombre igual como se puso en el servlet -->
            <input type="text" name="txtUsuario" required>
            <br><br>
            
            <label>Contraseña:</label><br>
            <input type="password" name="txtContra" required>
            <br><br>
            
            <input type="submit" value="Iniciar Sesión">
        </form>

        <!-- Checa si se equivoca de contraseña -->
        <%
            if(request.getAttribute("Error") != null){
                out.print("<br><p style='color:red; font-weight:bold;'>" + request.getAttribute("Error") + "</p>");
            }
        %>
    </body>
</html>
