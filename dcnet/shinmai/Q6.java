package jp.dcnet.shinmai;
/**
 * 質問６︓任意⾏列（２次元配列）の積を求める。
 * @author user
 *
 */
public class Q6 {

	public static void main(String[] args) {
		int[][] array = {{ 7, 9, 6, 2},{1, 2, 6, 1}};
		int mul = 1;
		for(int i = 0; i < 2; i++) {
			for(int j = 0; j < 4; j++) {
				mul *= array[i][j];
			}
		}
		System.out.print("任意⾏列（２次元配列）の積: " + mul);
	}

}
