package jp.dcnet.kansuu;
/**
 * 質問６-２︓以下静的なメソッドを定義してください。
	1. メソッド名: subArray
	2. 引数１︓intの配列 array
	3. 引数２︓開始のstartIndex
	4. 引数３︓⻑さlength
	5. 戻り値︓intの配列
	6. 処理内容︓startIndexからstartIndex + lengthまでサブ配列を取得する
 * @author user
 *
 */
public class Q6_2 {

	public static void main(String[] args) {
		int[] array = {1, 2, 3, 4};
		Method.printArray(Method.subArray(array, 1, 2));
	}

}
