package jp.kitako.renshuumondaishuu.mesoddo;

import java.util.Scanner;

/**
 * 練習問題 6 - 6
	九九のひとつの段を表示するメソッドを作成しなさい。何の段（ 1 ～ 9 ）であるかを引数とします。
	このメソッドを使用して、九九表を作成しなさい。
 * @author user
 *
 */
public class Q6 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("何の段（ 1 ～ 9 ）であるかを入力する");
		int x = scan.nextInt();scan.close();
		printTable(x);
	}
	
	public static void printTable(int n) {
		for(int i = 1; i <= 9; i++) {
			System.out.print(n+" * "+i+" = "+n*i+"\t\t");
		}
	}
}
