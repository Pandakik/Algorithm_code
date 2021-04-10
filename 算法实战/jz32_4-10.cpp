/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    vector<int> levelOrder(TreeNode* root) {
        vector<int> res;
        queue<TreeNode*> red;
        if(!root)  return res;
        red.push(root);
        while(!red.empty())
        {
            TreeNode* temp = red.front();
            red.pop();
            res.push_back(temp->val);
            if(temp->left) red.push(temp->left);
            if(temp->right) red.push(temp->right);
        }
        return res;
    }
};
