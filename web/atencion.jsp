<%@page import="Model.Usuario"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <title>CarWash</title>
    </head>

    <body>
        <%
            Usuario user = (Usuario) request.getAttribute("user");
            String empresa = (String) request.getAttribute("specifications");
        %>

        <div class="jumbotron text-center jumbito">
            <h1>Car Wash Location</h1>
        </div>

        <div class="container">
            <div class="row filita"> 
                <div class="col-xl-1"></div>

                <div class="col-xl-3 big-icon float-left">
                    <a href="index.jsp"><i class="fas fa-reply"></i></a>
                </div>
                <div class="col-xl-4">
                    <h3>Módulo de atenciones</h3>
                </div>
                <div class="col-xl-3">

                </div>

                <div class="col-xl-1"></div>
            </div>

            <div class="row">

                <div class="col-xl-1"></div>

                <div class="col-xl-4">
                    <h4>Registrar atencion</h4>
                    <form action="Controller" method="post">
                        <input type="hidden" name="method" value="sign_in">	
                        <div class="form-group">
                            <label>Codigo de Cliente</label>
                            <input type="text" class="form-control" placeholder="" name="name">
                        </div>
                        <div class="form-group">
                            <label>Servicios</label>
                            <input type="text" class="form-control" placeholder="" name="name">
                        </div>
                        <div class="form-group">
                            <label>Monto</label>
                            <input type="text" class="form-control" placeholder="" name="name">
                        </div>
                        <button type="submit" class="btn btn-primary">Registrar</button>  
                    </form>        
                </div>

                <div class="col-xl-3 d-flex align-items-stretch">
                    <div class="card">
                        <img class="card-img-top " src="images/carwash_mini3.jpg" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%=empresa%></h5>
                            <p class="card-text">Información del CarWash</p>
                        </div>
                    </div> 
                </div>

                <div class="col-xl-3">
                    <div class="card">
                        <img class="card-img-top " src="images/user-icon.png" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><%=user.getNom()%></h5>
                            <p class="card-text" style="text-align: center">Colaborador del local</p>
                        </div>
                    </div> 
                </div>

                <div class="col-xl-1"></div>
            </div>

            <div class="row">-</div>

            <div class="row">
                <div class="col-xl-1"></div>
                <div class="col-xl-10">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Placa</th>
                                <th scope="col">Servicio</th>
                                <th scope="col">Monto</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Modificar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>
                                    <a href="#"><i class="far fa-calendar-minus"></i></a>
                                    <a href="#"><i class="far fa-calendar-times"></i></a>
                                    <a href="#"><i class="fas fa-check"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                            </tr>
                            <tr>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                                <td>En proceso</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-xl-1"></div>
            </div>
        </div>
        <div class="footer">
            <p>Copyright (c) 2008</p>
        </div>

    </body>
</html>
