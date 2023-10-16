/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_2;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class Repaso_2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento unEstacionamiento;
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese direccion");
        String direccion = Lector.leerString();
        System.out.println("Ingrese hora de apertura");
        String horaApertura = Lector.leerString();
        System.out.println("Ingrese hora de cierre");
        String horaCierre = Lector.leerString();
        unEstacionamiento = new Estacionamiento(nombre, direccion, horaApertura, horaCierre, 3, 3);
        int i, numeroDueño, patente, X, Y;
        Auto unAuto;
        for (i = 0; i < 6; i++){
            System.out.println("Ingrese numero de dueño");
            numeroDueño = Lector.leerInt();
            System.out.println("Ingrese patente");
            patente = Lector.leerInt();
            unAuto = new Auto(numeroDueño, patente);
            System.out.println("Ingrese el piso que corresponde al auto");
            X = Lector.leerInt() - 1;
            System.out.println("Ingrese la plaza");
            Y = Lector.leerInt() - 1;
            unEstacionamiento.registrarAuto(unAuto, X, Y);
        }
        System.out.println(unEstacionamiento.toString());
        System.out.println(unEstacionamiento.cantidadAutosEnPlaza(1));
        System.out.println("Ingrese una patente a buscar");
        int patenteABuscar = Lector.leerInt();
        System.out.println(unEstacionamiento.ubicarAuto(patenteABuscar));
    }
    
}
