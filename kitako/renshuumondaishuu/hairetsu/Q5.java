package jp.kitako.renshuumondaishuu.hairetsu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 練習問題 5 - 5
	次のコードに追加し、入力された数値を 16 桁の２進数で表示するプログラムを完成させなさい。
	BufferedReader br = new BufferedReader(
	                        new InputStreamReader( System.in ) );
	int value = Integer.parseInt( br.readLine() );
	int binary[] = new int[16];
	// 配列 binaryに0か1を代入する
	for( int i = 0 ; i < 16 ; i++ )
	    System.out.print( binary[i] );
 * @author user
 *
 */
public class Q5 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(
        new InputStreamReader( System.in ) );
		System.out.println("数値を入力する");
		int value = Integer.parseInt( br.readLine() );
		
		int binary[] = new int[16];
		
		for( int i = 15 ; i >= 0 ; i--) {
		    binary[i] = value % 2;
		    value /= 2;
		}
		
		for( int i = 0 ; i < 16 ; i++ )
		System.out.print( binary[i] );

	}

}
