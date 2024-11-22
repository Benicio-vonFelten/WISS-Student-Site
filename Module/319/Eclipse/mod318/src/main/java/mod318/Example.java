package mod318;

public class Example {
	//	Entra point in unser Programm.
	//	Public: Man kann diese Funktion / Methode von überall aufrufen.
	//	Static: Funktion / Methode gehört zur Klasse;.
	//  String[]: Array von Strings
	//	String[] args: Args ist Input Parameter.
	public static void firstSteps() {
		int a = 1;
		int b = 2;
		int c = 3;
		
		// Zuweisungen
		int tmp = 0; // a = 1, b = 2, c = 3, tmp = 0
		tmp = a; // a = 1, b = 2, c = 3, tmp = 1
		a = b; // a = 2, b = 2, c = 3, tmp = 1
		b = tmp; // a = 2, b = 1, c = 3, tmp = 1
		
		// Arithmetische Operatoren für ganze Zahlen
		a = b + c; 	// a = 4, b = 1, c = 3, tmp = 1
		a = a + c; 	// a = 7, b = 1, c = 3, tmp = 1
		a = a - b; 	// a = 6, b =1, c = 3, tmp = 1
		b = a*c; 	// a = 6, b = 18, c = 3, tmp = 1
		b++; 		// a = 6, b = 19, c = 3, tmp = 1
		b = b / a; 	// a = 6, b = 3, c = 3, tmp = 1 --> Ganzzahldivision!
		b = b + 2; 	// a = 6, b = 5, c = 3, tmp = 1
		a = b % c; 	// a = 2, b = 5, c = 3, tmp = 1 --> Rest Berechnung = Modulo
	

		if (a == 2) {
			System.out.println("a ist 2");
		}
		System.out.println("Hier geht es in jedem Fall weiter");
		
		
		// if statements, variante 2: if else
		if(a == 1) {
			System.out.println("a ist 1");
		}
		else {
			System.out.println("a ist nicht 1");
		}
		System.out.println("Hier geht es in jedem Fall weiter");
		
		// if statements, variante 2: if else if else if ..... else
		// else hat keine Bedingung!!!!
		// else kommt immer am Schluss!!!
		// Wichtig für ZP
		
		if (a==0) {
			System.out.println("a ist 0");
		}
		else if (a==1) {
            System.out.println("a ist 1");
        }
		else if (a==2) {
            System.out.println("a ist 2");
        }
		else {
			System.out.println("a ist weder 0,1 noch 2");
		}
		
		System.out.println("Hier geht es in jedem Fall weiter");
	}
	
	public static int add(int a, int b) {
		int resultat = a + b;
		return resultat;
	}
	
	public static boolean isEven(int n) {
		boolean result = (n%2 == 0);
		return result;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] a = {1,5,4,7,2};
		//System.out.println(a.lenght);
		
		//
		// for loop
		//
		
//		for(int 1=0;i<a.lenght;i++) {
//			System.out.println("Nächste Zahl: ");
//			System.out.println(a[i]);
//			
//		}
		
		// CTRL+SHIFT+/= Ausklammern
		
		//
		// while loop
		//
		
		int i = 0;
		while(i < a.length) {
			System.out.print("Nächste Zahl: ");
			System.out.println(a[i]);
			i = i + 1; // gleich wie i++
		}
		System.out.println("Fertig");
		
		// do while: Bedingung wird am Schluss kontrolliert!
		int j = 4;
		do {
			System.out.println(a[j]);
			j++;
		}	while(j < a.length);
		
		int summe = add(12,15);
		System.out.println(summe);
		boolean even = isEven(15);
		System.out.println(even);
	}
}
