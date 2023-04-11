package jp.dcnet.kansuu;
/**
 * 質問８︓バブルソート⽤メソッドを作成してください。
	1. メソッド名︓bubbleSort
	2. 引数１︓intの配列
	3. 戻り値︓ソート済みの配列
	4. 処理内容︓bubbleSortアルゴリズムを⽤い、⼊⼒した引数の配列をソートしてくださ
	い。
 * @author user
 *
 */
public class Q8 {

	public static void main(String[] args) {
		int[] inputnum = new int[] {2,5,7,8,9,4,0,6,8,1};
		Method.printArray(Method.bubbleSort(inputnum));
	}

}
