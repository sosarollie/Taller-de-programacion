/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author praise
 */
public class VisorFigurasMain {
    public static void main(String[] args) {
    VisorFiguras visor = new VisorFiguras();
    Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
    visor.guardar(c1);
    Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
    visor.guardar(r);
    Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
    visor.guardar(c2);
    visor.mostrar();
}
}
