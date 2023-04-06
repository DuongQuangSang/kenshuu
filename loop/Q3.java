package loop;
/**
 * 練習問題 4 - 3
	2 の 1 乗から 8 乗までを計算し表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q3 {

	public static void main(String[] args) {
		int x = 1;

		for( int n = 1 ; n <= 8 ; n++ )
		{
		    x *= 2;
		    System.out.println( "2の" + n + "乗 = " + x );
		}
	}

}
