package mod318;

public class Intro {
	public static void main(String[] args) {
		/* Typ Variable
		* Variable = Platzhalter: anzStudenten
		* Name der Variabke frei wählbar
		* Der Name entspricht der Camel Case Notation: anzahlStudentenImLabor !!!
		* Typ = Art des Platzhalters
		* Typ int = Ganze Zahl
		* Typ String = Zeichenkette
		*/
		int anzStudenten;
		// Deklraration von der Variable name: Die Variable heisst name und ist vom Typ String.
		String name;
		String zweiterName;
		System.out.println(zweiterName);
		
		// Initialisierung: Zum ersten mal einen Wert (=Literal) zuweisen.
		anzStudenten = 21;
		name = "Peter Fischer";
		
		// Deklaration und Initialierung gleichzeitig.
		int anzLehrer = 1;
		
		// Zuweisen eines Wertes / Literals --> Wert wird verändert.
		anzLehrer = 5;
		System.out.println(anzLehrer);
		
		// Typen für ganze Zahlen
		byte b = 12; // 		8 Bits
		short s = 13; // 		16 Bits
		int i = 23;// 			32 Bits
		long l = 4l; // 		64 Bits
		
		// Typen für Gleichkommazahlen
		float f = 4.5f; // 		32 Bits
		double d = 45.345; // 	64 Bits
		
		// Beispiel für Konkatenation:
		String vorname = "Benicio";
		String nachname = "Von Felten";
		
		name = vorname+" "+nachname; // + Konkatenation = Verknüpfung von Strings.
		System.out.println(name);
	}
}
