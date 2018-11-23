/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;
import Model.Auto;
import Model.CarWash;
import Model.Lavador;
import Model.Usuario;
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
public class DataBase 
{
    public ArrayList<Lavador> listaLavador()
    {
        ArrayList<Lavador>data=new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            ResultSet rs;
            String sql="select * from tblavador";
            pstm=conn.prepareStatement(sql);
            rs=pstm.executeQuery();
            
            Lavador obj;
            while(rs.next()){
                obj=new Lavador();
                obj.setCodlav(rs.getInt("codlav"));
                obj.setNom(rs.getString("nom"));
                obj.setHora(rs.getString("hora"));
                obj.setPunt(rs.getDouble("punt"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<CarWash>listaCarwash()
    {
        ArrayList<CarWash>data=new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            ResultSet rs;
            String sql="select * from tbcarwash";
            pstm=conn.prepareStatement(sql);
            rs=pstm.executeQuery();
            
            CarWash obj;
            while(rs.next()){
                obj=new CarWash();
                obj.setCodcar(rs.getInt("codcar"));
                obj.setDirec(rs.getString("direc"));
                obj.setHora(rs.getString("hora"));
                obj.setTelf(rs.getString("telf"));
                obj.setPunt(rs.getDouble("punt"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<Auto>listaAuto(int codusu)
    {
        ArrayList<Auto>data=new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            ResultSet rs;
            String sql="select * from tbauto where codusu=?";
            pstm=conn.prepareStatement(sql);
            pstm.setInt(1, codusu);
            rs=pstm.executeQuery();
            
            Auto obj;
            while(rs.next()){
                obj=new Auto();
                obj.setPlaca(rs.getString("placa"));
                obj.setMarca(rs.getString("marca"));
                obj.setModelo(rs.getString("modelo"));
                obj.setDes(rs.getString("des"));
                obj.setDni(rs.getString("dni"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public boolean autenticacion(String nomusu, String pass)
    {   
        ResultSet rs=null;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            String sql="select * from tbusuario where nomusu=? and pass=?";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1, nomusu);
            pstm.setString(2, pass);
            rs=pstm.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Usuario buscaUsuario(String nomusu) {
        ArrayList<Usuario> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = Link.getConnection();
            ResultSet rs;
            String sql = "select * from tbusuario where nomusu=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, nomusu);
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
            for(Usuario user : data){
                if (user.getNomusu().equals(nomusu))return user;
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean confirmarUsuario(String dni)
    {
        try {
            ResultSet rs=null;
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            String sql="select * from tbusuario where dni=?";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1, dni);
            rs=pstm.executeQuery();
            
            if(rs.absolute(1)){
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;      
    }
    
    public int insertarUsuario(Usuario obj)
    {
        int salida=-1;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            String sql="insert into tbusuario values(?, ?, ?, ?, ?, ?, ?)";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1, obj.getDni());
            pstm.setString(2, obj.getNom());
            pstm.setString(3, obj.getCorreo());
            pstm.setString(4, obj.getTelf());
            pstm.setString(5, obj.getDirec());
            pstm.setInt(6, obj.getEdad());
            pstm.setString(7, obj.getSexo());
            salida=pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return salida;
    }
    
    public int agregarAuto(Auto obj)
    {
        int salida=-1;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            String sql="insert into tbauto values(?, ?, ?, ?, ?)";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1, obj.getPlaca());
            pstm.setString(2, obj.getMarca());
            pstm.setString(3, obj.getModelo());
            pstm.setString(4, obj.getDes());
            pstm.setString(5, obj.getDni());
            salida=pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public boolean confirmarAuto(String placa)
    {
        try {
            ResultSet rs=null;
            PreparedStatement pstm;
            Connection conn;
            conn=Link.getConnection();
            String sql="select * from tbauto where placa=?";
            pstm=conn.prepareStatement(sql);
            pstm.setString(1, placa);
            rs=pstm.executeQuery();
            
            if(rs.absolute(1)){
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;      
    }
}

