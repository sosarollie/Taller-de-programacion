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
public class Director extends Integrante {
    private int antiguedad;

    public Director(int antiguedad, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return super.toString() + " " + "Director{" + "antiguedad=" + antiguedad + '}';
    }
    
}
