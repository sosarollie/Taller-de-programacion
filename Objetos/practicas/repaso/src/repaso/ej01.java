/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;
import PaqueteLectura.Lector;
/**
 *
 * @author praise
 */
public class ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto unProyecto;
        System.out.println("Ingrese nombre del proyecto");
        String nombre = Lector.leerString();
        System.out.println("Ingrese codigo");
        int cod = Lector.leerInt();
        System.out.println("Ingrese el nombre del director");
        String nombreDirector = Lector.leerString();
        unProyecto = new Proyecto(nombre, cod, nombreDirector);
        
        int i, j;
        for (i = 0; i < 3; i++){
            Investigador unInvestigador;
            System.out.println("Ingrese un nombre");
            nombre = Lector.leerString();
            System.out.println("Ingrese una categoria");
            int categoria = Lector.leerInt();
            System.out.println("Ingrese una especialidad");
            String especialidad = Lector.leerString();
            unInvestigador = new Investigador(nombre, categoria, especialidad);
            unProyecto.agregarInvestigador(unInvestigador);
            for (j = 0; j < 2; j++){
                Subsidio unSubsidio;
                System.out.println("Ingrese el monto pedido");
                double montoPedido = Lector.leerDouble();
                System.out.println("Ingrese el motivo");
                String motivo = Lector.leerString();
                unSubsidio = new Subsidio(montoPedido, motivo);
                if (j == 1){
                    unSubsidio.setFueOtorgado(true);
                }
                unInvestigador.agregarSubsidio(unSubsidio);
            }  
        }
        unProyecto.toString();
    }
    
}
