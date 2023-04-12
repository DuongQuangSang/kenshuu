package jp.dcnet.collection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ForEach {

	public static void main(String[] args) {
		List<String> list = new ArrayList<>();
		list.add("data1");
		list.add("data3");
		list.add("data2");
		// リストに各エレメントをアクセスする
		for (String e : list) {
			System.out.println(e);
		}
		System.out.println("-----------------------------");
		Map<String, String> map = new HashMap<>();
		map.put("key1", "value1");
		map.put("key2", "value2");
		map.put("key3", "value3");
		// マップのキーと値をペアでループする
		for (Map.Entry<String, String> entry : map.entrySet()) {
			System.out.println("key= " + entry.getKey() + "; value= " + entry.getValue());
		}
		System.out.println("-----------------------------");
		/**
		 * 反復⼦（イテレータ）を⽤い、コレクションの各エレメントアクセス可能。イテレータは
			以下メソッドを保有します。
			1. hasNext 次のエレメントが有無を判断する。
			2. next 次のエレメントへ移動する。
		 */
		Iterator<String> it = list.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println("-----------------------------");
		Iterator<Map.Entry<String, String>> it1 = map.entrySet().iterator();
		while (it1.hasNext()) { //
			Map.Entry<String, String> entry = it1.next();
			System.out.println("key=" + entry.getKey() + "; value=" + entry.getValue());
		}

	}

}
