package jp.dcnet.shinmai;
/**
 * 設問１︓1から100までの偶数の和を求める(for + if)。
 * @author user
 *
 */
public class Q1 {

	public static void main(String[] args) {
		int sum = 0;
		for(int i = 1; i <= 100; i++) {
			if(i%2==0) {
				sum += i;
			}
		}
		System.out.println(sum);
	}

}
