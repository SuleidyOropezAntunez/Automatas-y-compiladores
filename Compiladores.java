package compiladores;

import java.util.Scanner;

public class Compiladores {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
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
