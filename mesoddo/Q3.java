package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 3
	２つの整数の大きい方を選ぶメソッドを作成しなさい。２つの int 型引数を取り、大きい方の数値を戻り値として返すこと。
	また、このメソッドを使用して、int 型の変数 x、y、z にそれぞれ数値を入力し、最も大きい数値を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q3 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int x = 0;
		int y = 0;
		int z = 0;
		int n = bigNum(x,y);
		System.out.print("2つの整数の最も大きい数値 : " + n);
		System.out.println("");
		int m = bigNum(x,y,z);
		System.out.print("3つの整数の最も大きい数値 : " + m);
		scan.close();
	}
	
	public static int bigNum(int x, int y) {
		@SuppressWarnings("resource")
		Scanner scan = new Scanner(System.in);
		System.out.println("2つの整数を入力する");
		int x1 = scan.nextInt();
		int y1 = scan.nextInt();
		if(x1 > y1) return x1;
		else return y1;
	}
	
	public static int bigNum(int x, int y, int z) {
		@SuppressWarnings("resource")
		Scanner scan = new Scanner(System.in);
		System.out.println("3つの整数を入力する");
		int x1 = scan.nextInt();
		int y1 = scan.nextInt();
		int z1 = scan.nextInt();
		if(x1 > y1 && x1 > z1) return x1;
		else if (y1 > x1 && y1 > z1) return y1;
		else return z1;
	}

}
