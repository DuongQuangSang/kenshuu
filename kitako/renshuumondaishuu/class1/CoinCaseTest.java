package jp.kitako.renshuumondaishuu.class1;

import java.util.Scanner;

/**
 * CoinCase クラスのインスタンスを作成する。
	種類と枚数を入力し、AddCoins メソッドで硬貨を追加することを 10 回繰り返す。
	各硬貨が何枚あるかを表示する。
	総額を表示する。
	※ 硬貨の種類は 500 円なら整数の 500、100 円なら 100 とし、該当しない数が指定された場合には無視する。
 * @author user
 *
 */
public class CoinCaseTest {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		/*CoinCase クラスのインスタンスを作成する。*/
		CoinCase coincase = new CoinCase(); 
		for(int i = 1; i <= 10; i++) {
			System.out.println("硬貨を追加することを "+i+" 回");
			System.out.println("硬貨の種類を入力する");
			int shurui = scan.nextInt();
			System.out.println("硬貨の枚数を入力する");
			int mai = scan.nextInt();
			coincase.addCoins(shurui, mai);
		}
		scan.close();
		System.out.println("500円は " + coincase.getCount(500) + "枚ある");
		System.out.println("100円は " + coincase.getCount(100) + "枚ある");
		System.out.println("50円は " + coincase.getCount(50) + "枚ある");
		System.out.println("10円は " + coincase.getCount(10) + "枚ある");
		System.out.println("5円は " + coincase.getCount(5) + "枚ある");
		System.out.println("1円は " + coincase.getCount(1) + "枚ある");
		System.out.println("硬貨は "+ coincase.getCount());
		System.out.println("500円硬貨の総額は "+ coincase.getAmount(500));
		System.out.println("総額は "+ coincase.getAmount());
	}

}
