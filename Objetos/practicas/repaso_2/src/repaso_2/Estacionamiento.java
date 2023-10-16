/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso_2;

/**
 *
 * @author praise
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int cantPisos;
    private int cantPlazas;
    private Auto [][] estacionamiento;

    public Estacionamiento(String nombre, String direccion){
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.cantPisos = 5;
        this.cantPlazas = 10;
        estacionamiento = new Auto [cantPisos][cantPlazas];
    }
    
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int numeroPisos, int numeroPlazas){
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.cantPisos = numeroPisos;
        this.cantPlazas = numeroPlazas;
        estacionamiento = new Auto [numeroPisos][numeroPlazas];
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    public void registrarAuto (Auto A, int X, int Y){
        estacionamiento[X][Y]= A;
    } 
    
    public String ubicarAuto (int Patente){
        int i, j;
        boolean encontre = false;
        int pisoPatente = 0, plazaPatente = 0;
        for (i = 0; i < this.cantPisos; i++){
            for (j = 0; j < this.cantPlazas; j++){
                if (estacionamiento[i][j].getPatente() == Patente){
                    encontre = true;
                    pisoPatente = i;
                    plazaPatente = j;
                }
            }
        }
        if (encontre == true){
            return "El auto se encuentra en el piso " + pisoPatente + ", plaza " + plazaPatente;
        } else return "Auto Inexistente";
    }
    
    public int cantidadAutosEnPlaza (int Y){
        int i, cant = 0;
        for (i = 0; i < cantPisos; i++){
            if (estacionamiento[i][Y] != null){
                cant++;
            }
        }
        return cant;
    }
    
    public String toString(){
        int i,j;
        String aux = "";
        for (i = 0; i < this.cantPisos; i++){
            for (j = 0; j < this.cantPlazas; j++){
                aux+= "Piso " + i + " Plaza " + j + " ";
                if (estacionamiento[i][j] != null){
                    aux+= estacionamiento[i][j].toString();
                } else aux+= "libre";
                aux+= "\n";
            }   
        }
        return aux;
    }
    
}
