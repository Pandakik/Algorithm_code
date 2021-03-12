/*
剑指 Offer 10- I. 斐波那契数列
写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项（即 F(N)）。斐波那契数列的定义如下：



F(0) = 0,   F(1) = 1

F(N) = F(N - 1) + F(N - 2), 其中 N > 1.

斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。



答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。



来源：力扣（LeetCode）



int fib(int n){

if(n<=0)
return 0;

int a1 = 0,a2 = 1,fc = a1 + a2;
    for(int i = 0;i<n-1;i++)
    {
        fc = (a1 + a2)%1000000007;
        a1 = a2;
        a2 = fc;
    }
return fc;}


剑指 Offer 10- II. 青蛙跳台阶问题
一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。



答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。





int numWays(int n){
if(n<2) return 1;
int a = 1,b = 1;
for(int i = 2;i<=n;i++)
{
int temp = (a+b)%1000000007;
a = b;
b = temp;
}
return b ;

}




剑指 Offer 11. 旋转数组的最小数字

把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。 

int minArray(int* numbers, int numbersSize){

int i;
int idex = 0;
int temp = numbers[0];
for(i = 0;i<numbersSize;i++)
if(temp>numbers[i])
{
    idex = i;
    break;
}
return numbers[idex];
}


剑指 Offer 15. 二进制中1的个数

请实现一个函数，输入一个整数（以二进制串形式），输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。

int hammingWeight(uint32_t n) {
int res = 0;

while(n!=0)
{n = n&(n-1);
res++;}

return res;
}


剑指 Offer 21. 调整数组顺序使奇数位于偶数前面

输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
bool isodd(int n)
{
return (n&1)==1;
}

void swap(int *a,int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

int* exchange(int* nums, int numsSize, int* returnSize){
int *pst = nums;
int *pse = nums+numsSize-1;
while(pst<pse)
{
    if(isodd(*pst)==1)
    {pst++;}
    else if(isodd(*pse)==0)
    {pse--;}
    else
    {
        swap(pst,pse);
    }
}
*returnSize = numsSize;
return nums;


}


剑指 Offer 25. 合并两个排序的链表

输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */


struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2){
if(l1 == NULL)
return l2;

if(l2 == NULL)
return l1;

if(l1->val<l2->val)
{
    l1->next = mergeTwoLists(l1->next,l2);
    return l1;
}
else
{
l2->next = mergeTwoLists(l2->next,l1);
return l2;

}

}
剑指 Offer 27. 二叉树的镜像

请完成一个函数，输入一个二叉树，该函数输出它的镜像。

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */

typedef struct TreeNode TreeNode;
struct TreeNode* mirrorTree(struct TreeNode* root){

    if(root == NULL) return NULL;
    TreeNode *temp = root->left;
    root->left = mirrorTree(root->right);
    root->right = mirrorTree(temp);
    return root;

}


剑指 Offer 28. 对称的二叉树

请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */





/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */

bool isf(struct TreeNode* p,struct TreeNode* q)
{
    if(p==NULL&&q==NULL)
    return true;
    else if(p == NULL||q == NULL)
    return false;
    else if(p->val!=q->val)
    return false;
    return isf(p->left,q->right)&&isf(p->right,q->left);
}
bool isSymmetric(struct TreeNode* root){

if(root == NULL)
    return true;

return isf(root->left,root->right);
}




剑指 Offer 22. 链表中倒数第k个节点

输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。



例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */


struct ListNode* getKthFromEnd(struct ListNode* head, int k){
if(head == NULL||k==0)
{
    return NULL;
}

struct ListNode* pnode = head;
for(int i=0;i<k-1;i++)
{
if(pnode->next!=NULL)
{
    pnode=pnode->next;
}
else
{
    return NULL;
}
}

while(pnode->next!=NULL)
   { pnode = pnode->next;
    head = head->next;}
    return head;
}

*/