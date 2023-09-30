/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import tema3.*;

/**
 *
 * @author praise
 */
public class Circulo extends Figura{
   private double radio;

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public Circulo (double radio, String unCR, String unCL){
        super(unCR,unCL);        
        this.radio = radio;
    }
    @Override
    public double calcularPerimetro(){
        return 2 * Math.PI * this.radio;
    }
    @Override
    public double calcularArea(){
        return Math.PI * this.radio * this.radio;
    }
    @Override
    public String toString(){
        String aux;
        return aux = super.toString() + "El radio del circulo es: " + this.radio;
        
        
    }
}
