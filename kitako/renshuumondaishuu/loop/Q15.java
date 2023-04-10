package jp.kitako.renshuumondaishuu.loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 15
	入力された数が素数かどうかを判定するプログラムを作成しなさい。
	※ 判定する数は 4 以上としてよい。
 * @author user
 *
 */
public class Q15 {

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int n = scan.nextInt();
		scan.close();
		if(n < 2) {
			System.out.println("入力された数は素数ではない。");
		} else if (n == 2) {
			System.out.println("入力された数は素数。");
		} else {
			for (int i = 2; i <= n - 1; i++) {
				if(n%i==0) {
					System.out.println("入力された数は素数ではない。");
					break;
				} else {
					System.out.println("入力された数は素数。");
					break;
				}
			}
		}
	}	

}
