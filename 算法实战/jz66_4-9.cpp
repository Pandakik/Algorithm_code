class Solution {
public:
    vector<int> constructArr(vector<int>& a) {
        int n = a.size(), right = 1;    
        vector<int> B(n,1);              //����һ���������       
        for(int i = 1; i < n ; ++i)         
            B[i] = B[i-1] * a[i-1];      //��ʱB[i]��¼i��ߵĳ˻�,B[0] = 1
        for(int i = n-2 ; i >= 0 ; --i)     
        {
            right *= a[i+1];             //right��¼i�ұߵĳ˻�
            B[i] = B[i] * right;         //��� = ��߳˻�*�ұ߳˻�
        }           
        return B;
    }
};

