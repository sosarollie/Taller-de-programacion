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
public abstract class Sistema {
    private Estacion unaEstacion;
    private int añoComienzo;
    private int cantAños;
    private double [][] temperaturas;

    public Sistema(Estacion unaEstacion, int añoComienzo, int cantAños) {
        this.unaEstacion = unaEstacion;
        this.añoComienzo = añoComienzo;
        this.cantAños = cantAños;
        temperaturas = new double [cantAños][12];
        int i, j;
        for (i = 0; i < cantAños; i++){
            for (j = 0; j < 12; j++){
                temperaturas[i][j] = 9999;
            }
        }
    }

    public int getAñoComienzo() {
        return añoComienzo;
    }

    public int getCantAños() {
        return cantAños;
    }

    public Estacion getUnaEstacion() {
        return unaEstacion;
    }
    
    public void registrarTemp (double temp, int mes, int año){
        temperaturas[año][mes]= temp;
    }
    
    public double obtenerTemp (int mes, int año){
        return temperaturas[año][mes];
    }
     
    public String mayorTemp(){
        int i,j, mayorMes = 0, mayorAño = 0;
        double mayorTemp = 0;
        for (i = 0; i < cantAños; i++){
            for (j = 0; j < 12; j++){
                if (temperaturas[i][j] > mayorTemp){
                    mayorAño = i;
                    mayorMes = j;
                }
            }
        }
        return "Mayor temperatura: " + mayorMes + "/" + (añoComienzo +mayorAño);
    }
    
    public String toString(){
        return unaEstacion.getNombre() + "(" + unaEstacion.getLatitud() + "-" + unaEstacion.getLongitud() + ")";
    }
}
