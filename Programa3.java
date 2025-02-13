/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programa3;
import java.io.*;
import java.util.Scanner;
import java.util.regex.*;
/**
 *
 * @author abi_o
 */
public class Programa3 {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Archivo: ");
        String fileName = scanner.nextLine();
        fileName += ".txt";

        try (PrintWriter file = new PrintWriter(new FileWriter(fileName))) {
            writeTxt(scanner, file);
        } catch (IOException e) {
            System.out.println("Error " + fileName);
            return;
        }

        int tot = 0, totWOSpaces = 0;
        int numeros = 0, alfanumericos = 0, letras = 0, tokens = 0;

        searchMatchesLines(fileName, tot, totWOSpaces, numeros, alfanumericos, letras, tokens);

        System.out.println("\nREPORT");
        System.out.println("Total characters (with spaces): " + tot);
        System.out.println("Total characters (without spaces): " + totWOSpaces);
        System.out.println("Total lexemes: " + tokens);
        System.out.println("Total numbers: " + numeros);
        System.out.println("Total words: " + letras);
        System.out.println("Total combined: " + alfanumericos);

        scanner.close();
    }

    public static void writeTxt(Scanner scanner, PrintWriter file) {
        System.out.println("Para detener escribe 'fin'");

        while (true) {
            String line = scanner.nextLine();
            if (line.equals("fin")) break;
            file.println(line);
        }
    }

    public static void searchMatchesLines(String fileName, int tot, int totWOSpaces, int Num, int ANum, int Let, int lex) {
        try (BufferedReader file = new BufferedReader(new FileReader(fileName))) {
            String line;
            Pattern countChar = Pattern.compile("\\w");
            Pattern countCharSpa = Pattern.compile("[\\w ]");
            Pattern tok = Pattern.compile("\\b[a-zA-Z0-9]+\\b");
            Pattern num = Pattern.compile("\\b[0-9]+\\b");
            Pattern Lett = Pattern.compile("\\b[a-zA-Z]+\\b");
            Pattern AlNum = Pattern.compile("\\b(?=.\\d)(?=.[a-zA-Z])[a-zA-Z0-9]+\\b");

            while ((line = file.readLine()) != null) {
                Num += countMatches(line, num);
                Let += countMatches(line, Lett);
               ANum += countMatches(line, AlNum);
                lex += countMatches(line, tok);
                totWOSpaces += countMatches(line, countChar);
                tot += countMatches(line, countCharSpa);
            }
        } catch (IOException e) {
            System.out.println("Error " + fileName);
        }
    }

    private static int countMatches(String line, Pattern pattern) {
        Matcher matcher = pattern.matcher(line);
        int count = 0;
        while (matcher.find()) count++;
        return count;
    }
}
