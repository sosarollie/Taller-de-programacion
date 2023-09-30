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
public class EJ3tp4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Persona unaPersona;
        Trabajador unTrabajador;
        
        //Instanciar persona
        System.out.println("Ingrese el nombre de la persona");
        String unNombre = Lector.leerString();
        System.out.println("Ingrese su DNI");
        int unDNI = Lector.leerInt();
        System.out.println("Ingrese su edad");
        int unaEdad = Lector.leerInt();
        unaPersona = new Persona(unNombre,unDNI,unaEdad);
        
        //Instanciar trabajador
        System.out.println("Ingrese el nombre del trabajador");
        unNombre = Lector.leerString();
        System.out.println("Ingrese su DNI");
        unDNI = Lector.leerInt();
        System.out.println("Ingrese su edad");
        unaEdad = Lector.leerInt();
        System.out.println("Ingrese su profesion");
        String unaProfesion = Lector.leerString();
        unTrabajador = new Trabajador(unNombre,unDNI,unaEdad,unaProfesion);
    
        System.out.println(unaPersona.toString());
        System.out.println(unTrabajador.toString());
    }
    
    
}
