/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author praise
 */
public class EJ4pt2 {

    /**
     * @param args the command line arguments
     * Taller de Programación 2022 – Módulo POO
4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
     */
    public static void main(String[] args) {
      Persona [][] matriz = new Persona [5][8];
      Persona unaPersona = new Persona();
      int dimL = 0,posFila = 0,posColumna = 0;
      unaPersona.setEdad(GeneradorAleatorio.generarInt(99));
      unaPersona.setDNI(GeneradorAleatorio.generarInt(4000));
      System.out.println("Ingrese el nombre del entrevistado numero " + (dimL + 1));
      unaPersona.setNombre(Lector.leerString());
      while (!unaPersona.getNombre().equals("ZZZ") && (dimL < 40)){
          while ((posColumna < 7) && (!unaPersona.getNombre().equals("ZZZ"))){
            matriz[posFila][posColumna] = unaPersona;
            dimL++;
            posColumna++;
            unaPersona = new Persona();
            unaPersona.setEdad(GeneradorAleatorio.generarInt(99));
            unaPersona.setDNI(GeneradorAleatorio.generarInt(4000));
            System.out.println("Ingrese el nombre del entrevistado numero " + (dimL + 1));
            unaPersona.setNombre(Lector.leerString());
    
          if (posColumna == 7){
              matriz[posFila][posColumna] = unaPersona;
              posColumna = 0;
              posFila++;
              dimL++;
              unaPersona = new Persona();
              unaPersona.setEdad(GeneradorAleatorio.generarInt(99));
              unaPersona.setDNI(GeneradorAleatorio.generarInt(4000));
              System.out.println("Ingrese el nombre del entrevistado numero " + (dimL + 1));
              unaPersona.setNombre(Lector.leerString());
          }    
    }
      int i, iMax;
      for (i = 0; i < dimL; i++){
          posFila = i / 8;
          posColumna = i % 8;
          System.out.println("Turno " + (posColumna + 1) + " dia " + (posFila + 1) + ": " + matriz[posFila][posColumna]);
      }
               
          
          
          
      }
    
}
}
