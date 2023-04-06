package javakyoiku05;
/**
 * 配列を昇順でソートする（java.util等メソッド利⽤禁⽌）。
 * @author user
 *
 */
public class Q7 {

	public static void main(String[] args) {
		int[] array = {1, 2, 6, 7, 9, 6, 2, 1};
		for(int i = 0; i < array.length; i++) {
			for(int j = i + 1; j < array.length; j++) {
				if(array[i] > array[j]) {
					int temp = array[i];
					array[i] = array[j];
					array[j] = temp;
				}
			}
		}
		
		for(int i = 0; i < array.length; i++) {
			System.out.println("配列を昇順でソート: " + array[i]);
		}
	}

}
