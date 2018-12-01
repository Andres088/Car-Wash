<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="jumbito">
            <img src="images/logo.PNG" class="centro" alt="Buscador Car-Wash">
        </div>
        <div class="container">
            <div class="row">

                <div class="col-sm-6">
                    <h4>Ahora registra tu carro :)</h4><br>
                    <form>         
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Placa">
                        </div>
                        <div class="form-group">
                            <select id="inputMarca" class="form-control">
                                <option selected>Marca</option>
                                <option>Toyota</option>
                                <option>Hyundai</option>
                                <option>Nissan</option>
                                <option>Honda</option>
                                <option>Suzuki</option>
                                <option>Mazda</option>
                                <option>Chevrolet</option>
                                <option>Kia</option>
                                <option>Mitsubishi</option>
                                <option>Volkswagen</option>
                                <option>BMW</option>
                                <option>Audi</option>
                                <option>Mercedes-Benz</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Modelo">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Año">
                        </div>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </form>

                </div>

                <div class="col-sm-6">
                    <img src="images/carwash2.jpg" class="img-fluid" alt="Responsive image">
                    <p>¡Únete ya para que encuentres los mejores CarWash al toque!</p>
                </div>
            </div>
            <div class="push"></div>
        </div>
        <div class="footer">
            <p>Copyright (c) 2008</p>
        </div>
    </body>
</html>