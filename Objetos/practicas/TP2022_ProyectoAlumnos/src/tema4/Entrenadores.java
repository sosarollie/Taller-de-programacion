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
public class Entrenadores extends Empleados {
    private int cantCampeonatos;

    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }

    public Entrenadores(String nombre, double sueldoBasico, int antiguedad,int cantCampeonatos) {
        super(nombre,sueldoBasico,antiguedad);
        this.cantCampeonatos = cantCampeonatos;
    }
    
    public double calcularEfectividad(){
        return (double)this.getCantCampeonatos() / this.getAntiguedad();
    }
    
    public double calcularSueldoACobrar(){
        double aux = 0;
        if ((this.getCantCampeonatos() >= 1) && (this.getCantCampeonatos() <= 4))
            aux = 5000;
            else if ((this.getCantCampeonatos() >= 5) && (this.getCantCampeonatos() <= 10))
                aux = 30000;
                else if (this.getCantCampeonatos() > 10)
                    aux = 50000;
                                    
        return super.calcularSueldoACobrar() + aux;
    }
}
