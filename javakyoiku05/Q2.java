package javakyoiku05;
/**
 * 設問２︓5の階乗を求める(for)。
 * @author user
 *
 */
public class Q2 {

	public static void main(String[] args) {
		int n = 1;
		for(int i = 1; i <= 5; i++) {
			n *= i;
		}
		System.out.print(n);
	}

}