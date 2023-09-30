/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class EJ5PT3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulo unCirculo;
        System.out.println("Ingrese el radio del circulo");
        double unRadio = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno");
        String unCR = Lector.leerString();
        System.out.println("Ingrese el color de linea");
        String unCL = Lector.leerString();
        unCirculo = new Circulo(unRadio,unCR,unCL);
        System.out.println("El perimetro del circulo es: " + unCirculo.calcularPerimetro());
        System.out.println("El area del circulo es: " + unCirculo.calcularArea());       
    }
    
}
