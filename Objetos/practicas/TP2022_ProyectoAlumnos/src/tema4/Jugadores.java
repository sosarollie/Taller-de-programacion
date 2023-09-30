/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author praise
 */
public class Jugadores extends Empleados{
    private int numPartidos;
    private int numGoles;

    public int getNumPartidos() {
        return numPartidos;
    }

    public void setNumPartidos(int numPartidos) {
        this.numPartidos = numPartidos;
    }

    public int getNumGoles() {
        return numGoles;
    }

    public void setNumGoles(int numGoles) {
        this.numGoles = numGoles;
    }
    
    public Jugadores(String nombre, double sueldoBasico, int antiguedad, int numPartidos, int numGoles){
        super(nombre,sueldoBasico,antiguedad);
        this.numPartidos = numPartidos;
        this.numGoles = numGoles;
            
    }

    public double calcularEfectividad(){
        return (double)this.getNumGoles() / this.getNumPartidos();
    }
    
    public double calcularSueldoACobrar(){
        double aux = 0;
        if (this.calcularEfectividad() < 0.5)
            aux = this.getSueldoBasico() * 2;
        return super.calcularSueldoACobrar() + aux;
    }
}
