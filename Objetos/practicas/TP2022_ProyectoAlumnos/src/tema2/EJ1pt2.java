/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author praise
 */
public class EJ1pt2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    Persona unaPersona = new Persona();
    unaPersona.setDNI(Lector.leerInt());
    unaPersona.setNombre(Lector.leerString());
    System.out.println(unaPersona);
    
    
    
    }
    
}
