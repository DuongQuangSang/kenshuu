package jp.kitako.renshuumondaishuu.loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 22
	フィボナッチ数列を表示するプログラムを作成しなさい。
	最初の２つの項を 0、1 とし、1000 まで（ 1000 以下の項）を表示するものとします。
	※ フィボナッチ数列：
	それぞれの項がその直前の 2 つの項の和になっている数列のこと。
	例：0, 1, 1, 2, 3, 5, 8, 13, 21, ...
 * @author user
 *
 */
public class Q22 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int n = scan.nextInt();
		scan.close();
		int f0 = 0;
		int f1 = 1;
		int fib = 1;
		if(n == 0 || n ==1) System.out.println("フィボナッチ数列は " + n);
		for(int i = 2; i <= n; i++) {
			f0 = f1;
			f1 = fib;
			fib = f0 + f1;
		}
		System.out.println("フィボナッチ数列は " + fib);

	}

}
