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
public class ej06 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SistemaAños unSistemaAños;
        SistemaMeses unSistemaMeses;
        
        int i, j, añoComienzo = 2021, cantAños = 3;
        String nombre = "La Plata";
        double latitud = -34.921;
        double longitud = -57.955;
        double temp;
        Estacion unaEstacion = new Estacion(nombre, latitud, longitud);
        unSistemaAños = new SistemaAños(unaEstacion, añoComienzo, cantAños);
        
        
        for (i = 0; i < cantAños; i++){
            for (j = 0; j < 12; j++){
                System.out.println("Ingrese la temperatura del mes " + (j + 1) + ", " + (añoComienzo + i));
                temp = Lector.leerDouble();
                unSistemaAños.registrarTemp(temp, j, i);
            }
        }
        System.out.println(unSistemaAños.toString());
        System.out.println(unSistemaAños.mayorTemp());
        
        añoComienzo = 2020;
        cantAños = 4;
        nombre = "Mar del Plata";
        latitud = -38.002;
        longitud = -57.556;
        unaEstacion = new Estacion(nombre, latitud, longitud);
        unSistemaMeses = new SistemaMeses(unaEstacion, añoComienzo, cantAños);
       
        for (i = 0; i < cantAños; i++){
            for (j = 0; j < 12; j++){
                System.out.println("Ingrese la temperatura del mes " + (j + 1) + ", " + (añoComienzo + i));
                temp = Lector.leerDouble();
                unSistemaMeses.registrarTemp(temp, j, i);
            }
        }
        System.out.println(unSistemaMeses.toString());
        System.out.println(unSistemaMeses.mayorTemp());
    }
    
}
