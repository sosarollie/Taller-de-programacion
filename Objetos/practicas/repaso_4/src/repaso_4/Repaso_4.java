/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_4;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class Repaso_4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CoroSemicircular unCoroSemicircular;
        CoroHileras unCoroHileras;
        Director unDirector;
        Corista unCorista;
        
        //instanciar semicircular
        System.out.println("Ingrese nombre del coro");
        String nombreCoro = Lector.leerString();
        System.out.println("Ingrese nombre del director");
        String nombreDirector = Lector.leerString();
        System.out.println("Ingrese DNI del director");
        int DNI = Lector.leerInt();
        System.out.println("Ingrese edad del director");
        int edad = Lector.leerInt();
        System.out.println("Ingrese antiguedad del director");
        int antiguedad = Lector.leerInt();
        unDirector = new Director(antiguedad, nombreDirector, DNI, edad);
        System.out.println("Ingresar cantidad de coristas");
        int cantCoristas = Lector.leerInt();
        int i, tonoFundamental;
        String nombre;
        unCoroSemicircular = new CoroSemicircular(nombreCoro, unDirector, cantCoristas);
        for (i = 0; i < cantCoristas; i++){
            System.out.println("Ingrese nombre del corista");
            nombre = Lector.leerString();
            System.out.println("Ingrese DNI del corista");
            DNI = Lector.leerInt();
            System.out.println("Ingrese edad del corista");
            edad = Lector.leerInt();
            System.out.println("Ingrese tono fundamental del corista");
            tonoFundamental = Lector.leerInt();
            unCorista = new Corista(tonoFundamental, nombre, DNI, edad);
            unCoroSemicircular.agregarCorista(unCorista);
        }
        
        //instanciar coroHileras
        System.out.println("Ingrese nombre del coro");
        nombreCoro = Lector.leerString();
        System.out.println("Ingrese nombre del director");
        nombreDirector = Lector.leerString();
        System.out.println("Ingrese DNI del director");
        DNI = Lector.leerInt();
        System.out.println("Ingrese edad del director");
        edad = Lector.leerInt();
        System.out.println("Ingrese antiguedad del director");
        antiguedad = Lector.leerInt();
        unDirector = new Director(antiguedad, nombreDirector, DNI, edad);
        System.out.println("Ingrese la cantidad de hileras del coro");
        int cantHileras = Lector.leerInt();
        System.out.println("Ingrese la cantidad de coristas por hilera");
        int cantPorHilera = Lector.leerInt();
        int j;
        unCoroHileras = new CoroHileras(nombreCoro, unDirector, cantHileras, cantPorHilera);
        for (i = 0; i < cantHileras; i++){
            for (j = 0; j < cantPorHilera; j++){
                System.out.println("Ingrese nombre del corista");
                nombre = Lector.leerString();
                System.out.println("Ingrese DNI del corista");
                DNI = Lector.leerInt();
                System.out.println("Ingrese edad del corista");
                edad = Lector.leerInt();
                System.out.println("Ingrese tono fundamental del corista");
                tonoFundamental = Lector.leerInt();
                unCorista = new Corista(tonoFundamental, nombre, DNI, edad);
                unCoroHileras.agregarCorista(unCorista);
            }
        }      
    }
    
}
