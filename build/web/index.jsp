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

        <div class="jumbito">
            <img src="images/logo.PNG" class="centro" alt="Buscador Car-Wash">
        </div>
        
        <script src="geolocation/location.js" type="text/javascript"></script>
        <script async dfeer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA1UInbb8xXBD-7e-1lXM3bO_QoMn-VhM&callback=findLocation">
        </script>
        
        
        <div class="container">
            
            <div class="row">
                <div class="col-sm-6">
                    <img src="images/carwash1.png" class="img-fluid" alt="Responsive image">
                </div>
                <div class="col-sm-6 login">
                    <form action="Controller" method="post">

                        <input type="hidden" name="method" value="sign_in">
                        <input type="hidden" name="latitud" id="latitud" value="">
                        <input type="hidden" name="longitud" id="longitud" value="">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Usuario</label>
                            <input type="text" class="form-control" placeholder="Ingrese su usuario" name="name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Contraseña</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Ingrese su contraseña" name="password">
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar</button>  
                        <a href="register.jsp" class="btn btn-secondary">Registrar</a>
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