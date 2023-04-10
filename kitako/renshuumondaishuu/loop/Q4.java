package jp.kitako.renshuumondaishuu.loop;
/**
 * 練習問題 4 - 4
	7 の階乗を計算し、表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q4 {

	public static void main(String[] args) {
		int n = 1;
		for(int i = 1; i <= 7; i++) {
			n *= i;
		}
		System.out.println("7 の階乗を計算は" +n);
	}

}
