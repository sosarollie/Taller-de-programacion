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
import PaqueteLectura.Lector;
public class ej5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double radio;
        String colorRelleno,colorLinea;
        
        radio=Lector.leerDouble();
        colorRelleno=Lector.leerString();
        colorLinea = Lector.leerString();
        Circulo unCirculo = new Circulo (radio,colorRelleno,colorLinea);
        System.out.println(unCirculo.calcularPerimetro());
        System.out.println(unCirculo.calcularArea());
        
    }
    
}
