/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

/**
 *
 * @author praise
 */
public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios = new Subsidio [5];
    private int dimL = 0;

    public Investigador (String nombreCompleto, int categoria, String especialidad){
        this.nombreCompleto = nombreCompleto;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }
    
    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }
    
    public void agregarSubsidio (Subsidio unSubsidio){
        subsidios[dimL] = unSubsidio;
        dimL++;
    }
    
    public double montoSubsidios(){
        int i;
        double suma = 0;
        for (i = 0; i < this.dimL; i++){
            suma+= subsidios[i].getMontoPedido();
        }
        return suma;
    }
    
    public void otorgarSubsidios(){
        int i;
        for (i = 0; i < dimL; i++){
            subsidios[i].setFueOtorgado(true);
        }
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombreCompleto=" + nombreCompleto + ", categoria=" + categoria + ", especialidad=" + especialidad + " " + montoSubsidios();
    }
    
    
}
