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
public class Ej3pt3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese la cantidad maxima de libros que puede haber en el estante.");        
        Estante unEstante = new Estante();
        unEstante.setDimF(Lector.leerInt());
        int i;
        Libro unLibro;
        Autor unAutor;
        for (i=0; i<unEstante.getDimF(); i++){
            unLibro = new Libro();
            unAutor = new Autor();
            System.out.println("Ingrese el titulo del libro.");
            unLibro.setTitulo(Lector.leerString());
            System.out.println("Ingrese la editorial.");
            unLibro.setEditorial(Lector.leerString());
            System.out.println("Ingrese el año de edicion");
            unLibro.setAñoEdicion(Lector.leerInt());
            System.out.println("Ingrese el nombre del autor");
            unAutor.setNombre(Lector.leerString());
            System.out.println("Ingrese la biografia del autor");
            unAutor.setBiografia(Lector.leerString());
            System.out.println("Ingrese el origen del autor");
            unAutor.setOrigen(Lector.leerString());
            unLibro.setPrimerAutor(unAutor);
            System.out.println("Ingrese el ISBN");
            unLibro.setISBN(Lector.leerString());
            System.out.println("Ingrese el Precio");
            unLibro.setPrecio(Lector.leerInt());
            unEstante.setLibro(unLibro);
        }
            
        
           System.out.println(unEstante.toString());
           System.out.println(unEstante.estaLleno());
           System.out.println(unEstante.getLibro("Mujercitas"));
        
        
    }
    
}
