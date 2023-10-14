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
public class ej02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador unJugador;
        Entrenador unEntrenador;
        
        //instanciar jugador
        System.out.println("Ingrese el nombre del jugador");
        String nombre = Lector.leerString();
        System.out.println("Ingrese su sueldo basico");
        double sueldoBasico = Lector.leerDouble();
        System.out.println("Ingrese su antiguedad");
        int antiguedad = Lector.leerInt();
        System.out.println("Ingrese la cantidad de partidos jugados");
        int partidosJugados = Lector.leerInt();
        System.out.println("Ingrese la cantidad de goles anotados");
        int golesAnotados = Lector.leerInt();
        unJugador = new Jugador(partidosJugados, golesAnotados, nombre, sueldoBasico, antiguedad);
        
        //instanciar entrenador
        System.out.println("Ingrese el nombre del entrenador");
        nombre = Lector.leerString();
        System.out.println("Ingrese su sueldo basico");
        sueldoBasico = Lector.leerDouble();
        System.out.println("Ingrese su antiguedad");
        antiguedad = Lector.leerInt();
        System.out.println("Ingrese la cantidad de campeonatos ganados");
        int campeonatosGanados = Lector.leerInt();
        unEntrenador = new Entrenador(campeonatosGanados, nombre, sueldoBasico, antiguedad);
        System.out.println(unJugador.toString());
        System.out.println(unEntrenador.toString());
    }
    
}
