package jp.dcnet.collection;

import java.util.HashMap;
import java.util.Map;

public class MapTest {

	public static void main(String[] args) {
		/**
		 * 型<データ型> 変数名;
			マップを初期するとき、鍵のタイプと値のタイプ指定する必要です。
		 */
		Map<String, Object> map = new HashMap<>();

		//1. 要素を追加する
		map.put("key1", "value1");
		System.out.println(map);//{key1=value1}
		map.put("key1", "value2");
		System.out.println(map);//{key1=value2} 同じキーの場合、値を上書き
		System.out.println("-----------------------------------------------------");

		//2.要素を削除する
		map.put("key1", "value1");
		System.out.println(map);//{key1=value1}
		map.remove("key1");// キーと値のペア両方を削除します。
		System.out.println(map);//{}

		//3.要素を検索する
		map.put("key1", "value1");
		System.out.println(map.containsKey("key1")); // true
		System.out.println(map.containsKey("key2")); // false
		
		//4.空判断する
		System.out.println(map.isEmpty()); // false
	}

}
