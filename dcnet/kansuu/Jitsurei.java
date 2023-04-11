package jp.dcnet.kansuu;

public class Jitsurei {

	public static void main(String[] args) {
		float y = gAcceleration(4.5f);
		System.out.print(y);
	}
	
	public static float gAcceleration(float t) {
		return 9.8F * t * t / 2;
	}

}
