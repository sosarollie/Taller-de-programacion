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
public abstract class Empleados {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

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
    
    public Empleados(String nombre, double sueldoBasico, int antiguedad){
        setNombre(nombre);
        setSueldoBasico(sueldoBasico);
        setAntiguedad(antiguedad);
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        int i;
        double bonus = 0,sueldoTotal;
        for (i=0; i<this.getAntiguedad();i++){
            bonus += this.getSueldoBasico() * 0.10;          
        }
        sueldoTotal = this.getSueldoBasico() + bonus;
        return sueldoTotal;
    }

    @Override
    public String toString() {
        return this.nombre + " Sueldo a cobrar: " + this.calcularSueldoACobrar() + " Efectividad: " + this.calcularEfectividad();
    }
    
    
}
