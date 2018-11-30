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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        } else if (method.equals("sign_in")) {
            sign_in(request, response);
        } else if (method.equals("carwash")) {
            carwash(request, response);
        } else if (method.equals("otro")) {
            otro(request, response);
        }
    }

    protected void sign_up(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo1 = request.getParameter("sexo1");
        String sexo2 = request.getParameter("sexo2");
        String sexo = "Hombre";
        if (sexo2.equals("mujer")) {
            sexo = "Mujer";
        }

        DataBase db = new DataBase();

        // Falta terminar
        request.getRequestDispatcher("/new-account.jsp").forward(request, response);
    }

    protected void sign_in(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        DataBase db = new DataBase();

        if (db.autenticacion(name, password)) {
            Usuario user = db.buscaUsuario(name);
            ArrayList<Auto> cars = db.listaAuto(user.getCodusu());

            request.setAttribute("user", user);
            String specifications = "";

            if (user.getNomusu().contains("colaborador")) {
                ArrayList<CarWash> locales = db.listaCarwash();
                String nombre_local = "";
                for (CarWash local : locales) if (local.getCodusu() == user.getCodusu())nombre_local = String.valueOf(local.getNombre());
                specifications = nombre_local;
                request.setAttribute("specifications", specifications);
                request.getRequestDispatcher("/atencion.jsp").forward(request, response);
            }

            if (cars.size() > 0) {
                Auto car = cars.get(0);
                specifications = car.getMarca() + " " + car.getModelo();
            }

            request.setAttribute("specifications", specifications);
            request.getRequestDispatcher("/main.jsp").forward(request, response);

        } else {
            String respuesta = "Usuario o contraseña incorrectos. ";
            request.setAttribute("response", respuesta);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    protected void carwash(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void otro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
