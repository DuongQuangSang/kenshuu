package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 1
	整数の 2 乗を計算するメソッドを作成しなさい。１つの int 型引数を取り、結果を int 型の戻り値として返すこと。
	また、メソッドの動作を検証できるようにプログラムを作成しなさい。
 * @author user
 *
 */
public class Q1 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("整数を入力する");
		int n = scan.nextInt();scan.close();
		int num = square(n);
		System.out.print(n+"の2乗を計算する :" + num);
	}
	
	public static int square(int a) {
		return a * a;
	}
}
