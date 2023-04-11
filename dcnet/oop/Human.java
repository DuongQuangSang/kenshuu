package jp.dcnet.oop;
/**
 * 
 * @author user
 *
 */
public class Human {
	public String name;
	protected int age;
	private int money; 
	
	public Human() {
	}

	public Human(String name, int age, int money) {
		this.name = name;
		this.age = age;
		this.money = money;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	public void sleep() {
		System.out.println("Sleep");
	}

}
