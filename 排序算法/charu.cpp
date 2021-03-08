//插入排序
public class InsertionSortAl {
	public static void main(String[] args) {
		int[] a = {3,2,7,4,8,6,1,9};
		insertionSort(a);
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i]);
		}
    }
 
	private static void insertionSort(int[] a) {
		if (a.length == 0 || a.length == 1) {
			return;
		}
		for(int i = 1;i < a.length;i++) {
			int preIndex = i-1;
			int cur = a[i];
			//比较前一个节点与当前值,若前一个节点大,则将前一个节点往尾方向移动一个位置,然后将preIndex往头方向移动
			while(preIndex >= 0 && a[preIndex] > cur) {
				a[preIndex+1] = a[preIndex];
				preIndex--;
			}
			a[preIndex+1] = cur;
		}
	}
}