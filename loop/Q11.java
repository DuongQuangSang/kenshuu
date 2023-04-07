package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 11
	個数を示す数値を入力し、その個数分だけ 0 ～ 9 の数字を表示するプログラムを作成しなさい。数字は 0, 1, 2, 3, , の順に表示し、9 の次は 0 に戻るものとします。
	例：14
	01234567890123
 * @author user
 *
 */
public class Q11 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("個数を示す数値を入力する");
		int n = scan.nextInt();
		scan.close();
		for(int i = 0; i < n; i++) {
			System.out.print(i%10+" ");
		}
		
	}

}
