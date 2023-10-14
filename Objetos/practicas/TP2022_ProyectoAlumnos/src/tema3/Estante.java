/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
/**
 *
 * @author praise
 */
public class Estante {
    private Libro [] estante = new Libro [20];
    private int dimL = 0;
    private int dimF = 20;

    public Libro[] getEstante() {
        return estante;
    }

    public int getDimL() {
        return dimL;
    }
    
    public void Estante(){
        
    }
    
    public boolean estaLleno(){
        return this.dimL == this.dimF;
    }
    
    public void agregarLibro(Libro unLibro){
        if (this.estaLleno() == false) {
            this.estante[this.dimL] = unLibro;
            this.dimL++;
            
        }
    }
    
    public Libro devolverConTitulo(String unTitulo){
        int pos = 0;
        Libro libro = null;
        boolean encontre = false;
        while (pos <= dimL && encontre == false) {
            if (estante[pos].getTitulo().equals(unTitulo)){
                libro = estante[pos];
                encontre = true;
            }
            pos++;
        }
        return libro;
    }
}
