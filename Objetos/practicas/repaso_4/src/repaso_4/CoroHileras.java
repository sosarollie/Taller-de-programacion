/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_4;

/**
 *
 * @author praise
 */
public class CoroHileras extends Coro{
    private Corista [][] coristas;
    private int hileraActual = 0;
    private int cantEnHileraActual = 0;
    private int cantHileras;
    private int cantPorHilera;

    public CoroHileras(String nombre, Director unDirector, int cantHileras, int cantPorHilera) {
        super(nombre, unDirector);
        coristas = new Corista [cantHileras][cantPorHilera];
    }
    
    public boolean estaLleno(){
        return (this.cantEnHileraActual == this.cantPorHilera && this.hileraActual == this.cantHileras);
    }
    
    public void agregarCorista(Corista unCorista){
        coristas[hileraActual][cantEnHileraActual] = unCorista;
        if (cantEnHileraActual < cantPorHilera) {
            cantEnHileraActual++;
        } else if (hileraActual < cantHileras){
            hileraActual++;
            cantEnHileraActual = 0;
        }
    }
    
    public boolean bienFormado(){
        int tonoAnterior = coristas[0][0].getTonoFundamental();
        int tonoHileraAnterior = tonoAnterior;
        int i, j;
        for (i = 1; i < cantHileras; i++){
            for (j = 1; j < cantPorHilera; j++){
                if (coristas[i][j].getTonoFundamental() != tonoAnterior){
                    return false;
                } else tonoAnterior = coristas[i][j].getTonoFundamental();
            }
            if (tonoHileraAnterior < coristas[i][0].getTonoFundamental()){
                return false;
            } else tonoAnterior = coristas[i][0].getTonoFundamental();
        }
        return true;
    }
    
    public String toString(){
        String aux = "";
        int i,j;
        for (i = 0; i < cantHileras; i++){
            for (j = 0; j < cantPorHilera; j++){
                aux += coristas[i][j].toString();
                aux += " ";
            }
        }
        return "Coro: " + this.getNombre() + this.getUnDirector().toString() + aux;
    }
}
