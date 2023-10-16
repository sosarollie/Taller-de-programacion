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
public class CoroSemicircular extends Coro{
    private Corista [] coristas;
    private int dimL = 0;
    private int cantCoristas;
    
    public CoroSemicircular(String nombre, Director unDirector, int cantCoristas) {
        super(nombre, unDirector);
        this.cantCoristas = cantCoristas;
        coristas = new Corista [cantCoristas];
    }
    
    public void agregarCorista(Corista unCorista){
        coristas[dimL]= unCorista;
        dimL++;
    }
    
    public boolean estaLleno(){
        return dimL == cantCoristas;
    }
    
    public boolean bienFormado(){
        int tonoAnterior = coristas[dimL].getTonoFundamental();
        int i;
        for (i = 1; i < dimL; i++){
            if (coristas[dimL].getTonoFundamental() > tonoAnterior){
                return false;
            }
            tonoAnterior = coristas[i].getTonoFundamental();
        }
        return true;
    }
    
    @Override
    public String toString(){
        String aux = "";
        int i;
        for (i = 0; i < dimL; i++){
            aux+= coristas[dimL].toString();
            aux+= " ";
        }
        return "Coro: " + this.getNombre() + this.getUnDirector().toString() + aux;
    }
}
