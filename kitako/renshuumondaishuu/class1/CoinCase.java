package jp.kitako.renshuumondaishuu.class1;
/**
 * 硬貨の入れ物のようなクラス、CoinCase を作成しなさい。
	500 円、100 円、50 円、10 円、5 円、1 円が、それぞれ何枚あるかを管理する。
	AddCoins メソッドで硬貨を追加する。
	引数は硬貨の種類（ int ）と枚数（ int ）。
	GetCount メソッドで、指定した硬貨が、何枚あるかを取得する。
	引数は硬貨の種類（ int ）、戻り値は枚数（ int ）。
	GetAmount メソッドで硬貨の総額を取得する。
	戻り値は硬貨の総額( int )。
 * @author user
 *
 */
public class CoinCase {
	private int yen500 = 0;
	private int yen100 = 0;
	private int yen50 = 0;
	private int yen10 = 0;
	private int yen5 = 0;
	private int yen1 = 0;
	
	public void addCoins (int shurui, int mai) {
		switch (shurui) {
		case 500:
			yen500+=mai;
			break;
		case 100:
			yen100+=mai;
			break;
		case 50:
			yen50+=mai;
			break;
		case 10:
			yen10+=mai;
			break;
		case 5:
			yen5+=mai;
			break;
		case 1:
			yen1+=mai;
			break;
		default:
			break;
		}
	}
	
	public int getCount(int shurui) {
		switch (shurui) {
		case 500:
			return yen500;
		case 100:
			return yen100;
		case 50:
			return yen50;
		case 10:
			return yen10;
		case 5:
			return yen5;
		case 1:
			return yen1;
		default: 
			return 0;
		}
	}
	
	public int getCount() {
		return (yen500 + yen100 + yen50 + yen10 + yen5 + yen1);
	}
	
	public int getAmount() {
		return (yen500*500) + (yen100*100) + (yen50*50) + (yen10*10) + (yen5*5) + (yen1*1);
	}
	
	public int getAmount(int shurui) {
		switch(shurui) {
		case 500:
			return yen500*500;
		case 100:
			return yen100*100;
		case 50:
			return yen50*50;
		case 10:
			return yen10*10;
		case 5:
			return yen5*5;
		case 1:
			return yen1*5;
		default:
			return 0;
		}
	}

}
