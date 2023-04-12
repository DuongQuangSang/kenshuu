package jp.dcnet.collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ListTest {

	public static void main(String[] args) {
		/**
		 * 型<データ型> 変数名;
			リストはジェネリック対応していますので、使⽤⽅法はダイアモンド演算⼦ <> を使⽤し
			て、インスタンス化する。
		 */
		List<String> list = new ArrayList<>(); // クラス名はまたLinkedList<>()、Vector<>()

		//1. 要素を追加する
		list.add("data1");
		list.add("data2");
		list.add("data3");
		
		//2. 要素を削除する
		list.remove("data3"); // user1 を削除する
		list.clear(); // すべてのエレメントを削除する
		
		list.add("data1");
		list.add("data2");
		list.add("data3");

		//3.要素を検索する
		System.out.println(list.contains("data1"));// true：存在する
		System.out.println(list.indexOf("data2"));// 1
		System.out.println(list.indexOf("data4"));// -1 存在しない
		System.out.println("----------------------------------------");
		
		//4.要素を取り出す
		list.add("data4");
		System.out.println(list.get(2)); // "data3"
		System.out.println("----------------------------------------");
		
		//5.空判断する
		System.out.println(list.isEmpty()); // false
		System.out.println("----------------------------------------");
		
		//6.List ＆ 配列
		System.out.println("List TO 配列");
		
		String[] array = list.toArray(new String[0]); // [0]サイズは０でも問題がありません
		
		for(String i : array) System.out.println(i);
		System.out.println("----------------------------------------");
		System.out.println("配列 TO List");
		
		List<String> list1 = Arrays.asList(array);
		
		for(String e: list1) System.out.println(e);
		
		
		//7.ソート
		System.out.println("----------------------------------------");
		System.out.println("ソート");
		List<String> list2 = new ArrayList<>();
		list2.add("data8");
		list2.add("data5");
		list2.add("data7");
		list2.add("data6");
		Collections.sort(list2);
		System.out.println(list2);
	}

}
