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
public class Ej2tp4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugadores unJugador;
        Entrenadores unEntrenador;
        
        // Instanciacion de jugador
        System.out.println("Ingrese el nombre del jugador");
        String unNombre = Lector.leerString();
        System.out.println("Ingrese su sueldo basico");
        double unSueldoBasico = Lector.leerDouble();
        System.out.println("Ingrese su antiguedad en años");
        int unaAntiguedad = Lector.leerInt();
        System.out.println("Ingrese su numero de partidos");
        int unNumeroGoles = Lector.leerInt();
        System.out.println("Ingrese su numero de goles");
        int unNumeroPartidos = Lector.leerInt();
        unJugador = new Jugadores(unNombre,unSueldoBasico,unaAntiguedad,unNumeroGoles,unNumeroPartidos);
        System.out.println(unJugador.toString());
        
        //Instanciacion de entrenador
        System.out.println("Ingrese el nombre del entrenador");
        unNombre = Lector.leerString();
        System.out.println("Ingrese su sueldo basico");
        unSueldoBasico = Lector.leerDouble();
        System.out.println("Ingrese su antiguedad en años");
        unaAntiguedad = Lector.leerInt();
        System.out.println("Ingrese su cantidad de campeonatos");
        int unaCantCampeonatos = Lector.leerInt();      
        unEntrenador = new Entrenadores(unNombre,unSueldoBasico,unaAntiguedad,unaCantCampeonatos);
        System.out.println(unEntrenador.toString());
        
    }
    
}
