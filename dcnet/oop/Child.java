package jp.dcnet.oop;

public class Child extends Parent{
	
	public Child() {
		super();
		
	}
	
	public void ruxx() {
		
		this.saka();
		super.saka();
		
	}

	@Override
	public void saka() {
		System.out.println("No.11........");
	}

	@Override
	public void hello() {
		System.out.println("child method");
	}
	
	
}
