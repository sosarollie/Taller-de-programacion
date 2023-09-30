/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class Ej1tp4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Circulo unCirculo;
        double unRadio = GeneradorAleatorio.generarDouble(10);
        System.out.println("Ingrese el color de linea del circulo");
        String unCL = Lector.leerString();
        System.out.println("Ingrese el color de relleno del circulo");
        String unCR = Lector.leerString();
        unCirculo = new Circulo(unRadio,unCR,unCL);
        System.out.println(unCirculo.toString());
        Triangulo unTriangulo;
        double lado1 = GeneradorAleatorio.generarDouble(10);
        double lado2 = GeneradorAleatorio.generarDouble(10);
        double lado3 = GeneradorAleatorio.generarDouble(10);
        System.out.println("Ingrese el color de linea del triangulo");
        unCL = Lector.leerString();
        System.out.println("Ingrese el color de relleno del triangulo");
        unCR = Lector.leerString();
        unTriangulo = new Triangulo(lado1,lado2,lado3,unCR,unCL);
        System.out.println(unTriangulo.toString());        
        
        unTriangulo.despintar();
        System.out.println(unTriangulo.toString());
    }
    
}
