//冒泡排序
public class Main {
	public static void main(String[] args) {
		int[] a = {3,2,7,4,8,6,1,9};
		bubbleSort(a);
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i]);
		}
    }
	private static void bubbleSort(int[] a) {
		if (a.length == 0 || a.length == 1) {
			return;
		}
		for(int i = 0;i < a.length-1;i++) {
			//内循环只需要从0遍历到a.lenght-1-i个,后面的i个已经排序完成
			for(int j = 0;j < a.length-1-i;j++) {
				if (a[j] > a[j+1]) {
					swapNum(a,j,j+1);
				}
			}
		}
	}
	private static void swapNum(int[] a, int j, int i) {
		int tmp = a[j];
		a[j] = a[j+1];
		a[j+1] = tmp;
	}
}