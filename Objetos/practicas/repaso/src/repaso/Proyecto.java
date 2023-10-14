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
public class Proyecto {

    private String nombre;
    private int cod;
    private String nombreDirector;
    private Investigador[] investigadores = new Investigador[50];
    private int dimL = 0;

    public Proyecto(String nombre, int cod, String nombreDirector) {
        this.nombre = nombre;
        this.cod = cod;
        this.nombreDirector = nombreDirector;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public void agregarInvestigador(Investigador unInvestigador) {
        investigadores[dimL] = unInvestigador;
        dimL++;
    }

    public double dineroTotalOtorgado() {
        int i;
        double suma = 0;
        for (i = 0; i < this.dimL; i++) {
            suma += investigadores[i].montoSubsidios();
        }
        return suma;
    }

    public void otorgarTodos(String nombreCompleto) {
        int i;
        for (i = 0; i < dimL; i++) {
            if (investigadores[i].getNombreCompleto().equals(nombreCompleto));
            {
                investigadores[i].otorgarSubsidios();
            }
        }
    }

    @Override
    public String toString() {
        String aux = "";
        aux = "Proyecto{" + "nombre=" + nombre + ", cod=" + cod + ", nombreDirector=" + nombreDirector + '}' + " dinero total otorgado" + dineroTotalOtorgado();
        int i;
        for (i = 0; i < dimL; i++){
            aux += investigadores[i].toString();
        }
        return aux;
    }

}
