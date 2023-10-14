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
public class SistemaAños extends Sistema{

    public SistemaAños(Estacion unaEstacion, int añoComienzo, int cantAños) {
        super(unaEstacion, añoComienzo, cantAños);
    }
    
    public String promedioAño() {
        double promedio, suma = 0;
        String aux = "\n";
        int i, j;
        for (i = 0; i < super.getCantAños(); i++){
            for (j = 0; j < 12; j++){
                suma+= super.obtenerTemp(j, i);
            }
            promedio = suma / 12;
            aux += "-Año " + (super.getAñoComienzo() + 0) + ": " + promedio + "°C \n " ;
            suma = 0;
        }
        return aux;
    }
    
    public String toString(){
        return super.toString() + promedioAño();
    }
}
