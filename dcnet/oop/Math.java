package jp.dcnet.oop;
/**
 * 質問２︓Mathクラスを作成してください。以下メソッドを定義します。
	1. 配列のMAXを求める静的メソッドを定義。（引数は int 配列）
	2. 配列のMINを求める静的メソッドを定義。（引数は int 配列）
	3. 配列の平均値を求める静的メソッドを定義。（引数は int 配列）
	4. mainメソッドで上記それぞれメソッドを呼び出してください。
 * @author user
 *
 */
public class Math {
	public static int max(int[] input) {
		int max = 0;
		for(int i : input) {
			if(i > max) {
				max = i;
			}
		}
		return max;
	}
	
	public static int min(int[] input) {
		int min = input[0];
		for(int i = 1; i < input.length; i++) {
			if(input[i] < min) {
				min = input[i];
			}
		}
		return min;
	}
	
	public static int avg(int[] input) {
		int avg = 0;
		for(int i : input) {
			avg+=i;
		}
		return avg/input.length;
	}
}
