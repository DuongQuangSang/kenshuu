package jp.dcnet.oop;

public class Matrix {
	private final int[][] data;
	 /** construct method */
	 public Matrix(int[][] data) {
		 this.data = data;
	 }
	 // 行列 ADD
	 public Matrix add(Matrix b) {
		 Matrix c = new Matrix(data);
		 c.data[0][0] = this.data[0][0] + b.data[0][0];
		 c.data[0][1] = this.data[0][1] + b.data[0][1];
		 c.data[1][0] = this.data[1][0] + b.data[1][0];
		 c.data[1][1] = this.data[1][1] + b.data[1][1];
		 return c;
	 }
	 
	 public Matrix add(Matrix a, Matrix b) {
		 Matrix c = new Matrix(data);
		 c.data[0][0] = a.data[0][0] + b.data[0][0];
		 c.data[0][1] = a.data[0][1] + b.data[0][1];
		 c.data[1][0] = a.data[1][0] + b.data[1][0];
		 c.data[1][1] = a.data[1][1] + b.data[1][1];
		 return c;
	 }

}
