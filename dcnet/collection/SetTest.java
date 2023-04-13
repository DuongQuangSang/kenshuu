package jp.dcnet.collection;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class SetTest {

	public static void main(String[] args) {
		Set<String> setA = new HashSet<String>(); //EnumSet(), LinkedHashSet(), TreeSet()
		Set<String> setB = new HashSet<String>();
		setA.add("Java");
        setA.add("Python");
        setA.add("Java");
        setA.add("PHP");
        System.out.println(setA.size()); // 3
        System.out.println(setA); // Java  Python  Java  PHP
        System.out.println(setA.contains("Java")); //true
        System.out.println(setA.contains("C++")); //false
        System.out.println("----------------------------------------");
        setB.add("Java1");
        setB.add("Python1");
        setB.add("Java1");
        setB.add("PHP1");
        
        setA.addAll(setB);
        System.out.println(setA); // Java  Python  Java  PHP
        System.out.println("----------------------------------------");
        System.out.println("loop setA by Iterator :");
        Iterator<String> iterator = setA.iterator();
        while (iterator.hasNext()) {
            System.out.println((String) iterator.next());
        }
        System.out.println("----------------------------------------");
        System.out.println("loop setA by for-each :");
        for (String element : setA) {
            System.out.println(element);
        }
        System.out.println("----------------------------------------");
        setA.remove("PHP");
        System.out.println(setA);
        System.out.println("----------------------------------------");
        List<String> listA = new ArrayList<String>();
        // setA -> listA
        listA.addAll(setB);
        System.out.println(setB);
//     setA.clear();
//     setA.isEmpty()
	}

}
