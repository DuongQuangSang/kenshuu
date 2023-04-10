package jp.kitako.renshuumondaishuu.class2;
/**
 * 以下の Animal クラスを継承したクラス（派生クラス）、Cat を作成しなさい。
	Cat はメンバー・メソッド Sleep を持つ。
	Sleep を実行すると“スースー”という文字列を表示する。
 * @author user
 *
 */
public class Animal {
	public String name;
	public int age;
	
	public void showProfile() {
		System.out.println( "名前は、" + name + "、" + age + "歳です。" );
	}
	
	public void speak() {
		System.out.println( "......" );
	}
}
