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
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

    public Empleado(String nombre, double sueldoBasico, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        double bonoAntiguedad = 0;
        int i;
        for (i = 0; i < this.antiguedad; i++){
            bonoAntiguedad += 0.10;
        }
        return this.sueldoBasico + this.sueldoBasico * bonoAntiguedad;
    }

    @Override
    public String toString() {
        return "Empleado: " + nombre + " su efectividad es " + this.calcularEfectividad() + " Su sueldo a cobrar es " + this.calcularSueldoACobrar();
    }
    
    
}
