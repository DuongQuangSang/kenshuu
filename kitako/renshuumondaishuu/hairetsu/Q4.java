package jp.kitako.renshuumondaishuu.hairetsu;

import java.util.Scanner;

/**
 * 練習問題 5 - 4
	数値を繰り返して入力し、合計が 100 を超えた場合、または入力が 10 回行われた場合
	入力を止め入力された数値をすべて表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q4 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int sum = 0;
		int count = 0;
		int [] array = new int[11];
		for(int i = 0; i < array.length; i++) {
			array[i] = scan.nextInt();
			sum+=array[i];
			count+=1;
			if(sum>=100||count>9) break;
		}
		scan.close();
		for(int i = 0; i < count; i++) {
			System.out.print(array[i] + "\t\t");
		}

	}

}
