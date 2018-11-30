<%@page import="Model.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>

    <body>

        <script src="geolocation/geolocation.js" type="text/javascript"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA1UInbb8xXBD-7e-1lXM3bO_QoMn-VhM&callback=initMap">
        </script>

        <div class="jumbotron text-center jumbito">
            <h1>Car Wash Location</h1>
        </div>
        <div class="container">
            <div class="row filita"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">

            </div>
            <div class="col-sm-3">
                <div class="list-group">
                    <a class="list-group-item list-group-item-action flex-column align-items-start">
                        <img src="images/carwash_mini1.PNG" class="img-fluid" alt="Responsive image">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Lavadera Angamos</h5>
                            <small>Score: 4.8/5</small>
                        </div>
                        <p class="mb-1">Servicios ofrecidos: aspirado, planchado, lavado.</p>
                        <p>Ubicación: Angamos Este 1245 Surquillo</p>
                        <p>Lunes a Viernes de 10:00 am a 6:00 pm</p>
                        <p>Teléfono: 948184046</p>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div id="map" class="mapita"></div>
            </div>
            <div class="col-sm-2"></div>
        </div>
        <div class="row">-</div>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-7">
                <div class="alert alert-dark" role="alert">
                    Calificaciones
                </div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Usuario</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Comentario</th>
                            <th scope="col">Score</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>aidm</td>
                            <td>14/11/1989</td>
                            <td>Chevere el sitio, las nenas tan lindas</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>tanta</td>
                            <td>11/12/1212</td>
                            <td>Pucha si causa, las nenas tan fuertes</td>
                            <td>5</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-2"></div>
        </div>

    </div>
    <div class="footer">
        <p>Copyright (c) 2008</p>
    </div>
</body>
</html>
