class Solution {
public:
    int cuttingRope(int n) {
        if (n <= 3) return 1 * (n - 1);       //长度小于等于3的情况
        int res = 1;
        //下面两行判断长度不为3的整数倍的情况
        if (n % 3 == 1) res = 4, n -= 4;      //余数为1且总长度大于3，则可以剪切成2*2即4，不能剪切成1*3
        else if (n % 3 == 2) res = 2, n -= 2; //余数为2时表示多余一个2
        while (n) res *= 3 ,n -= 3;           //剩下的就是3的整数倍，全部剪切成3
        return res;
    }
};
