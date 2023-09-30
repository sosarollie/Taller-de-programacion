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
public class Ej5pt2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Partido vector[] = new Partido[20];
        Partido unPartido = new Partido();
        int dimL = 0;
        System.out.println("Ingrese equipo local");
        unPartido.setLocal(Lector.leerString());
        System.out.println("Ingrese equipo visitante");
        unPartido.setVisitante(Lector.leerString());
        System.out.println("Ingrese cantidad goles equipo local");
        unPartido.setGolesLocal(Lector.leerInt());
        System.out.println("Ingrese cantidad goles equipo visitante");
        unPartido.setGolesVisitante(Lector.leerInt());
        while (!unPartido.getVisitante().equals("ZZZ") && (dimL <= 20)){
            vector[dimL] = unPartido;
            dimL++;
            unPartido = new Partido();
            System.out.println("Ingrese equipo local");
            unPartido.setLocal(Lector.leerString());
            System.out.println("Ingrese equipo visitante");
            unPartido.setVisitante(Lector.leerString());
            System.out.println("Ingrese cantidad goles equipo local");
            unPartido.setGolesLocal(Lector.leerInt());
            System.out.println("Ingrese cantidad goles equipo visitante");
            unPartido.setGolesVisitante(Lector.leerInt());
          
            }
        int i,cant = 0;
        for (i = 0; i< dimL; i++){
            System.out.println(vector[i]);
            if (vector[i].getVisitante.equals("River"))
    }
    }
    
}
