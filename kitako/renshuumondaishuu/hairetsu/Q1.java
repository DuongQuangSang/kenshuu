package jp.kitako.renshuumondaishuu.hairetsu;

import java.util.Scanner;

/**
 * 練習問題 5 - 1
	次のプログラムを作成しなさい。
	10 個の数値を入力する。
	入力された各々の数値を 2 倍にして表示する。
 * @author user
 *
 */
public class Q1 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("10個の数値を入力する");
		int [] array = new int[10];
		for(int i = 0; i < array.length; i++) {
			array[i] = scan.nextInt();
		}
		scan.close();
		System.out.println("入力された各々の数値を 2 倍に表示する: "); 
		for(int i = 0; i < array.length; i++) {
			array[i] = array[i] * 2;
			System.out.print(array[i]+ "\t");
		}
		
	}

}
