<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Checa que la memoria traiga un usuario
    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
    if(usu == null){
        //Regresa al index si no se ha logueado
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Menú Principal - Refaccionaria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">⚙️ Sistema Refaccionaria</a>
            
            <div class="d-flex text-white align-items-center">
                <span class="me-4">👤 <%= usu.getNombre_usuario() %> | <strong><%= usu.getRol() %></strong></span>
                <form action="LogoutServlet" method="POST" class="m-0">
                    <button type="submit" class="btn btn-danger btn-sm">Cerrar Sesion</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-center mb-5 fw-bold text-white">Panel de Control</h2>
        
        <div class="row justify-content-center">
            
            <div class="col-md-5 mb-4">
                <div class="card shadow border-0 h-100 text-center transition-hover">
                    <div class="card-body py-5">
                        <h1 class="display-1 mb-3">📦</h1>
                        <h3 class="card-title fw-bold">Inventario</h3>
                        <p class="card-text text-muted px-3">Gestion de piezas, registro de refacciones nuevas y control de stock.</p>
                        <a href="RefaccionController?accion=listar" class="btn btn-primary btn-lg w-75 mt-3 shadow-sm">Abrir Inventario</a>
                    </div>
                </div>
            </div>

            <div class="col-md-5 mb-4">
                <div class="card shadow border-0 h-100 text-center">
                    <div class="card-body py-5">
                        <h1 class="display-1 mb-3">🛒</h1>
                        <h3 class="card-title fw-bold">Punto de Venta</h3>
                        <p class="card-text text-muted px-3">Busqueda por codigo, carrito de compras y cobro en mostrador.</p>
                        <a href="VentaController?accion=nuevaVenta" class="btn btn-success btn-lg w-75 mt-3 shadow-sm">Cobrar y Ventas</a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

</body>
</html>
