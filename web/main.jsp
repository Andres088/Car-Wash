<%@page import="Model.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    
    <body>

        <% Usuario user = (Usuario)request.getAttribute("user");
           String specifications = (String)request.getAttribute("specifications");
        %>  

        <div class="jumbotron text-center jumbito">
            <h1>Car Wash Location</h1>
        </div>
        <div class="container">
            <div class="row filita">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"> 
                    <h3>Car Wash Top</h3>
                </div>   
                <div class="col-sm-4"></div>   
            </div>
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-2">
                    <div class="btn-group-vertical">
                        <button type="button" class="btn btn-secondary">Carwash Top</button>
                        <button type="button" class="btn btn-secondary">Lavaderos Top</button>
                        <button type="button" class="btn btn-secondary">Registro</button>
                    </div>
                </div>
                <div class="col-sm-4">
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
                <div class="col-sm-1">
                    <div class="card" style="width: 10rem;">
                        <img class="card-img-top" src="images/user-icon.png" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%=user.getNom()%></h5>
                            <p class="card-text"><%=specifications%></p>
                            <a href="#" class="btn btn-secondary">Cambiar carro</a>
                        </div>
                    </div> 
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-2"></div>
            </div>
        </div>
        <footer id="pie" class="footer text-center">
            <p>Desarrollado por Grupo 5.</p>
        </footer>
    </body>
</html>
