/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.DataBase;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Andres Diaz
 */
@WebServlet(name = "Controller", urlPatterns = {"/Controller"})

public class Controller extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        if (method.equals("sign_up")) {
            sign_up(request, response);
        } 
        else if (method.equals("sign_in")) {
            sign_in(request, response);
        } 
        else if (method.equals("atencion_registrar")) {
            atencion_registrar(request, response);
        }
        else if (method.equals("atencion_modificar")) {
            atencion_modificar(request, response);
        } 
        else if (method.equals("otro")) {
            otro(request, response);
        }
    }

    protected void sign_up(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        String telefono = request.getParameter("telefono");
//        String direccion = request.getParameter("direccion");
//        int edad = Integer.parseInt(request.getParameter("edad"));
//        String sexo1 = request.getParameter("sexo1");
//        String sexo2 = request.getParameter("sexo2");
//        String sexo = "Hombre";
//        if (sexo2.equals("mujer")) {
//            sexo = "Mujer";
//        }

        DataBase db = new DataBase();

        // Falta terminar
        request.getRequestDispatcher("/new-car.jsp").forward(request, response);
    }

    protected void sign_in(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        DataBase db = new DataBase();
        HttpSession session = request.getSession();
        

        if (db.confirmar_Usuario(name, password)) {
            Usuario user = db.buscar_Usuario("nomusu", name);
            Auto auto = db.buscar_Auto(user.getCodusu());

            request.setAttribute("user", user);
            session.setAttribute("user", user);
            String specifications = "";

            if (user.getNomusu().contains("colaborador")) {
                CarWash empresa = new CarWash();
                ArrayList<CarWash> locales = db.listar_CarWash();
                for (CarWash local : locales) if (local.getCodusu() == user.getCodusu())empresa = local;
                request.setAttribute("carwash", empresa);
                request.setAttribute("atenciones", db.listar_Atencion());
                session.setAttribute("carwash", empresa);
                request.getRequestDispatcher("/atencion.jsp").forward(request, response);
            }

            if (auto!=null) {
                specifications = auto.getMarca() + " " + auto.getModelo();
            }

            request.setAttribute("specifications", specifications);
            request.getRequestDispatcher("/main.jsp").forward(request, response);

        } else {
            String respuesta = "Usuario o contraseña incorrectos. ";
            request.setAttribute("response", respuesta);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }
    
    protected void atencion_registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        DataBase db = new DataBase();
        
        String nomusu = request.getParameter("nomusu");
        String servicios = request.getParameter("servicios");
        double monto = Double.parseDouble(request.getParameter("monto"));
        String codusu_colaborador = request.getParameter("colaborador");
        int codlocal = Integer.parseInt(request.getParameter("carwash"));
        
        Usuario colaborador = db.buscar_Usuario("codusu", codusu_colaborador);
        CarWash local = db.buscar_CarWash(codlocal);
        
        
        Atencion atencion = new Atencion();
        Usuario cliente = db.buscar_Usuario("nomusu",nomusu);
        int codusu_cliente = cliente.getCodusu();
        String placa = db.buscar_Auto(codusu_cliente).getPlaca();
        
        atencion.setCodatencion(db.siguiente_Atencion()); // Falta codigo atencion
        atencion.setCodlocal(local.getCodlocal()); // Falta local
        atencion.setCodusuario(codusu_cliente);
        atencion.setEstado("Atendiendo");
        atencion.setFecha(FechaActual());
        atencion.setHora(HoraActual());
        atencion.setMonto(monto);
        atencion.setPlaca(placa);
        atencion.setServicios(servicios);
        db.crear_Atencion(atencion);
        

        request.setAttribute("carwash", local);
        request.setAttribute("user", colaborador);
        request.setAttribute("atenciones", db.listar_Atencion());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/atencion.jsp");
        rd.forward(request, response);
    }
    
    protected void atencion_modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        DataBase db = new DataBase();
        
        String codatencion = request.getParameter("codatencion");
        String estado = request.getParameter("estado");
        
        // Falta completar
        
        HttpSession session = request.getSession();
        CarWash local = (CarWash)session.getAttribute("carwash");
        Usuario colaborador = (Usuario)session.getAttribute("user");
        
        request.setAttribute("carwash", local);
        request.setAttribute("user", colaborador);
        request.setAttribute("atenciones", db.listar_Atencion());
        
        request.getRequestDispatcher("/atencion.jsp").forward(request, response);
        
    }

    protected void otro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    
    String FechaActual(){
        DateFormat formato_f = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        String fecha = formato_f.format(date);
        return fecha;
    }
    
    String HoraActual(){
        DateFormat formato_h = new SimpleDateFormat("HH:mm");
        Date date = new Date();
        String hora = formato_h.format(date);
        return hora;
    }
}
