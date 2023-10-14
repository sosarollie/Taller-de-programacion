/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class ej04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese la cantidad de habitaciones del hotel");
        Hotel unHotel = new Hotel(Lector.leerInt());
        int i;
        for (i = 0; i < 2; i++){
            Cliente unCliente = new Cliente();
            System.out.println("Nombre: ");
            unCliente.setNombre(Lector.leerString());
            System.out.println("DNi: ");
            unCliente.setDNI(Lector.leerInt());
            System.out.println("Edad: ");
            unCliente.setEdad(Lector.leerInt());
            System.out.println("Ingrese la habitacion al cual desea acceder el cliente");
            int numHab = Lector.leerInt();
            unHotel.agregarCliente(unCliente, numHab);
        }
        System.out.println(unHotel.toString());
        System.out.println("Ingrese monto de aumento de habitaciones");
        double monto = Lector.leerDouble();
        unHotel.aumentarPrecio(monto);
        System.out.println(unHotel.toString());
    }
    
}
