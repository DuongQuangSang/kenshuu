package jp.dcnet.oopmondai;
/**
 * 質問１３︓クラス「Animal」を定義して、インスタンス化しオブジェクト cat を作成しま
	す。変数catのsayHello()メソッドを呼び出してください。
 * @author user
 *
 */
public class Animal {
	private int age;
	private String name;
	private String breed;
	
	public Animal(String name) {
		this.name = name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void sayHello() {
		System.out.println("Hello !!!");
		
	}
}
