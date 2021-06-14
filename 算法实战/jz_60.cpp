#include<iostream>
#include<vector>
#include<math.h>
#include<stdlib.h>
#include<string.h>
using namespace std;
class Solution {
public:
    vector<double> dicesProbability(int n) {
        int dp[15][70];
        memset(dp,0,sizeof(dp));
        for(int i = 1;i<=6;i++)
             dp[1][i] = 1;
        for(int i = 1; i <= n;i++)
            for(int j = 1;j<i*6;j++)
                for(int cur = 1;cur<=6;cur++)
                {
                    if(j-cur<0)
                    break;
                    dp[i][j] += dp[i-1][j-cur];
                }
        int all = pow(n,6);
        vector<double> ret;
        for(int i = n;i<=n*6;i++)
            ret.push_back(dp[n][i]*1.0/all);


        return ret;
    }

}; 

/*
class Solution {
public:
    vector<double> twoSum(int n) {
        int dp[15][70];
        memset(dp, 0, sizeof(dp));
        for (int i = 1; i <= 6; i ++) {
            dp[1][i] = 1;
        }
        for (int i = 2; i <= n; i ++) {
            for (int j = i; j <= 6*i; j ++) {
                for (int cur = 1; cur <= 6; cur ++) {
                    if (j - cur <= 0) {
                        break;
                    }
                    dp[i][j] += dp[i-1][j-cur];
                }
            }
        }
        int all = pow(6, n);
        vector<double> ret;
        for (int i = n; i <= 6 * n; i ++) {
            ret.push_back(dp[n][i] * 1.0 / all);
        }
        return ret;
    }
}; 

作者：huwt
链接：https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof/solution/nge-tou-zi-de-dian-shu-dong-tai-gui-hua-ji-qi-yo-3/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

*/