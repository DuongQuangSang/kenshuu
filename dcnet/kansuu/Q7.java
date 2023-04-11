package jp.dcnet.kansuu;
/**
 * 質問７︓以下静的なメソッドを定義してください。
	1. メソッド名︓trim
	2. 引数１︓charの配列
	3. 戻り値︓charの配列
	4. 処理内容︓引数１のcharの配列先頭と末尾の空⽩⽂字列を削除してください。
 * @author user
 *
 */
public class Q7 {

	public static void main(String[] args) {
		 char[] input = new char[] {' ', ' ', 'A', 'b', ' ', ' ', 'C', ' '};
		 Method.printArray(Method.trim(input));
	}

}
