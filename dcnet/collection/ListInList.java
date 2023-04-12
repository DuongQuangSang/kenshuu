package jp.dcnet.collection;

/**
 * 多次元の配列を作成可能ですが、多次元のリストも作成可能。
 */
import java.util.ArrayList;
import java.util.List;

public class ListInList {

	public static void main(String[] args) {
		List<List<String>> list2d = new ArrayList<>();
		List<String> row1 = new ArrayList<>();
		List<String> row2 = new ArrayList<>();
		row1.add("1");
		row1.add("2");
		row2.add("1");
		row2.add("2");
		row2.add("3");
		row2.add("4");
		list2d.add(row1);
		list2d.add(row2);
		System.out.println(list2d);//[[1, 2]]

	}

}
