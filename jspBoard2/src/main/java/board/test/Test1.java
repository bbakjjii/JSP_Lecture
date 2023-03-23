package board.test;

public class Test1 {

	public static class Apple {
		String grade;
		int price;
		
		public Apple(String grade, int price) {
			this.grade = grade;
			this.price = price;
		}
	}
	
	public static void main(String[] args) {
		
		// 두 값은 다르다. 인스턴스가 다르다.
		// 같은 값을 가지고 있으나 a1, a2로 다르다. 
		// new Apple을 2번 했으니까 닫른 객체다.
		// A+ ⇒ /main, 1000 ⇒ GET
		Apple a1 = new Apple("A+", 1000);
		Apple a2 = new Apple("A+", 1000);
		
	}
	
}
