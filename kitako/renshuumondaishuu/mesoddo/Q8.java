package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 8
	メソッドを再帰的に呼び出すことによって、フィボナッチ数列の n 番目の項を計算するメソッドを作成しなさい。
	最初の２つの項、0 番目を 0、1 番目を 1 とします。
	このメソッドを使用して、11 番目から 20 番目までの項を表示するプログラムを作成しなさい。
	※ フィボナッチ数列：
	それぞれの項がその直前の２つの項の和になっている数列のこと。
	例：0, 1, 1, 2, 3, 5, 8, 13, 21, ...
 * @author user
 *
 */
public class Q8 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int x = scan.nextInt();scan.close();
		System.out.println("フィボナッチ数列の "+x+" 番目の項は"+fibonacci(x));
		System.out.println("---------------------------------------------------------");
		for(int i = 11; i <= 20; i++) {
			System.out.println("フィボナッチ数列の "+i+" 番目の項は"+fibonacci(i));
		}
	}

	public static int fibonacci (int n) {
		if(n == 0 || n == 1) return n;
		if(n>1) {
			return fibonacci(n-2) + fibonacci(n-1);
		}
		return -1;
	}
}
