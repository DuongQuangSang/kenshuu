package jp.dcnet.oop;

public class Clild extends Parent{
	
	public Clild() {
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

}
