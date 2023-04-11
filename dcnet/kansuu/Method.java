package jp.dcnet.kansuu;
/**
 * 質問６-０
 * @author user
 *
 */
public class Method {
/**
 * 配列は直接に印刷できません。下記メソッドを利⽤して、配列をprintしま
	す。以下メソッドを呼び出してください。
 * @param is
 */
	public static void printArray(int[] objs) {
		 if(objs == null) {
			 System.out.println("null");
			 return;
		 }
		 String prefix = "";
		 StringBuilder sb = new StringBuilder();
		 sb.append("[");
		 for(Object obj : objs) {
			 sb.append(prefix);
			 sb.append(String.valueOf(obj));
			 prefix = ", ";
		 }
		 sb.append("]");
		 System.out.println(sb.toString());
	}
	
	public static void printArray(char[] objs) {
		 if(objs == null) {
			 System.out.println("null");
			 return;
		 }
		 char prefix = ' ';
		 StringBuilder sb = new StringBuilder();
		 sb.append("[");
		 for(Object obj : objs) {
			 sb.append(prefix);
			 sb.append(String.valueOf(obj));
			 prefix = ',';
		 }
		 sb.append("]");
		 System.out.println(sb.toString());
	}
	
	
	/**
	 * 質問６-１︓以下静的なメソッドを定義してください。
	 * 1. メソッド名: megerArray
		2. 引数１︓intの配列 left
		3. 引数２︓intの配列 right
		4. 戻り値︓intの配列
		5. 処理内容︓引数left と 引数right をマージして、新しい配列を作成して返却する。
	 * @param left
	 * @param right
	 * @return
	 */
	public static int[] megerArray (int[] left, int[]right) {
		int [] result = new int [left.length + right.length];
		int i = 0, j = 0, k = 0; 

	    while (i < left.length && j < right.length) {
	        if (left[i] < right[j]) {
	            result[k] = left[i];
	            i++;
	        } else {
	            result[k] = right[j];
	            j++;
	        }
	        k++;
	    }

	    while (i < left.length) {
	        result[k] = left[i];
	        i++;
	        k++;
	    }
	    while (j < right.length) {
	        result[k] = right[j];
	        j++;
	        k++;
	    }
	    return result;
	}
	
	/**
	 * 質問６-２︓以下静的なメソッドを定義してください。
		1. メソッド名: subArray
		2. 引数１︓intの配列 array
		3. 引数２︓開始のstartIndex
		4. 引数３︓⻑さlength
		5. 戻り値︓intの配列
		6. 処理内容︓startIndexからstartIndex + lengthまでサブ配列を取得する
	 * @param array
	 * @param begin
	 * @param length
	 * @return
	 */
	public static int[] subArray(int[]array, int begin, int length) {

		int[] subarray = new int[length];
		for(int i = 0; i < length; i++) {
				subarray[i] = array[begin];
				begin++;
		}
		return subarray;
	}
	
	public static char[] subArray(char[]array, int begin, int length) {

		char[] subarray = new char[length];
		for(int i = 0; i < length; i++) {
				subarray[i] = array[begin];
				begin++;
		}
		return subarray;
	}
	
	public static char[] trim(char[]array) {
		int begin = 0;
		int length = 0;
		for(int i = 0; i < array.length; i++) {
			if(array[i] == ' ') {
				begin =+1;
			}
		}
		
		for(int i = array.length - 1; i >= 0; i--) {
			if(array[i] == ' ') {
				length = i;
				break;
			}
		}
		
		char[] trim = new char[length];
		for(int i = 0; i < length; i++) {
				trim[i] = array[begin];
				begin++;
		}
		return trim;	
	}
	
	public static int[] bubbleSort(int[]array) {
		for(int i = 0; i < array.length - 1; i++)
			for(int j = 0; j < array.length-i-1;j++) {
				if(array[j]>array[j+1]) {
					int temp = array[j];
					array[j] = array[j+1];
					array[j+1] = temp;
				}
		}
		return array;
		
	}
}

