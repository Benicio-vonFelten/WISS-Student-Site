package mod318;
 
public class Student extends Person{
	int studId;
	public Student(String name, int age, int studId) {
		super(name, age);
		this.studId = studId;
	}
	public int getStudId() {
		return studId;
	}
	public void setStudId(int studId) {
		this.studId = studId;
	}
	@Override
	public String toString() {
		return "Student [studId=" + studId + ", getName()=" + getName() + ", getAge()=" + getAge() + "]";
	}
	
}