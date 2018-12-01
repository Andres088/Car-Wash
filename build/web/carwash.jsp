<%@page import="Model.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>

    <body>
        
        <% 
            String[] mi_posicion = (String[])request.getAttribute("posicion");
            CarWash local = (CarWash)request.getAttribute("local");
            
            String yo_lat = mi_posicion[0];
            String yo_long = mi_posicion[1];
            String local_lat = local.getLatitud();
            String local_long = local.getLongitud();
            
        %>

        <div class="jumbito">
            <img src="images/logo.PNG" class="centro" alt="Buscador Car-Wash">
        </div>
        <div class="container">
            <div class="row filita"> 
                <div class="col-sm-5"></div>
                <div class="col-sm-3 font-italic"><h4 id="cambio">Detalle del local</h4></div>
                <div class="col-sm-4"></div>
            </div>
        
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-4">
                <div class="list-group">
                    <a class="list-group-item list-group-item-action flex-column align-items-start">
                        <img src="images/carwash_mini1.PNG" class="img-fluid" alt="Responsive image">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Lavadero Angamos</h5>
                            <small>Score: 4.8/5</small>
                        </div>
                        <p class="mb-1">Servicios ofrecidos: aspirado, planchado, lavado.</p>
                        <p class="mb-1">Ubicación: Angamos Este 1245 Surquillo</p>
                        <p class="mb-1">Lunes a Viernes de 10:00 am a 6:00 pm</p>
                        <p class="mb-1">Teléfono: 948184046</p>
                    </a>
                </div>
            </div>
            <div class="col-sm-6">
                <div id="map" class="mapita"></div>
            </div>
            <div class="col-sm-1"></div>
        </div>
            
        <div class="row">-</div>
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-4">
                <h4>Califica este local</h4>
                <form action="Controller" method="post">
                    <input type="hidden" name="method" value="">
                    <div class="form-group">
                        <label for="customRange2">Puntuacion (malo - bueno) </label>
                        <input type="range" class="custom-range" min="0" max="5" id="customRange2" name="score">
                    </div>
                    <div class="form-group">
                        <label for="comentario">Comentario</label>
                        <input type="text" class="form-control" placeholder="" id="comentario" name="comentario">
                    </div>
                    <button type="submit" class="btn btn-primary">Calificar</button>  
                </form>  
            </div>
            <div class="col-sm-6">
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
                            <td>Excelente atencion, lo hicieron en tiempo record.</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>tanta</td>
                            <td>11/12/1212</td>
                            <td>Trabajan bien pero me parece que sus precios son elevados.</td>
                            <td>3</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-1"></div>
        </div>
    </div>
    <div class="footer">
        <p>Copyright (c) 2008</p>
    </div>
        
    
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA1UInbb8xXBD-7e-1lXM3bO_QoMn-VhM&callback=muestraRuta">
    </script>  
    <script>
        function muestraRuta() {

            var directionsDisplay = new google.maps.DirectionsRenderer;
            var directionsService = new google.maps.DirectionsService;

            var map = new google.maps.Map(document.getElementById('map'), {zoom: 15, center: {lat: -12.080797, lng: -77.028648}});

            directionsDisplay.setMap(map);
            calculateAndDisplayRoute(directionsService, directionsDisplay);
            document.getElementById('mode').addEventListener('change', function() {
              calculateAndDisplayRoute(directionsService, directionsDisplay);
            });
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            var ori_la = <%=yo_lat%>;
            var ori_lo = <%=yo_long%>;
            var des_la = <%=local_lat%>;
            var des_lo = <%=local_long%>;
            var selectedMode = 'DRIVING';

            directionsService.route({
                origin: {lat: ori_la, lng: ori_lo},  
                destination: {lat: des_la, lng: des_lo},  
                travelMode: google.maps.TravelMode[selectedMode]}, 
                function(response, status) {
                if (status == 'OK') {directionsDisplay.setDirections(response);
                }else {window.alert('Directions request failed due to ' + status);}});}
    </script>
</body>
</html>
