/*
 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. Implemente un constructor que permita iniciar el estante sin libros. 
Provea métodos para:  
(i) devolver la cantidad de libros que almacenados 
(ii) devolver si el estante está lleno     
(iii) agregar un libro al estante 
(iv) devolver el libro con un título particular que se recibe. 
 */
package tema3;

/**
 *
 * @author valen
 */

public class Estante {
    private Libro [] estante = new Libro[20]; 
    private int dimL = 0; 
    private int dimF = 0; 
   
    public Estante() {
        
    }
    
    public void setLibro(Libro unLibro) {
        while (dimL < dimF && estante[dimL] != null)
            dimL++; 
        if (dimL < dimF)
            estante[dimL] = unLibro; 
            
    }

    public String getLibro(String titulo) {
        String aux = new String();
        int i=0;
        while (i < dimL && !estante[i].getTitulo().equals(titulo))
            i++;
        if (estante[i].getTitulo().equals(titulo))
           aux = estante[i].toString();  
        return aux; 
    }

    
    // METODOS DE LA CLASE 
        
    public int cantLibros() {
        return dimL; 
    }
    
    public void setDimF(int dimension){
      this.dimF = dimension; 
        
    }
    
    public int getDimF(){
        return this.dimF;
    }
    
    public boolean estaLleno() {
        boolean ok = false; 
        if (dimL == dimF) 
            ok = true; 
        return ok; 
    }
    
}