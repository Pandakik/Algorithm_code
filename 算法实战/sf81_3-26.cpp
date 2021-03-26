#include<iostream>
using namespace std;

struct ListNode
{
	int val;
	ListNode *next;
};


class Solution {
public:
    ListNode* deleteDuplicates(ListNode* head) {
        if (!head) {
            return head;
        }

        ListNode* cur = head;
        while (cur->next) {
            if (cur->val == cur->next->val) {
                cur->next = cur->next->next;
            }
            else {
                cur = cur->next;
            }
        }

        return head;
    }
};
int main()
{
	ListNode* head;
	cout<<"fine";
	return 0;
}
