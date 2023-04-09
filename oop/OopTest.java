package jp.dcnet.oop;

public class OopTest {

	public static void main(String[] args) {

		Human human = new Human("Sang", 30,300000);
		human.sleep();
		System.out.println(human.getName());
		System.out.println(human.getAge());
		System.out.println(human.getMoney());
		
		int[] input = {1,2,4,5,6,4,3,6};
		int max = Math.max(input);
		System.out.println("配列のMAX \t" + max);
		int min = Math.min(input);
		System.out.println("配列のMIN \t" + min);
		int avg = Math.avg(input);
		System.out.println("配列のAVG \t" + avg);
	}

}
