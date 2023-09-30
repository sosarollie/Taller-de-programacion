/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author praise
 */
/*2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.*/
public class Ej2pt2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    int i = 0; int dimL = 0; 
    GeneradorAleatorio.iniciar();
    Persona [] vector = new Persona[15];
    Persona unaPersona = new Persona();
    unaPersona.setEdad(GeneradorAleatorio.generarInt(99));
    unaPersona.setDNI(GeneradorAleatorio.generarInt(4000));
    unaPersona.setNombre(GeneradorAleatorio.generarString(15));
    while (unaPersona.getEdad() != 0 && i<14) {
        vector[i] = unaPersona;
        i++; 
        dimL++;
        unaPersona = new Persona();
        unaPersona.setEdad(GeneradorAleatorio.generarInt(99));
        unaPersona.setDNI(GeneradorAleatorio.generarInt(4000));
        unaPersona.setNombre(GeneradorAleatorio.generarString(15));
    }
    for (i=0; i<dimL; i++)
        System.out.println(vector[i]);
    
    //INFORMAR CANTIDAD DE PERSONAS > 65
    int cant = 0;
    
    
    for (i=0; i<dimL; i++) 
        if (vector[i].getEdad() > 65) 
            cant++;
    
    System.out.println("Hay " + cant + " personas con edad mayor a 65 anios.");
    
    //IMPRIMIR PERSONA CON MENOR DNI 
    
    int min = 4000; 
    
    for (i=0; i<dimL; i++) 
        if (vector[i].getDNI() < min) { 
            min = vector[i].getDNI(); 
            unaPersona = vector[i]; 
        }    
    
    System.out.println(unaPersona);
    
    
    
    
    
    
    
    }
    
}
