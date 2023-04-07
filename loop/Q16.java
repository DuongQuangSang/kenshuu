package loop;
/**
 * 練習問題 4 - 16
	2 以上の数値を入力し、素因数分解した結果を表示しなさい。
	例：20100
	2 2 3 5 5 67
 * 
 */
import java.util.Scanner;

public class Q16 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("数値を入力する");
		int n = scan.nextInt();
		scan.close();
		int i = 2;
		while(n > 1) {
			if(n%i==0) {
				System.out.print(i + " ");
		        n /= i;
			} else {
				i++;
			}
		}
	}

}
