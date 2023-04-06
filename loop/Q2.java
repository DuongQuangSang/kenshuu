package loop;
/**
 * 練習問題 4 - 2
	九九、三の段（ 3 ～ 27 の 3 の倍数）を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q2 {

	public static void main(String[] args) {
		System.out.println("九九、三の段（ 3 ～ 27 の 3 の倍数");
		for( int i = 1 ; i <= 9 ; i++ ) {
			System.out.print(( 3 * i ) + " ");
		}
	}

}
