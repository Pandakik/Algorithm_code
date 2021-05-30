#include<iostream>
#include<stdlib.h>
#include<vector>
#include<queue>
using namespace std;

struct  TreeNode
{
    int val;
    TreeNode *right;
    TreeNode *left;
};
/*NULL在C++中就是0，这是因为在C++中void* 类型是不允许隐式转换成其他类型的，
所以之前C++中用0来代表空指针，但是在重载整形的情况下，
会出现上述的问题。所以，C++11加入了nullptr，
可以保证在任何情况下都代表空指针，而不会出现上述的情况，
因此，建议以后还是都用nullptr替代NULL吧，而NULL就当做0使用。*/
class solution
{
public:
    vector<vector<int>> levelOrder(TreeNode *root)
    {
        queue<TreeNode*> tep;
        vector<vector<int>> ans;
        if(root == nullptr)  return ans;

        //初始化
        tep.push(root);
        while (!tep.empty())
        {
            int tep_size = tep.size();
            vector<int> ret;
            for(int i = 0;i < tep_size ;i++)
            {
                TreeNode *tes_node = tep.front();
                tep.pop();
                ret.push_back(tes_node->val);
                if(tes_node->right) tep.push(tes_node->right);
                if(tes_node->left) tep.push(tes_node->left);
            }
            ans.push_back(ret);
        }
        return ans;
    }
};




int main()
{



return 0;
}