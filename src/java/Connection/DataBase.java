/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alumno
 */
public class DataBase {

    public ArrayList<CarWash> listar_CarWash() {
        ArrayList<CarWash> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            ResultSet rs;
            String sql = "select * from tbcarwash";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            CarWash obj;
            while (rs.next()) {
                obj = new CarWash();
                obj.setCodlocal(rs.getInt("codlocal"));
                obj.setCodusu(rs.getInt("codusu"));
                obj.setDireccion(rs.getString("direccion"));
                obj.setDisponiblidad(rs.getString("disponibilidad"));
                obj.setDistrito(rs.getString("distrito"));
                obj.setHorario(rs.getString("horario"));
                obj.setImagen(rs.getString("imagen"));
                obj.setLatitud(rs.getString("latitud"));
                obj.setLongitud(rs.getString("longitud"));
                obj.setNombre(rs.getString("nombre"));
                obj.setServicios(rs.getString("servicios"));
                obj.setTelefono(rs.getString("telefono"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
            CarWash obj = new CarWash();
            obj.setNombre(ex.getMessage());
            data.add(obj);
        }
        return data;
    }

    public ArrayList<Auto> listar_Auto() {
        ArrayList<Auto> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            ResultSet rs;
            String sql = "select * from tbauto";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            Auto obj;
            while (rs.next()) {
                obj = new Auto();
                obj.setPlaca(rs.getString("placa"));
                obj.setMarca(rs.getString("marca"));
                obj.setModelo(rs.getString("modelo"));
                obj.setAno(rs.getInt("ano"));
                obj.setCodusu(rs.getInt("codusu"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<Atencion> listar_Atencion() {
        ArrayList<Atencion> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            ResultSet rs;
            String sql = "select * from tbatencion";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            Atencion obj;
            while (rs.next()) {
                obj = new Atencion();
                obj.setCodatencion(rs.getInt("codatencion"));
                obj.setCodlocal(rs.getInt("codlocal"));
                obj.setCodusuario(rs.getInt("codusu"));
                obj.setEstado(rs.getString("estado"));
                obj.setFecha(rs.getString("fecha"));
                obj.setHora(rs.getString("hora"));
                obj.setMonto(rs.getDouble("monto"));
                obj.setPlaca(rs.getString("placa"));
                obj.setServicios(rs.getString("servicios")); 
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public ArrayList<Usuario> listar_Usuario() {
        ArrayList<Usuario> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            ResultSet rs;
            String sql = "select * from tbusuario";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            Usuario obj;
            while (rs.next()) {
                obj = new Usuario();
                obj.setCodusu(rs.getInt("codusu"));
                obj.setCorreo(rs.getString("correo"));
                obj.setDirec(rs.getString("direccion"));
                obj.setDni(rs.getString("dni"));
                obj.setEdad(rs.getInt("edad"));
                obj.setNom(rs.getString("nom"));
                obj.setNomusu(rs.getString("nomusu"));
                obj.setSexo(rs.getString("sexo"));
                obj.setTelf(rs.getString("telf"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
        
    public boolean confirmar_Usuario(String nomusu, String pass) {
        ResultSet rs = null;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            String sql = "select * from tbusuario where nomusu=? and pass=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, nomusu);
            pstm.setString(2, pass);
            rs = pstm.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Usuario buscar_Usuario(String campo, String valor) {

        String busqueda = "";
        if (campo.equals("codusu")) {
            busqueda = "codusu";
        }
        if (campo.equals("nomusu")) {
            busqueda = "nomusu";
        }

        ArrayList<Usuario> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            ResultSet rs;
            String sql = "select * from tbusuario where " + busqueda + "=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, valor);
            rs = pstm.executeQuery();
            Usuario obj;
            while (rs.next()) {
                obj = new Usuario();
                obj.setCodusu(rs.getInt("codusu"));
                obj.setNomusu(rs.getString("nomusu"));
                obj.setNom(rs.getString("nom"));
                obj.setCorreo(rs.getString("correo"));
                obj.setTelf(rs.getString("telf"));
                obj.setDirec(rs.getString("direc"));
                obj.setEdad(rs.getInt("edad"));
                obj.setSexo(rs.getString("sexo"));
                data.add(obj);
            }
            for (Usuario user : data) {
                if (user.getNomusu().equals(valor)) {
                    return user;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public CarWash buscar_CarWash(int codlocal) {

        ArrayList<CarWash> locales = listar_CarWash();

        for (CarWash local : locales) {
            if (local.getCodlocal() == codlocal) {
                return local;
            }
        }
        return null;
    }
    
    public Auto buscar_Auto(int codusu){
        ArrayList<Auto> autos = listar_Auto();
        for (Auto auto : autos) {
            if (auto.getCodusu()== codusu) {
                return auto;
            }
        }
        return null;
    }

    public void crear_Atencion(Atencion obj) {
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            String sql = "insert into tbatencion values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, obj.getCodatencion());
            pstm.setInt(2, obj.getCodusuario());
            pstm.setInt(3, obj.getCodlocal());
            pstm.setString(4, obj.getPlaca());
            pstm.setString(5, obj.getServicios());
            pstm.setString(6, obj.getEstado());
            pstm.setDouble(7, obj.getMonto());
            pstm.setInt(8, obj.getPuntos());
            pstm.setString(9, obj.getFecha());
            pstm.setString(10, obj.getHora());
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crear_Usuario(Usuario obj) {
        int salida = -1;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            String sql = "insert into tbusuario values(?, ?, ?, ?, ?, ?, ?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getDni());
            pstm.setString(2, obj.getNom());
            pstm.setString(3, obj.getCorreo());
            pstm.setString(4, obj.getTelf());
            pstm.setString(5, obj.getDirec());
            pstm.setInt(6, obj.getEdad());
            pstm.setString(7, obj.getSexo());
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crear_Auto(Auto obj) {
        int salida = -1;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            String sql = "insert into tbauto values(?, ?, ?, ?, ?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getPlaca());
            pstm.setString(2, obj.getMarca());
            pstm.setString(3, obj.getModelo());
            pstm.setInt(4, obj.getAno());
            pstm.setString(5, obj.getPlaca());
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int siguiente_Atencion(){
        ArrayList<Atencion> lista = listar_Atencion();
        int numero = lista.size();
        if (numero == 0) return 1;
        int siguiente_codigo = lista.get(numero-1).getCodatencion()+1;
        return siguiente_codigo;
    }
    
    public int siguiente_Usuario(){
        ArrayList<Usuario> lista = listar_Usuario();
        int numero = lista.size();
        int siguiente_codigo = lista.get(numero-1).getCodusu()+1;
        return siguiente_codigo;
    }
}
