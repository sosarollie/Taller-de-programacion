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
public class Auto {
    private int numeroDueño;
    private int patente;

    public Auto(int numeroDueño, int patente) {
        this.numeroDueño = numeroDueño;
        this.patente = patente;
    }
    
    public int getNumeroDueño() {
        return numeroDueño;
    }

    public void setNumeroDueño(int numeroDueño) {
        this.numeroDueño = numeroDueño;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "numeroDue\u00f1o=" + numeroDueño + ", patente=" + patente + '}';
    }
}
