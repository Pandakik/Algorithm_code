class Solution {
public:
    vector<int> constructArr(vector<int>& a) {
        int n = a.size(), right = 1;    
        vector<int> B(n,1);              //定义一个输出数组       
        for(int i = 1; i < n ; ++i)         
            B[i] = B[i-1] * a[i-1];      //此时B[i]记录i左边的乘积,B[0] = 1
        for(int i = n-2 ; i >= 0 ; --i)     
        {
            right *= a[i+1];             //right记录i右边的乘积
            B[i] = B[i] * right;         //结果 = 左边乘积*右边乘积
        }           
        return B;
    }
};

