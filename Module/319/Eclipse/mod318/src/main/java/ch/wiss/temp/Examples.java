package ch.wiss.temp;

import java.util.Arrays;

public class Examples {
    public static void main(String[] args) {
        // Gibt Hello World auf die Konsole aus.
        /* Auch interne
         * Beschreibung
         * auf mehrere Zeilen
         * verteilt.
         */
        System.out.println("Hello World");

        // Basistypen für ganze Zahlen
        byte b = 5;
        short s = 5;
        int i = 45; // int ist standart
        long l = 5L;
        // Basistypen für Gleitkommazahlen
        float f = 67.4f;
        double d = 12.234; // double ist standart

        // boolean: Wird verwendet für true false Werte (Wahr, Falsch)

        boolean isStudent = true;
        boolean isFemale = false;

        // erste Variante: einfaches if
        if (isStudent) {
            System.out.println("Es handelt sich um einen Studenten");
        }
        if (isFemale) {
            System.out.println("Es ist eine Frau");
        }

        // zweite Variante: if else
        if (isFemale) {
            System.out.println("Es ist eine Frau");
        } else {
            System.out.println("Es ist ein Mann");
        }

        // = ist Zuweisung
        // == ist ein Vergleich, welcher eine bollean retouerniert
        if (b == 1) {
            System.out.println("1");
        } else if (b == 2) {
            System.out.println("2");
        } else if (b == 4) {
            System.out.println("4");
        } else {
            System.out.println("Es ist eine andere Zahl");
        }

        // Zeichenketten werden als Strings bezeichnet:
        String text = "Ich bin ein Text";
        // Bemerkung: String ist kein Basistyp sondern eine Klasse.
        // Klassen werden gross geschrieben

        // So nie verwenden!!!!!!!!!!!!!!!!!!
        if (text == "Ich bin ein Text") {

        }

        // Korrekte Verwendung:
        if (text.equals("Ich bin ein Text")) {

        }

        // Arrays:
        int[] array = {1, 6, 5, 4, 2, 3, 4};
        boolean[] booleanArray = {true, false, false};
        String[] texts = {"Peter", "Hans", "Lukas"};

        // In der Informatik beginnen wir bei 0 zu zählen

        // erste Zahl: Index begintt bei 0
        // array [0] = 1 [1] = 6
        System.out.println(array[0]);
        // Der höchste Index in unserem Beispiel ist 6 --> Exception bei 7
        // System.out.println(array[7]);
        // Länge kann wie folgt ausgegeben werden:
        System.out.println("Die Länge des Arrays ist: " + array.length);

        // Umständlich
        System.out.println(array[0]);
        System.out.println(array[1]);
        System.out.println(array[2]);
        System.out.println(array[3]);
        System.out.println(array[4]);

        array[4] = 34;

        for (int j = 0; j < array.length; j++) {
            if (j == 4) {
                System.out.println("Index: " + j + " " + array[j]);
            }
        }

        // Folgende Statements geben aus, ob der Array aufsteigend sortiert ist:
        boolean isSorted = false;
        int[] numbersToSort = {5, 2, 3, 1, 4, 7, 6};
        Arrays.sort(numbersToSort);
        
        System.out.print("Nummern ");
        for (int num : numbersToSort) {
            System.out.print(num + " ");
            
            
        }
        System.out.println();
        System.out.println("Nummerierung ist: "+isSorted);
    }
}
