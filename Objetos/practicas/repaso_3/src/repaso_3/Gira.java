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
public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] fechas;
    private Fecha fechaActual;
    private int dimL = 0;
    
    public Gira(String nombreGira, String nombre, int cantTemas, int cantFechas) {
        super(nombre, cantTemas);
        this.nombreGira = nombreGira;
        this.fechas = new Fecha [cantFechas]; 
    }   
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    
    public void agregarFecha(Fecha unaFecha){
        fechas[dimL]= unaFecha;
        dimL++;
    }
    
    @Override
    public void actuar(){
        int i;
        for (i = 0; i < dimL; i++){
            fechaActual = fechas[i];
            System.out.println("Buenas noches " + fechaActual.getCiudad());
            super.actuar();
        }
    }
    
    public int calcularCosto(){
        int i, suma = 0;
        for (i = 0; i < dimL; i++){
            suma+= 30000;
        }
        return suma;
    }
}
