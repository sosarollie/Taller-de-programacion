/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import java.math.RoundingMode; //achicar decimales
import java.text.DecimalFormat; 
public class EJ05 {
    
    private static final DecimalFormat df = new DecimalFormat("0.0");

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        double [][] matriz = new double [4][5];
        int i,j;
        for (i = 0; i < 5; i++){
            for (j = 0; j < 4; j++)             
                matriz[j][i] = (GeneradorAleatorio.generarDouble(10));
        }
        System.out.println("Las puntuaciones dadas son: ");      
        for (i = 0; i < 4; i++){
            if (i==0)
                System.out.print("Atencion al Cliente ");
            if (i==1)
                System.out.print("Calidad de la Comida ");
            if (i==2)
                System.out.print("Precio ");
            if (i==3)
                System.out.print("Ambiente ");
            System.out.print("|");
            for (j = 0; j < 5; j++){
                System.out.print(df.format(matriz[i][j]) + "|");
            }
          System.out.println();
         }
        double [] vectorProm = new double [4];
        double prom ,suma = 0;
         for (i = 0; i < 4; i++){
            for (j = 0; j < 5; j++)
              suma = suma + matriz[i][j];
            prom = suma / 5;
            vectorProm[i] = prom;
            suma = 0;
         }
       
          System.out.println("El promedio es: ");      
        for (i = 0; i < 4; i++){
            if (i==0)
                System.out.print("Atencion al Cliente ");
            if (i==1)
                System.out.print("Calidad de la Comida ");
            if (i==2)
                System.out.print("Precio ");
            if (i==3)
                System.out.print("Ambiente ");
            System.out.print("|");
                System.out.println(df.format(vectorProm[i]) + "|");
            }
            
        
        
    
              
                    
        
           
    
    
    
    }
    
}
