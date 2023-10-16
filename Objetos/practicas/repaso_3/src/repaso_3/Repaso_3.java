/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_3;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class Repaso_3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Gira unaGira;
        EventoOcasional unEventoOcasional;
        Fecha unaFecha;
        int i;
        // instanciar evento
        
        System.out.println("Ingrese nombre del evento");
        String nombre = Lector.leerString();
        System.out.println("Ingrese cantidad de temas a tocar");
        int cantTemas = Lector.leerInt();
        System.out.println("Ingrese el motivo del evento");
        String motivo = Lector.leerString();
        System.out.println("Ingrese el nombre del contratante");
        String nombreContratante = Lector.leerString();
        System.out.println("Ingrese el dia");
        String dia = Lector.leerString();
        unEventoOcasional = new EventoOcasional(motivo, nombreContratante, dia, nombre, cantTemas);
        
        String unTema;
        for (i = 0; i < cantTemas; i++){
            System.out.println("Ingrese el nombre del tema");
            unTema = Lector.leerString();
            unEventoOcasional.agregarTema(unTema);
        }
        
        // instanciar gira
        System.out.println("Ingrese nombre del evento");
        nombre = Lector.leerString();   
        System.out.println("Ingrese cantidad de temas a tocar");
        cantTemas = Lector.leerInt();
        System.out.println("Ingrese el nombre de la gira");
        String nombreGira = Lector.leerString();
        System.out.println("Ingrese la cantidad de fechas");
        int cantFechas = Lector.leerInt();
        unaGira = new Gira(nombreGira, nombre, cantTemas, cantFechas);
        
        for (i = 0; i < cantTemas; i++){
            System.out.println("Ingrese el nombre del tema");
            unTema = Lector.leerString();
            unaGira.agregarTema(unTema);
        }     
        
        for (i = 0; i < cantFechas; i++){
            System.out.println("Ingrese la ciudad");
            String ciudad = Lector.leerString();
            System.out.println("Ingrese el dia");
            String diaFecha = Lector.leerString();
            unaFecha= new Fecha(ciudad, diaFecha);
            unaGira.agregarFecha(unaFecha);
        }
        unEventoOcasional.actuar();
        System.out.println(unEventoOcasional.calcularCosto());
        unaGira.actuar();
        System.out.println(unaGira.calcularCosto());
    }
    
}
