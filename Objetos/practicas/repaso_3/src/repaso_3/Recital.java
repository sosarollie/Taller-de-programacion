/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_3;

/**
 *
 * @author praise
 */
public abstract class Recital {
    private String nombre;
    private String []temas;
    private int dimL = 0;

    public Recital(String nombre, int cantTemas) {
        this.nombre = nombre;
        this.temas = new String [cantTemas];
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void agregarTema(String nombreTema){
        this.temas[dimL] = nombreTema;
        dimL++;
    }
    
    public void actuar(){
        int i;
        for (i = 0; i < dimL; i++){
            System.out.println("y ahora tocaremos " + temas[i]);
        }
    }
   
    public abstract int calcularCosto();
    
}
