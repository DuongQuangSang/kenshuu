package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 5
	サイズを示す数値と、表示する文字を引数とし、三角形を表示するメソッドを作成しなさい。
	このメソッドを使用して、サイズと文字の異なる３つの三角形を表示しなさい。
	※ サイズを示す引数は int 型、表示する文字の引数は char 型にする。
 * @author user
 *
 */
public class Q5 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("サイズを示す数値を入力する");
		int x = scan.nextInt();scan.nextLine();
		char y = scan.next().charAt(0);scan.close();
		printTriangle(x,y);
	}
	
	public static void printTriangle(int n, char l) {
		for(int i = 1; i <= n; i++) {
			for(int j = 0; j < i; j++) {
				System.out.print(l);
			}
			System.out.println("");
		}
	}
	
}
