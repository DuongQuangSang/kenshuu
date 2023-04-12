package jp.dcnet.mojiretsusousa;

public class Main {

	public static void main(String[] args) {
		int one = 123456;
		float two = 123456.99999F;
		// one=123,456 two=123,457.00
		System.out.println(String.format("one=%,d two=%,.2f", one, two));
		nullOrEmpty(" ");
		nullOrEmpty("");
		nullOrEmpty("sang");

		System.out.print(stringBuild("duong "));
		System.out.print(stringBuild("quang "));
		System.out.print(stringBuild("sang "));
	}

	// null or Empty
	public static void nullOrEmpty(String value) {
		System.out.println(value.length());
	}

	// Stringのフォーマット
	public static String stringBuild(String value) {
		StringBuilder sb = new StringBuilder();
		sb.append(value);
		String newstr = sb.toString();
		return newstr;
	}
}
