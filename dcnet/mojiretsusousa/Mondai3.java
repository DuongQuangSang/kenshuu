package jp.dcnet.mojiretsusousa;

import java.nio.charset.StandardCharsets;

/**
 * 質問３︓Javaには、すべての⽂字コードはUTF-8であり。⽇本語（全⾓⽂字）の場合１⽂
	字 = 3バイト。以下⽂字列のバイト数と桁数を求めてください。
 * @author user
 *
 */
public class Mondai3 {

	public static void main(String[] args) {
		String value = "abced12345あいうえお１２３４５";
		int bytesuu = value.getBytes(StandardCharsets.UTF_8).length;
		int digitsuu = value.length();

		System.out.println("バイト数は " + bytesuu);
		System.out.println("桁数は " + digitsuu);

	}

}
