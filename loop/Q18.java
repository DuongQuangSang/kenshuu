package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 18
	数値を繰り返して入力し、0 が入力されたら入力を止め、それまでの合計を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q18 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int sum = 0;
		System.out.println("数値を入力する");
		int n = scan.nextInt();
		while(n != 0) {
			sum+=n;
			n = scan.nextInt();
		}
		scan.close();
		System.out.println("合計は" + sum);

	}

}
