package jp.dcnet.mojiretsusousa;

public class Mondai2 {

	public static void main(String[] args) {
		System.out.println(getFileType("c://windows//aa.xlsx")); // xlsx
		System.out.println("----------------");
		 System.out.println(getFileType("c://windows//a a.test")); // test
		System.out.println("----------------");
		 System.out.println(getFileType("c://windows//aa.bb.docx")); // docx
		System.out.println("----------------");
		 System.out.println(getFileType("c://windows//aaaaa")); // Empty
		System.out.println("----------------");
		 System.out.println(getFileType("c://windows//aaaaa"));
	}
	
	public static String getFileType(String path) {
		String[] pathArray = path.split("\\.");

		String res = "";
		
		if(pathArray.length!=0) {
			res = pathArray[pathArray.length-1];
		}
		if(pathArray.length==0) {
			res = "Empty";
		}
		
		return res;
		
	}

}
