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
                <div class="col-sm-4"></div>

                <div class="col-sm-4">
                    <h3>Registra tu carro :)</h3><br>
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
                        <button type="submit" class="btn btn-primary">Registrarse</button>
                        <a href="principal.jsp">Registrarse</a>
                    </form>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <div class="push"></div>
        </div>
        <div class="footer">
            <p>Copyright (c) 2008</p>
        </div>
    </body>
</html>