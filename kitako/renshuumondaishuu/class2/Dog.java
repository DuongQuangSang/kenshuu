package jp.kitako.renshuumondaishuu.class2;
/**
 * 前問に加え Animal クラスを継承したクラス、Dog を作成しなさい。
	Dog はメンバー・メソッドRunを持つ。
	Run を実行すると“トコトコ”という文字列を表示する。
 * @author user
 *
 */
public class Dog extends Animal{
	public void run() {
		System.out.println("トコトコ");
	}

	@Override
	public void speak() {
		System.out.println("ワンワン");
	}

}
