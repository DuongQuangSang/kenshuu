package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 10
	個数を示す数値を入力し、その個数分だけ‘*’を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q10 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("個数を示す数値を入力する");
		int n = scan.nextInt();
		scan.close();
		for(int i = 0; i < n; i++) System.out.print("*");
	}

}
