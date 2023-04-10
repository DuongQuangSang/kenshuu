package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 4
	サイズを示す数値（int）を引数とし、何等かの文字で例のような三角形を表示するメソッドを作成しなさい。
	また、このメソッドを使用してサイズ 3、4、5 の３つの三角形を表示するプログラムを作成しなさい。
	例：
	$
	$$
	$$$
 * @author user
 *
 */
public class Q4 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("サイズを示す数値を入力する");
		int x = scan.nextInt();scan.close();
		printTriangle(x);
	}
	
	public static void printTriangle(int n) {
		for(int i = 1; i <= n; i++) {
			for(int j = 0; j < i; j++) {
				System.out.print("*");
			}
			System.out.println("");
		}
	}
	
}
