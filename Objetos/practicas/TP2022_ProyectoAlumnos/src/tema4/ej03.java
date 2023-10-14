/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class ej03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona unaPersona;
        Trabajador unTrabajador;
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese DNI");
        int dni = Lector.leerInt();
        System.out.println("Ingrese edad");
        int edad = Lector.leerInt();
        unaPersona = new Persona(nombre, dni, edad);
        
        System.out.println("Ingrese nombre");
        nombre = Lector.leerString();
        System.out.println("Ingrese DNI");
        dni = Lector.leerInt();
        System.out.println("Ingrese edad");
        edad = Lector.leerInt();
        System.out.println("Ingrese trabajo");
        String trabajo = Lector.leerString();
        unTrabajador = new Trabajador(trabajo, nombre, dni, edad);
        
        System.out.println(unaPersona.toString());
        System.out.println(unTrabajador.toString());
    }
    
}
