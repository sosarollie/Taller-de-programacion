/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author praise
 */
public class Habitacion {
    private double costo;
    private boolean ocupada = false;
    private Cliente clienteReservado = null;

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return clienteReservado != null;
    }
    
    public String informarOcupada(){
        if (this.isOcupada()){
            return "Habitacion ocupada";
        } else return "Habitacon desocupada";
            
    }

    public Cliente getClienteReservado() {
        return clienteReservado;
    }

    public void ocuparHabitacion(Cliente clienteReservado) {
        this.clienteReservado = clienteReservado;
        
    }
    
    
}
