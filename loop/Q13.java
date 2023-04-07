package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 13
	ストライク・カウントを数えるプログラムを作成しなさい。
	.１球ごとにストライクかボールかを入力する。
	.３ストライクまたは４ボールになったら入力を止め、ストライクとボールのカウントを表示する。
 * @author user
 *
 */
public class Q13 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int strike = 0;
		int ball = 0;
		while (strike < 3 && ball < 4) {
			System.out.println("ストライク=1 or ボール=2 ？");
			int n = scan.nextInt();
			if(n == 1) {
				strike+=1;
			}
			if (n == 2) {
				ball+=1;
			} 
		}
		scan.close();
		System.out.println(ball + "ボール," + strike + "ストライク");
	}

}
