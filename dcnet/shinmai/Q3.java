package jp.dcnet.shinmai;
/**
 * 質問３︓配列 {1, 2, 6, 7, 9, 6, 2, 1} の最⼤値、最⼩値、和、平均値を求める
 * @author user
 *
 */
public class Q3 {

	public static void main(String[] args) {
		int[] array = {1, 2, 6, 7, 9, 6, 2, 1};
		System.out.println("配列 {1, 2, 6, 7, 9, 6, 2, 1} の最⼤値: " +maxOfArray(array));
		System.out.println("配列 {1, 2, 6, 7, 9, 6, 2, 1} の最⼩値: " +minOfArray(array));
		System.out.println("配列 {1, 2, 6, 7, 9, 6, 2, 1} の和: " +sumOfArray(array));
		System.out.println("配列 {1, 2, 6, 7, 9, 6, 2, 1} の平均値: " +avgOfArray(array));
	}
	
	public static int maxOfArray (int [] array) {
		int max = 0;
		for(int i = 0; i < array.length; i++) {
			if(array[i]>max) {
				max = array[i];
			}
		}
		return max;
	}
	
	public static int minOfArray (int [] array) {
		int max = 0;
		for(int i = 0; i < array.length; i++) {
			if(array[i]<max) {
				max = array[i];
			}
		}
		return max;
	}
	
	public static int sumOfArray(int [] array) {
		int sum = 0;
		for(int i = 0; i < array.length; i++) {
			sum += i;
		}
		return sum;
	}
	
	public static int avgOfArray(int [] array) {
		int avg = 0;
		for(int i = 0; i < array.length; i++) {
			avg += i;
		}
		return avg/array.length;
	}
}
