/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author gonetil
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorBorde;
    private String colorRelleno;

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorBorde() {
        return colorBorde;
    }

    public void setColorBorde(String colorBorde) {
        this.colorBorde = colorBorde;
    }

    public Triangulo() {
        this.colorBorde = "transparente";
    }

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorBorde) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorBorde = colorBorde;
    }
    
    //FIXME me conviene usar los getters?
    public double calcularPerimetro() {
        return this.getLado1() + this.getLado2() + this.getLado3();
    }
    
    //FIXME me conviene acceder directamente a las variables de instancia?
    public double calcularArea() {
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt( s * (s -lado1) * (s - lado2) * (s - lado3));
    }
}
