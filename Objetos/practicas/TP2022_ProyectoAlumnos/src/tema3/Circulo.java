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
    private String colorRelleno;
    private String colorLinea;
    
    

    public Circulo (double radio, String colorRelleno, String colorLinea){
        this.radio=radio;
        this.colorRelleno=colorRelleno;
        this.colorLinea=colorLinea;
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro (){
      return this.radio * 2 * Math.PI;
}
    public double calcularArea (){
        return this.radio * this.radio * Math.PI;
    }
}