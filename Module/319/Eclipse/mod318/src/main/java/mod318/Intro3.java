package mod318;

public class Intro3 {
	public static void main(String[] args) {
		// Typen: Basistypen wie z. B. int, short, boolean etc.
		int anzStudenten = 4;
		// Es gobt noch Klassen und Interfaces, welche auch Typen sind.
		// Klassen sind Baupläne für ein Objekt.
		// Ein Objekt ist ein Ding welches gebaut wurde mit ein Bauplan.
		// Interface ist ein Inhaltsverzeichnis für den Bauplan.
		
		// Wir wollen mehrere Objekte vom Typ Person erstellen:
		
		Person person1 = new Person("Peter", 23);
		IPerson person2 = new Person("Brigit", 18);
		Person person3 = new Person("Hans", 55);
		System.out.println("Die erste Person ist: "+person1.getAge()+"Jahre alt.");
		
		System.out.println(person2);
//		// person2.setAge(19);
		System.out.println(person2);
		
		Student student1 = new Student("Alf",20,123325);
		System.out.println(student1);
    }
}
