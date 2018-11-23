<%@page import="Model.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>

    <body>

        <% Usuario user = (Usuario) request.getAttribute("user");
            String specifications = (String) request.getAttribute("specifications");
        %>  

        <script src="geolocation/geolocation.js" type="text/javascript"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA1UInbb8xXBD-7e-1lXM3bO_QoMn-VhM&callback=initMap">
        </script>

        <div class="jumbotron text-center jumbito">
            <h1>Car Wash Location</h1>
        </div>
        <div class="container">
            <div class="row filita"> 
                <div class="col-sm-4">
                    <div class="alert alert-warning encabezado" role="alert">
                        Tu ubicación
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="alert alert-primary encabezado" role="alert">
                        Escoge un local
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="alert alert-success encabezado" role="alert">
                        Tu perfil
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-sm-4">
                    <div id="map" class="mapita"></div>
                    <div class="alert alert-dark" role="alert">
                        Lista de atenciones
                    </div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Fecha</th>
                                <th scope="col">Servicio</th>
                                <th scope="col">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>14/11/1989</td>
                                <td>Lavado</td>
                                <td>En proceso</td>
                            </tr>
                            <tr>
                                <td>14/11/1989</td>
                                <td>Planchado</td>
                                <td>Terminado</td>
                            </tr>
                            <tr>
                                <td>14/11/1989</td>
                                <td>Cocinado</td>
                                <td>Terminado</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-5">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                            <img src="images/carwash_mini1.PNG" class="img-fluid" alt="Responsive image">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Lavadera Angamos</h5>
                                <small>Score: 4.8/5</small>
                            </div>
                            <p class="mb-1">Servicios ofrecidos: aspirado, planchado, lavado.</p>
                            <small>Ubicación: Angamos Este 1245 Surquillo</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <img src="images/carwash_mini2.jpg" class="img-fluid" alt="Responsive image">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Car Wash Inku</h5>
                                <small class="text-muted">Score: 4.0/5</small>
                            </div>
                            <p class="mb-1">Servicios ofrecidos: aspirado, planchado, lavado.</p>
                            <small class="text-muted">Ubicación: Av. Argentina 2035 Cercado</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <img src="images/carwash_mini3.jpg" class="img-fluid" alt="Responsive image">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Lava tu carro SAC.</h5>
                                <small class="text-muted">Score: 3.5/5</small>
                            </div>
                            <p class="mb-1">Servicios ofrecidos: aspirado, planchado, lavado.</p>
                            <small class="text-muted">Av. Brasil 3345 Magdalena</small>
                        </a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <img class="card-img-top " src="images/user-icon.png" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%=user.getNom()%></h5>
                            <p class="card-text"><%=specifications%></p>
                            <p class="card-text">Cliente nuevo</p>
                            <p class="card-text">Visitas acumuladas: 5</p>
                            <p class="card-text">Puntos acumulados: 200</p>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <div class="footer">
            <p>Copyright (c) 2008</p>
        </div>
    </body>
</html>
