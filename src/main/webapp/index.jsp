<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Refaccionaria</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body class="d-flex align-items-center" style="height: 100vh;">
    
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header bg-dark text-white text-center py-3">
                        <h3 class="mb-0">️⚙ Refaccionaria</h3>
                    </div>
                    <div class="card-body p-4">
                        
                        <form action="LoginServlet" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Usuario</label>
                                <input type="text" name="txtUsuario" class="form-control" placeholder="Ingrese su usuario" required autofocus>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fw-bold">Contraseña</label>
                                <input type="password" name="txtContra" class="form-control" placeholder="Ingrese su contraseña" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">Entrar al Sistema</button>
                            </div>
                        </form>

                        <%
                            String error = request.getParameter("error");
                            if (error != null)
                            {
                        %>
                            <div class="alert alert-danger mt-3 text-center" role="alert">
                                Usuario o contraseña incorrectos.
                            </div>
                        <%  } %>
                        
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
