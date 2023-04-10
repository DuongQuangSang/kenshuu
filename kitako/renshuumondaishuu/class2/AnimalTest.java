package jp.kitako.renshuumondaishuu.class2;
/**
 * Cat クラスのインスタンスを作成する。
	public のメンバー変数、Name、Age に名前、年齢を設定する。
	ShowProfile を実行する。
	Sleep を実行する。
 * @author user
 *	Animal クラスの配列を作成する。要素数は 4。
	配列の偶数番目（ 0 と 2 ）には Cat クラスのインスタンス、奇数番目（ 1 と 3 ）には Dog クラスのインスタンスを設定する。
	配列の総ての要素の Speak メソッドを実行する。
 */
public class AnimalTest {

	public static void main(String[] args) {
		Animal [] animal = new Animal[4];
		for(int i = 0; i < animal.length; i++) {
			if(i%2==0) animal[i] = new Cat();
			else animal[i] = new Dog();
		}
		
		for(Animal a : animal) {
			a.speak();
		}
		
	}

}
