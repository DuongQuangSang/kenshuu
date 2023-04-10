package jp.kitako.renshuumondaishuu.loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 5
	整数を 10 回入力し、平均値を求めるプログラムを作成しなさい。
	※ 計算は整数で行い、小数点以下は切り捨ててよい。
 * @author user
 *
 */
public class Q5 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int sum = 0;	
		for(int i = 0; i < 10; i++) {
			int n = scan.nextInt();
			sum+=n;
		}
		scan.close();
		System.out.println( "平均値は" + sum/10);
	}
}
