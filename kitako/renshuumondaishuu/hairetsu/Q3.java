package jp.kitako.renshuumondaishuu.hairetsu;

import java.util.Scanner;

/**
 * 練習問題 5 - 3
	次のプログラムを作成しなさい。
	10 個の数値を入力する。
	入力された数値を偶数と奇数に分類して表示する。
	表示例：
	偶数：42 54 32 8
	奇数：7 35 71 13 21 45
 * @author user
 *
 */
public class Q3 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("10個の数値を入力する");
		int [] array = new int[10];
		for(int i = 0; i < array.length; i++) {
			array[i] = scan.nextInt();
		}
		scan.close();
		System.out.print("偶数：");
		for(int i = 0; i < array.length; i++) {
			if(array[i]%2==0) System.out.print(array[i] + "\t");
		}
		System.out.println("");
		System.out.print("奇数：");
		for(int i = 0; i < array.length; i++) {
			if(array[i]%2!=0) System.out.print(array[i] + "\t");
		}
	}

}
