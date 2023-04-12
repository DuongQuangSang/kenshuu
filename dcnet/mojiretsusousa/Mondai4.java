package jp.dcnet.mojiretsusousa;
/**
 * 各現場は⽂字列に null ⼜は empty 判断要共通メソッドを実装しています。似て
	いるメソッドを実装してください。
 * @author user
 *
 */
public class Mondai4 {

	public static void main(String[] args) {
		System.out.println(nullOrEmpty("")); // Empty -> false
		System.out.println(nullOrEmpty(null)); // null -> true
	}
	
	public static boolean nullOrEmpty(String value) {
		if(value==null) {
			return true;
		}
		return false;
		}

}
