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
public class Circulo {
   private double radio;
   private String CR;
   private String CL;

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getCR() {
        return CR;
    }

    public void setCR(String CR) {
        this.CR = CR;
    }

    public String getCL() {
        return CL;
    }

    public void setCL(String CL) {
        this.CL = CL;
    }
    
    public Circulo (double radio, String colorRelleno, String colorLinea){
        this.radio = radio;
        this.CR = colorRelleno;
        this.CL = colorLinea;
    }
    
    public double calcularPerimetro(){
        return 2 * Math.PI * this.radio;
    }
    
    public double calcularArea(){
        return Math.PI * this.radio * this.radio;
    }
}
