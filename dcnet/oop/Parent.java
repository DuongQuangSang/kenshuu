package jp.dcnet.oop;

public class Parent {

	private int money;

	private String house;

	public void saka() {

		System.out.println("saka..............");
	}

	@Override
	public String toString() {
		return "Parent [money=" + money + ", house=" + house + "]";
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}
	
	public void hello() {
		System.out.println("parent method");
	}
}
