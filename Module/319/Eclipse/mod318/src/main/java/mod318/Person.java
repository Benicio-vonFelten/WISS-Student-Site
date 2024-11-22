package mod318;

public class Person implements IPerson {
	// Attribut (=Variablen)
	private String name;
	private int age;
	
	// Konstruktor: Dient zu Erzeugen / Kreieren von Objekten der Klasse Person
	public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
	
	
//	// Methoden
//	public String getName() {
//		return name;
//	}
//	
//	public int getAge() {
//		return age;
//	}
//	
//	public void setAge(int age) {
//        this.age = age;
//    }	
//	
	
	@Override
    public String getName() {
        return name;
    }

	public String toString() {
		return name+": "+age;
	}
	
	@Override
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
