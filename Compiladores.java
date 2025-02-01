/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compiladores;

import java.util.Scanner;

/**
 *
 * @author suleidy
 */
public class Compiladores {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // TODO code application logic here
       System.out.print("Ingresa el texto: ");
       String texto = scanner.nextLine();
       
       if (esNumero(texto)) {
            System.out.println("Número");
        } else if (esPalabra(texto)) {
            System.out.println("Palabra");
        } else {
            System.out.println("Compuesta");
        }
        
        scanner.close();
    }
    
    // Método para verificar si es un numero
    public static boolean esNumero(String cadena) {
        for (char c : cadena.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }
    
    // Método para verficiar que es una palabra
    public static boolean esPalabra(String cadena) {
        for (char c : cadena.toCharArray()) {
            if (!Character.isLetter(c)) {
                return false;
            }
        }
        return true;
    }
}
  