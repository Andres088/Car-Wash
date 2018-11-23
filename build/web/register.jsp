<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
    <div class="jumbotron text-center jumbito">
            <h1>Car Wash Location</h1>
    </div>
        <div class="container">
            <div class="row">
                
                <div class="col-sm-6">
                    
                    <form action="UserController" method="post">
                        
                        <input type="hidden" name="method" value="sign_up">
                        
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nombres y Apellidos" name="name">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Correo Electrónico" name="email">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Teléfono" name="telefono">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Direccion" name="direccion">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Edad" name="edad">
                        </div>
                        
                        <div class="form-group">
                            <p>Sexo</p>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" name = "sexo1" onclick = \"getAnswer('hombre') value="mujer">
                                <label class="form-check-label" for="inlineRadio1">Hombre</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" name = "sexo2" onclick = \"getAnswer('mujer') value="mujer">
                                <label class="form-check-label" for="inlineRadio2">Mujer</label>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Continuar</button>
                    </form>
                </div>
                
                <div class="col-sm-6">
                    <img src="images/carwash2.jpg" class="img-fluid" alt="Responsive image">
                    <p>Texto sobre los beneficios de la app (estadísticas, porcentajes, etc.)</p>
                </div>
            </div>
        </div>
        <footer id="pie" class="footer text-center">
            <p>Desarrollado por Grupo 5.</p>
        </footer>
    </body>
</html>