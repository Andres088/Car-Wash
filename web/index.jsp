<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <% String respuesta = String.valueOf(request.getAttribute("response"));
            if (respuesta.equals("null")) {
                respuesta = "";
            }
        %>

        <div class="jumbotron text-center jumbito">
            <h1>Car Wash Location</h1>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img src="images/carwash1.png" class="img-fluid" alt="Responsive image">
                </div>
                <div class="col-sm-6 login">
                    <form action="Controller" method="post">

                        <input type="hidden" name="method" value="sign_in">	

                        <div class="form-group">
                            <label for="exampleInputEmail1">Usuario</label>
                            <input type="text" class="form-control" placeholder="Ingrese su usuario" name="name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Contraseña</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Ingrese su contraseña" name="password">
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar</button>  
                        <a href="/Car_Wash/register.jsp" class="btn btn-secondary">Registrar</a>
                    </form>
                    <h5><%=respuesta%></h5>
                </div>
            </div>
        </div> 

        <div class="footer">
            <p>Copyright (c) 2008</p>
        </div>
    </body>
</html>