/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programa2;
import java.util.Scanner;
import java.util.regex.Pattern;
/**
 *
 * @author abi_o
 */
public class Programa2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Ingrese una cadena de caracteres:");
        String entrada = scanner.nextLine();
        scanner.close();
       
        int enteros = 0;
        int palabras = 0;
        int compuestas = 0;
      
        String enteroRegex = "^\\d+$";
        String palabraRegex = "^[a-zA-Z]+$";
        String compuestaRegex = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]+$";
       
        String[] tokens = entrada.split("\\s+");

        for (String token : tokens) {
            if (Pattern.matches(enteroRegex, token)) {
                enteros++;
            } else if (Pattern.matches(palabraRegex, token)) {
                palabras++;
            } else if (Pattern.matches(compuestaRegex, token)) {
                compuestas++;
            }
        }
        System.out.println("Entero: " + enteros );
         System.out.println("Palabra: " + palabras);
          System.out.println("Compuesta: " + compuestas );
    }
}
    


