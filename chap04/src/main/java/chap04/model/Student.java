package chap04.model;

public class Student {
	
	public String name;
	public Integer kor;  
	public Integer eng;
	public Integer math;
	
	public Student(String name, int kor, int eng, int math) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	// test1의 math 점수만 가져오는 방법
	public Integer getMath() {
		return math;
	}
	
	public Double getAvg() {
		return (math + eng + kor) / 3.0;
	}
	
	@Override
	// test1의 Student info: chap04.model.Student@6a02c4cb 해결방법
	public String toString() {
		return String.format("[%s:%d/%d/%d]", name, kor, eng, math);
	}
}
