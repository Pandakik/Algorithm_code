class Solution {
public:
    vector<int> singleNumbers(vector<int>& nums) {
        int x = 0, y = 0, n = 0, m = 1;
        for(int num : nums)         // 1. �������
            n ^= num;
        while((n & m) == 0)         // 2. ѭ�����ƣ����� m
            m <<= 1;
        for(int num : nums) {       // 3. ���� nums ����
            if(num & m) x ^= num;   // 4. �� num & m != 0
            else y ^= num;          // 4. �� num & m == 0
        }
        return vector<int> {x, y};  // 5. ���س���һ�ε�����
    }
};

