/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;
public class Ej04 {
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int [][] matriz = new int [8][4];
        // incializar las oficinas
        int i,j;
        for (i=0; i<4; i++)
            for (j=0; j<8; j++)
                matriz[j][i] = 0;
        // simular llegada de persona
         for (i = 0; i < 8; i++){
            System.out.print("|");
            for (j = 0; j < 4; j++){
                System.out.print(matriz[i][j] + "|");
            }
          System.out.println();
         }  
        int pisoPersona,ofiPersona;
        System.out.println("Ingrese el piso al cual quiere ir: ");
        pisoPersona = Lector.leerInt();
           while (pisoPersona != 9){
               System.out.println("Ingrese la oficina a la cual quiere ir: ");
               ofiPersona = Lector.leerInt();
               matriz[pisoPersona -1][ofiPersona -1]++;
               System.out.println("Ingrese el piso al cual quiere ir: ");
               pisoPersona = Lector.leerInt();
               
            }     
    
        for (i = 0; i < 8; i++){
            System.out.print("|");
            for (j = 0; j < 4; j++){
                System.out.print(matriz[i][j] + "|");
            }
          System.out.println();
         }        
    
    }
    
}
