package jp.dcnet.kansuu;
/**
 * 質問６-１︓以下静的なメソッドを定義してください。
	1. メソッド名: megerArray
	2. 引数１︓intの配列 left
	3. 引数２︓intの配列 right
	4. 戻り値︓intの配列
	5. 処理内容︓引数left と 引数right をマージして、新しい配列を作成して返却する。
 * @author user
 *
 */
public class Q6_1 {

	public static void main(String[] args) {
		 int[] left = {1,2,3,4};
		 int[] right = {5,6,7,8};
		 Method.printArray(Method.megerArray(left,right));
	}

}
