package jp.kitako.renshuumondaishuu.hairetsu;

import java.util.Scanner;

/**
 * 練習問題 5 - 2
	次のプログラムを作成しなさい。
	10 個の数値を入力する。
	入力された順番と逆の順番で 10 個の数値を表示する。
 * @author user
 *
 */
public class Q2 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("10個の数値を入力する");
		int [] array = new int[10];
		for(int i = 0; i < array.length; i++) {
			array[i] = scan.nextInt();
		}
		scan.close();
		System.out.println("入力された順番と逆の順番で 10 個の数値を表示する: "); 
		for(int i = array.length - 1; i >= 0 ; i--) {
			System.out.print(array[i]+ "\t");
		}
		
	}

}
