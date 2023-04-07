package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 12
	数値を繰り返し入力し、合計が 100 を超えたら入力を止めて合計を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q12 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int sum = 0;
		while(sum <= 100) {
			System.out.println("数値を入力する");
			int n = scan.nextInt();
			sum += n;
		}
		scan.close();
		System.out.print("合計は " + sum);

	}

}
