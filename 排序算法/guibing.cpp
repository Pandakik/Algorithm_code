public class MergeSortAl {
	public static void main(String[] args) {
		int[] a = {3,2,7,4,8,6,1,9};
		int len = a.length;
		MergeSort(a,0,len-1);
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i]);
		}
	}
	private static void MergeSort(int[] a, int low, int high) {
 
		int mid = (low+high)/2;
        if(low<high){
        	MergeSort(a,low,mid);
        	MergeSort(a,mid+1,high);
            //左右归并
            merge(a,low,mid,high);
        }
        
	}
	private static void merge(int[] a, int low, int mid, int high) {
		// TODO Auto-generated method stub
		int[] temp = new int[high-low+1];
		int i = low;
		int j = mid+1;
		int k = 0;
		//把较小的数先移动到新数组中
		while (i <= mid && j <= high) {
			if (a[i] < a[j]) {
				temp[k++] = a[i++];
			}else {
				temp[k++] = a[j++];
			}
		}
		//把左边剩余元素移入数组
		while(i <= mid) {
			temp[k++] = a[i++];
		}
		//把右边的剩余元素移入数组
		while(j <= high) {
			temp[k++] = a[j++];
		}
		//把新数组覆盖原来的数组
		for(int x = 0;x < temp.length;x++) {
			a[x+low] = temp[x];
		}
	}
}