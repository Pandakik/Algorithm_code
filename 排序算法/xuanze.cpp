//选择排序
public class SelectionSortAl {
 
	public static void main(String[] args) {
		int[] a = {3,2,7,4,8,6,1,9};
		selectionSort(a);
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i]);
		}
    }
	private static void selectionSort(int[] a) {
		if (a.length == 0 || a.length == 1) {
			return;
		}
		for(int i = 0;i < a.length;i++) {
			int minIndex = i;                //初始化为排序部分最小值的下标
			for(int j = i+1;j<a.length;j++) {
				if (a[j] < a[minIndex]) {    //如果找到更小的,更新下标
					minIndex = j;             
				}
				swapNum(a,i,minIndex);
			}
		}
	}
	private static void swapNum(int[] a, int i, int minIndex) {
		int temp = a[i];
		a[i] = a[minIndex];
		a[minIndex] = temp;
	}
}