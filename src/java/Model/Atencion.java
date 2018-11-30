/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author aidm
 */
public class Atencion {
    int codatencion;
    int codusuario;
    int codlocal;
    String placa;
    String servicios;
    String estado;
    double monto;
    String fecha;
    String hora;

    public int getCodatencion() {
        return codatencion;
    }

    public void setCodatencion(int codatencion) {
        this.codatencion = codatencion;
    }

    public int getCodusuario() {
        return codusuario;
    }

    public void setCodusuario(int codusuario) {
        this.codusuario = codusuario;
    }

    public int getCodlocal() {
        return codlocal;
    }

    public void setCodlocal(int codlocal) {
        this.codlocal = codlocal;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getServicios() {
        return servicios;
    }

    public void setServicios(String servicios) {
        this.servicios = servicios;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getPuntos() {
        
        return (int)(monto*10);
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    
}
