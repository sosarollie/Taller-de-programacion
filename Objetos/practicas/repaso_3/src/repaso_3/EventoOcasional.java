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
public class EventoOcasional extends Recital {
    private String motivo;
    private String nombreContratante;
    private String dia;

    public EventoOcasional(String motivo, String nombreContratante, String dia, String nombre, int cantTemas) {
        super(nombre, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
    
    @Override
    public void actuar(){
        switch(this.motivo){
            case "Beneficiencia":
                System.out.println("Recuerden colaborar con" + this.nombreContratante);
                break;
            case "TV":
                System.out.println("Saludos amigos televidentes");
                break;
            case "Privado":
                System.out.println("Un feliz cumpleaños para" + this.nombreContratante);
                break;             
        }
        super.actuar();
    }
    
    public int calcularCosto(){
        int costo = 1;
        switch(this.motivo){
            case "Beneficiencia":
                costo= 0;
                break;
            case "TV":
                costo= 50000;
                break;
            case "Privado":
                costo= 150000;
                break;
        } 
        return costo;
    }
}
