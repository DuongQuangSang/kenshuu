package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 7
	ある数が素数かどうかを判定するメソッドを作成しなさい。
	このメソッドを使用して 10000 以上 10100 未満の素数をすべて表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q7 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int x = scan.nextInt();scan.close();	

		boolean a = isPrime(x);
		if(a==true) System.out.println("入力された数は素数。");
		else System.out.println("入力された数は素数ではない。");
		System.out.println("---------------------------------------");
		System.out.println("10000 以上 10100 未満の素数をすべて表示する");
		for(int i = 10000; i <= 10100 ; i++) {
			if(isPrime(i)) System.out.print(i + "\t\t");
		}
	}
	
	public static boolean isPrime(int n) {
		if(n < 2) {
			return false;
		} else if (n == 2) {
			return true;
		} else {
			for (int i = 2; i <= n - 1; i++) {
				if(n%i==0) {
					return false;
				}
			}
		}
		return true;
	}
	
}
