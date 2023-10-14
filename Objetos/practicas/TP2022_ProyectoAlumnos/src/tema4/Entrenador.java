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
public class Entrenador extends Empleado {
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        return this.campeonatosGanados/this.getAntiguedad();
    }
    
    public double calcularSueldoACobrar(){
        double sueldo = super.calcularSueldoACobrar();
        if (this.campeonatosGanados > 0 && this.campeonatosGanados < 5){
            sueldo += 5000;
        } else if (this.campeonatosGanados > 4 && this.campeonatosGanados < 11){
            sueldo += 30000;
        } else if (this.campeonatosGanados > 10){
            sueldo += 50000;
        }
        return sueldo;
    }
    
    
}
