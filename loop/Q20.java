package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 20
	サイズを示す数値を入力し、何等かの文字で例のような三角形を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q20 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int n = scan.nextInt();
		scan.close();
		for(int i = 1; i <= n; i++) {
			for(int j = 0; j < i; j++) {
				System.out.print("$");
			}
			System.out.println("");
		}
	}

}
