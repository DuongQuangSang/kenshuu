package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 2
	２つの整数の平均を計算するメソッドを作成しなさい。２つの int 型引数を取り、結果を int 型の戻り値として返すこと。
	また、メソッドの動作を検証できるようにプログラムを作成しなさい。
	※ 	平均の計算は整数で行い、小数点以下は切り捨ててよい。
 * @author user
 *
 */
public class Q2 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("2つの整数を入力する");
		int x = scan.nextInt();
		int y = scan.nextInt();scan.close();
		int n = avg(x,y);
		System.out.print("２つの整数の平均は :" + n);
	}
	
	public static int avg(int x, int y) {
		return (x+y)/2;
	}
	
}
