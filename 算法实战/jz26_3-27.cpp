class Solution {
public:
    bool helper(TreeNode* A, TreeNode* B) {
        if (A == NULL || B == NULL) {
            return B == NULL ? true : false;
        }
        if (A->val != B->val) {
            return false;
        }
        return helper(A->left, B->left) && helper(A->right, B->right);
    }
    bool isSubStructure(TreeNode* A, TreeNode* B) {
        if (A == NULL || B == NULL) {
            return false;
        }
        return helper(A, B) || isSubStructure(A->left, B) || isSubStructure(A->right, B);
    }
};


