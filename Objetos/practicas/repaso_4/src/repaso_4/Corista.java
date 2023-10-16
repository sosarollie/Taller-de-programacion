/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_4;

/**
 *
 * @author praise
 */
public class Corista extends Integrante {
    private int tonoFundamental;

    public Corista(int tonoFundamental, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        return super.toString() + " " + "Corista{" + "tonoFundamental=" + tonoFundamental + '}';
    }
    
  
}
