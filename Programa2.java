/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programa2;
import java.util.Scanner;

public class Programa2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Ingresa el texto: ");
        String texto = scanner.nextLine();
        
        int enteros = 0;
        int palabras = 0;
        int compuestas = 0;
        
        String[] tokens = dividirTexto(texto);
        
        for (String fragmento : tokens) {
            if (esNumero(fragmento)) {
                enteros++;
            } else if (esPalabra(fragmento)) {
                palabras++;
            } else {
                compuestas++;
            }
        }
        
        System.out.println("Entero: " + enteros);
        System.out.println("Palabra: " + palabras);
        System.out.println("Compuesta: " + compuestas);
        
        scanner.close();
    }
    
    public static String[] dividirTexto(String texto) {
        texto = texto.trim();
        int espacios = 0;
        
        for (int i = 0; i < texto.length(); i++) {
            if (texto.charAt(i) == ' ') {
                espacios++;
            }
        }
        
        String[] resultado = new String[espacios + 1];
        int index = 0;
        StringBuilder palabra = new StringBuilder();
        
        for (int i = 0; i < texto.length(); i++) {
            char c = texto.charAt(i);
            if (c == ' ') {
                if (palabra.length() > 0) {
                    resultado[index++] = palabra.toString();
                    palabra.setLength(0);
                }
            } else {
                palabra.append(c);
            }
        }
        
        if (palabra.length() > 0) {
            resultado[index] = palabra.toString();
        }
        
        return resultado;
    }
    
    public static boolean esNumero(String cadena) {
        for (int i = 0; i < cadena.length(); i++) {
            char c = cadena.charAt(i);
            if (c < '0' || c > '9') {
                return false;
            }
        }
        return !cadena.isEmpty();
    }
    
    public static boolean esPalabra(String cadena) {
        for (int i = 0; i < cadena.length(); i++) {
            char c = cadena.charAt(i);
            if ((c < 'A' || c > 'Z') && (c < 'a' || c > 'z')) {
                return false;
            }
        }
        return !cadena.isEmpty();
    }
}
