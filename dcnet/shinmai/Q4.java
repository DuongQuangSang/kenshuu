package jp.dcnet.shinmai;
/**
 * 質問４︓質問３の配列に重複ある要素を探す（要素の表⽰次数集計必要なし）。
 * @author user
 *
 */
public class Q4 {

	public static void main(String[] args) {
		int[] array = {1, 2, 6, 7, 9, 6, 2, 1};
		for(int i = 0; i < array.length; i++) {
			for(int j = i + 1; j < array.length; j++) {
				if(array[i] == array[j]) {
					System.out.println("重複ある要素: " + array[i]);
				}
			}
		}
	}

}
