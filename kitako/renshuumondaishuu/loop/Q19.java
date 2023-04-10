package jp.kitako.renshuumondaishuu.loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 19
	数値を繰り返して入力し、0 が入力されたら入力を止め、平均値を表示するプログラムを作成しなさい。

	※ 最後に入力された 0 は平均に含めない。
	※ 少なくとも 1 回は入力が行われるものとする。（最初に 0 を入力してはいけない）
 * @author user
 *
 */
public class Q19 {

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
