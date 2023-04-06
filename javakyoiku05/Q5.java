package javakyoiku05;
/**
 * 質問５︓質問３の配列に値「７」のインデックスを求む。
 * @author user
 *
 */
public class Q5 {

	public static void main(String[] args) {
		int[] array = {1, 2, 6, 7, 9, 6, 2, 1};
		for(int i = 0; i < array.length; i++) {
			if(array[i] == 7) {
				System.out.println("配列に値「７」のインデックス: " +" array["+ i +"]");
			}
		}
	}

}
