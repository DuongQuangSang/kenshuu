package jp.kitako.renshuumondaishuu.class1;
/**
 * 以下の Dog クラスを使用して、
	class Dog {
	    private String Name;
	
	    public void SetName( String nm )
	    {
	        Name = nm;
	    }
	
	    public void ShowProfile()
	    {
	        System.out.println( "名前は、" + Name + "です。" );
	    }
	}
	次のプログラムを作成しなさい。
	Dog クラスのインスタンスを作成する。
	SetName メソッドで名前を設定する。
	ShowProfile メソッドで名前を表示する
 * @author user
 *
 */
public class Dog {
	private String name;
	private int age;
	private String breed; // 犬種を保持するメンバー変数。（ String 型）
	
	public Dog(String breed) {
		this.breed = breed;
	}
	
	public void setName(String nm) {
		name = nm;
	}
	
	public void setAge(int ag) {
		age = ag;
	}
	
	public void showProfile()
    {
        System.out.println( "名前は、" + name + "です。" );
        System.out.println( "年齢は、" + age + "です。" );
        System.out.println("犬種は、" + breed + "です。" );
    }
}

