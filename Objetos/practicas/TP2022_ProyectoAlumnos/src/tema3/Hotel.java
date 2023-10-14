/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author praise
 */
public class Hotel {
    private Habitacion [] habitaciones;
    private int dimF;

    public Hotel(int dimF) {
        this.habitaciones = new Habitacion [dimF];
        this.setDimF(dimF);
        int i;
        GeneradorAleatorio.iniciar();
        for (i = 0; i < dimF; i++){
            Habitacion unaHabitacion = new Habitacion();
            habitaciones[i] = unaHabitacion;
            habitaciones[i].setCosto(GeneradorAleatorio.generarDouble(6000) + 2000);
        }
    }

    public int getDimF() {
        return dimF;
    }
    
    private void setDimF(int dimF) {
        this.dimF = dimF;
    }
    
    public void agregarCliente(Cliente C, int X){
        habitaciones[X].ocuparHabitacion(C);
    }
    
    public void aumentarPrecio (double monto){
        int i;
        for (i = 0; i < dimF; i++){
            habitaciones[i].setCosto(habitaciones[i].getCosto() + monto);
        }
    }

    @Override
    public String toString() {
        int i;
        String aux = "";
        for (i = 0; i < dimF; i++){
            aux += "Habitacion " + (i+1) 
                    + ": Costo "  + habitaciones[i].getCosto() + " " + habitaciones[i].informarOcupada();
            if (habitaciones[i].isOcupada()){
                aux += " " + habitaciones[i].getClienteReservado().toString();
            }
            aux += " ";
        }
        return aux;
    }
    
    
}
