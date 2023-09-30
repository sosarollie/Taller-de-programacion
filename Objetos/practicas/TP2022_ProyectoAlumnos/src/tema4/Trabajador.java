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
public class Trabajador extends Persona {
    private String ocupacion;

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public Trabajador(String unNombre, int unDNI, int unaEdad,String ocupacion) {
        super(unNombre, unDNI, unaEdad);
        this.ocupacion = ocupacion;
    }

    @Override
    public String toString() {
        return super.toString() + " Soy: " + this.getOcupacion();
    }
    
    
}
