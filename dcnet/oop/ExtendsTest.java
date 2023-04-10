package jp.dcnet.oop;

public class ExtendsTest {

	public static void main(String[] args) {
	
		String name = "sum";
		
		String na = new String("sum");
		
		System.out.println(name == na);
		System.out.println(name.equals(na));
		
		
		float x = 45252.8f;
		int y = (int)x;
		System.out.println(y);
		
		print(new Parent());
		print(new Child());
	}
	
	public static void print(Child v) {
		 v.hello();
		 v.ruxx();
	}
	
	public static void print(Parent p) {
		 p.hello();
	}

}
