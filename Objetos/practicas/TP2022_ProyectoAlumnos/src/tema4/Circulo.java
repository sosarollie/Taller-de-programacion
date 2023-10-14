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
public class Circulo extends Figura{
    private double radio;
    
    public Circulo (double radio,String unCl,String unCr){
        super (unCl,unCr);
        this.radio=radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    public double calcularPerimetro (){
        return radio * 2 * Math.PI;
    }
    public double calcularArea (){
      return radio * radio * Math.PI;
    }
    public String toString (){
        String aux = super.toString();
        return aux + radio;
    }
}
