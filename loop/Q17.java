package loop;
/**
 * 練習問題 4 - 17
	九九表（一の段～九の段）を表示するプログラムを作成しなさい。
 * @author user
 *
 */
public class Q17 {

	public static void main(String[] args) {
		for(int i = 1; i <= 9; i++) {
			for(int j = 1; j <= 9; j++) {
				System.out.print(i + "*" + j + "=" + i * j +"\t\t\t");
			}
			System.out.println("");
		}

	}

}
