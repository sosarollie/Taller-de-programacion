/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int [5][5];
        int i,j;
        for (i=0; i<5; i++)
            for (j=0; j<5; j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
        }
        //Paso 4. mostrar el contenido de la matriz en consola
         for (i = 0; i < 5; i++){
            System.out.print("|");
            for (j = 0; j < 5; j++){
                System.out.print(matriz[i][j] + "|");
            }
          System.out.println();
         }        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
         int suma=0;
         int linea = 0; // 0 informa la linea 1 y 1 informa la linea 2
         for (j=0; j<5; j++){
             suma = suma + matriz[linea][j];
         }
         System.out.println("La suma de los elemntos de la fila 1 es de: "+suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
          int sumaColumna;
          int[] vector = new int[5];
          for (j=0;j<5;j++){
            sumaColumna = 0;
            for(i=0;i<5;i++)
                sumaColumna = sumaColumna + matriz[i][j];
            vector[j] = sumaColumna;
          }
          for (j=0; j<5; j++)
              System.out.println("Columna: " + (j+1) + " " + vector[j]);
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
          System.out.println("Ingrese el elemento a buscar");
          int valor,posColumna= 0,posFila = 0, columna = 0, fila = 0;
          boolean ok = false;
          valor = Lector.leerInt();
          while (fila <= 4 && ok == false){
              if (matriz[fila][columna] == valor){
                  ok = true;
                  posColumna = columna;
                  posFila = fila;
              }
              else{
                  if (columna == 4){
                    columna= 0;
                    fila++;
                  }
                  else{
                      columna++;
                } 
            }
          }
         if (ok == true)
             System.out.println("El elemento se encontró en la fila " + (posFila + 1) + " columna " + (posColumna + 1));
         else
             System.out.println("No se encontró el elemento");
    }
                  
              
          
    }
