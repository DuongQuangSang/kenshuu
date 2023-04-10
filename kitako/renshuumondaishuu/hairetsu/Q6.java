package jp.kitako.renshuumondaishuu.hairetsu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 次のコードに追加し、九九表を表示するプログラムを完成させなさい。
 * @author user
 *
 */
public class Q6 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader( System.in ) );
		int kuku[][] = new int[9][];
		//配列 kuku に値を代入する
		
		for( int i = 0 ; i < 9 ; i++ ) {
			kuku[i] = new int[9];
			for(int j = 0; j < 9; j++) {
				kuku[i][j] = (i + 1) * (j + 1);
			}
		}
		for( int i = 0 ; i < 9 ; i++ ) {
			for( int j = 0; j < 9; j++) {
				System.out.printf( " %2d", kuku[i][j] );
			}
			System.out.println("");
		}
	}

}
