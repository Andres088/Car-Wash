/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Connection.DataBase;
import Model.Auto;
import Model.Usuario;
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

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})

public class UserController extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String method = request.getParameter("method");

            if(method.equals("sign_up")) sign_up(request, response);
            else if(method.equals("sign_in")) sign_in(request, response);
    }

    protected void sign_up(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name  = request.getParameter("name");
        String email  = request.getParameter("email");
        String telefono  = request.getParameter("telefono");
        String direccion  = request.getParameter("direccion");
        int edad  = Integer.parseInt(request.getParameter("edad"));
        String sexo1 = request.getParameter("sexo1");
        String sexo2 = request.getParameter("sexo2");
        String sexo = "Hombre";
        if (sexo2.equals("mujer")) sexo = "Mujer";
        
        DataBase db = new DataBase();
        
        // Falta terminar

        request.getRequestDispatcher("/new-account.jsp").forward(request, response);	
    }
    
    protected void sign_in(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name  = request.getParameter("name");
        String password = request.getParameter("password");

        DataBase db = new DataBase();
        
        if (db.autenticacion(name, password)){
            Usuario user = db.buscaUsuario(name);
            ArrayList<Auto> cars = db.listaAuto(user.getCodusu());
            
            String specifications = "";
            
            if (cars.size()>0){
                Auto car = cars.get(0);
                specifications = "Te encuentras manejando un: "+car.getMarca()+ " "+car.getModelo();
            }
            
            request.setAttribute("user",user);
            request.setAttribute("specifications",specifications);
            request.getRequestDispatcher("/main.jsp").forward(request, response);
        }
        else{
            String respuesta = "Usuario o contraseña incorrectos. ";
            request.setAttribute("response",respuesta);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        
    }
    
}
