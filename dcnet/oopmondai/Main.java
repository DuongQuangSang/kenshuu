package jp.dcnet.oopmondai;

public class Main {

	public static void main(String[] args) {
		Animal cat = new Animal("cat");
		System.out.println(new Animal("cat1").getName());
		cat.getName();
		cat.sayHello();
	}

}
