package jp.kitako.renshuumondaishuu.loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 6
	整数、0 か 1 を 10 回入力する
	これを対戦成績と考え、0 を負け、1 を勝ちとして、勝ちの総数、負けの総数を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q6 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int sum = 0;	
		for(int i = 0; i < 10; i++) {
			int n = scan.nextInt();
			if(n==1) sum+=1;
		}
		scan.close();
		System.out.println( "勝ちは" + sum + "回、負けは" + ( 10 - sum ) + "回" );
	}

}
