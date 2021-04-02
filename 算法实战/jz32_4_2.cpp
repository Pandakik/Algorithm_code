class Solution {
public:
    bool validateStackSequences(vector<int>& pushed, vector<int>& popped) {
        stack<int> res;
        int i = 0;
        for(int num : pushed)
        {
            res.push(num);
            while(!res.empty() && res.top()==popped[i])
            {
                res.pop();
                ++i;
            }

        }
        
        return res.empty();
    }
};
