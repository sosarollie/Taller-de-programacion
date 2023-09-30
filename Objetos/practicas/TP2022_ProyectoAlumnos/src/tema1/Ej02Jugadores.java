
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double[] vector = new double[15];
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i,cant= 0,cantProm = 0;
        double prom,altura,suma = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i<=14; i++){
            System.out.println("Ingrese la altura del jugador "+ i +"");
            altura = Lector.leerDouble();
            vector[i] = altura;
            suma = suma + altura;
            cant++;
                
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = suma / cant;
        System.out.println("El promedio de alturas es: "+ prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
          for (i=0; i<=14; i++){
              if (vector[i]>prom)
                  cantProm++;
          }  
        //Paso 9: Informar la cantidad.
          System.out.println("La cantidad de jugadores por encima del promedio de altura es de: "+cantProm);
    }
    
}
