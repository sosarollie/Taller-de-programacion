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
public class SistemaMeses extends Sistema{

    public SistemaMeses(Estacion unaEstacion, int añoComienzo, int cantAños) {
        super(unaEstacion, añoComienzo, cantAños);
    }
    
    public String promedioMeses(){
        double promedio, sumaMes = 0;
        String aux = "\n";
        String mesActual = "";
        int i, j;
        for (i = 0; i < 12; i++){
            for (j = 0; j < super.getCantAños(); j++){
                sumaMes+= super.obtenerTemp(i, j);
            }
            switch (i){
                case 0:
                    mesActual = "Enero";
                    break;
                case 1:
                    mesActual = "Febrero";
                    break;
                case 2:
                    mesActual = "Marzo";
                    break;
                case 3:
                    mesActual = "Abril";
                    break;
                case 4:
                    mesActual = "Mayo";
                    break;
                case 5:
                    mesActual = "Junio";
                    break;
                case 6:
                    mesActual = "Julio";
                    break;
                case 7:
                    mesActual = "Agosto";
                    break;
                case 8:
                    mesActual = "Septiembre";
                    break;
                case 9:
                    mesActual = "Octubre";
                    break;
                case 10:
                    mesActual = "Noviembre";
                    break;
                case 11:
                    mesActual = "Diciembre";
                    break;
            }
            promedio = sumaMes / super.getCantAños();
            aux += mesActual  + ": " + promedio + "°C \n " ;
            sumaMes = 0;
        }
        return aux;
    }
    
    public String toString(){
        return super.toString() + promedioMeses();
    }
}
