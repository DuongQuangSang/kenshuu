package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 9
	整数を 10 回入力し、最大値と最小値を求めるプログラムを作成しなさい。
 * @author user
 *
 */
public class Q9 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int[] array = new int[10];
		int max = 0;

		for(int i = 0; i < array.length; i++) {
			System.out.print("自然数（正の整数）を "+ (i+1) + " 回入力する");
			array[i] = scan.nextInt();
			if (array[i] > max) max = array[i];
		}
		int min = array[0];
		for(int i = 1; i < array.length; i++) {

			if (array[i] < min) min = array[i];
		}
		scan.close();
		System.out.println("最大値は " + max);
		System.out.println("最小値は " + min);

	}

}
