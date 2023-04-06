package loop;

import java.util.Scanner;

/**
 * 練習問題 4 - 7
	次のプログラムを作成しなさい。
	巨人、阪神戦で毎回の得点を入力する。（１回～９回）
	入力が終わったら、それぞれの得点とどちらが勝ったかを表示する。
	※ 試合は巨人の先行とする。
 * @author user
 *
 */
public class Q7 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int[] a = new int[9];
		int[] b = new int[9];
		for(int i = 0; i < 9; i++) {
			System.out.print(i+1 + "回表、巨人の得点は？");
			a[i] = scan.nextInt();scan.nextLine();
			System.out.print(i+1+ "回表、阪神の得点は？");
			b[i] = scan.nextInt();
		}
		scan.close();
		int sumA = 0;
		int sumB = 0;
		
		for(int i = 0; i < 9; i++) {
			if(a[i]==1) sumA+=1;
			if(b[i]==1) sumB+=1;
		}
		
		System.out.println("巨人："+sumA+"点, 阪神："+sumB+"点");
		if(sumA>sumB) System.out.println("巨人の勝ち");
		else if(sumB>sumA) System.out.println("阪神の勝ち");
		else System.out.println("どちも");
		

	}

}
