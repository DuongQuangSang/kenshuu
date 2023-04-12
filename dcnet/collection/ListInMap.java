package jp.dcnet.collection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * マップとリストも組み合わせ可能です。
 * @author user
 *
 */
public class ListInMap {

	public static void main(String[] args) {
		Map<String, List<String>> map = new HashMap<>();
		List<String> list = new ArrayList<>();
		list.add("2019/06/01");
		list.add("2019/06/02");
		list.add("2019/06/03");
		map.put("201906", list);
		List<String> list1 = new ArrayList<>();
		list1.add("2019/07/03");
		list1.add("2019/07/07");
		list1.add("2019/07/02");
		map.put("201907", list1);
		//{201906=[2019/06/01, 2019/06/02, 2019/06/03]}
		System.out.println(map);

	}

}
