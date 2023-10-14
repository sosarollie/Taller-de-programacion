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
public class ej03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estante unEstante = new Estante();
        int i;
        Libro unLibro;
        for (i = 0; i < 2; i++){
            unLibro = new Libro();
            System.out.println("Ingrese el año de edicion");
            unLibro.setAñoEdicion(Lector.leerInt());
            System.out.println("Ingrese la editorial");
            unLibro.setEditorial(Lector.leerString());
            System.out.println("Ingrese el ISBN");
            unLibro.setISBN(Lector.leerString());
            System.out.println("Ingrese el precio");
            unLibro.setPrecio(Lector.leerDouble());
            System.out.println("Ingrese el autor");
            unLibro.setPrimerAutor(Lector.leerString());
            System.out.println("Ingrese el titulo");
            unLibro.setTitulo(Lector.leerString()); 
            unEstante.agregarLibro(unLibro);
        }
        Libro libroBuscado;
        libroBuscado = unEstante.devolverConTitulo("Mujercitas");
        
        System.out.println("El autor del libro " + libroBuscado.getTitulo() + " es " + libroBuscado.getPrimerAutor());
    }
    
}
