//malloc函数详解
/*
 str = (char *) malloc(15);
  free(str);
  
malloc与new的不同点
从函数声明上可以看出。malloc 和 new 至少有两个不同: 
new 返回指定类型的指针，并且可以自动计算所需要大小。
 p = new int; //返回类型为int* 类型(整数型指针)，分配大小为 sizeof(int);
  
而 malloc 则必须由我们计算要字节数，并且在返回后强行转换为实际类型的指针。
int* p;
p = (int *) malloc (sizeof(int));
  
*/

//剑指 Offer 17. 打印从1到最大的n位数
/*
int* printNumbers(int n, int* returnSize){
    int i;
*returnSize = pow(10,n)-1;
int *re = malloc((pow(10,n)-1)*sizeof(int));

    for(i=1;i<=pow(10,n)-1;i++)
    {re[i-1]=i;}

    return re;
}
*/

//剑指 Offer 18. 删除链表的节点
/*
struct ListNode* deleteNode(struct ListNode* head, int val){
    if(head == NULL) {  //  特判
        return NULL;
    }
    if(head->val == val) {  //  头节点为要删除的节点
        return head->next;
    }

    struct ListNode* pre = head;
    while ((pre->next != NULL) && (pre->next->val != val)){  //  没有找到，继续遍历寻找
        pre = pre->next;
    }

    if(pre->next != NULL) {  //  找到需要删除的节点
        pre->next = pre->next->next;
    }

    return head;
}

*/

//剑指 Offer 65. 不用加减乘除做加法
/*
AND (位与&) OR ( 位或| ) XOR ( 位异或^ )

1 & 1 = 1， 1 | 1 = 1， 1 ^ 1 = 0

1 & 0 = 0， 1 | 0 = 1， 1 ^ 0 = 1

0 & 1 = 0， 0 | 1 = 1， 0 ^ 1 = 1

0 & 0 = 0， 0 | 0 = 0， 0 ^ 0 = 0

int add(int a, int b){
    while(a!=0){
        int temp=a^b;
       a=((unsigned int)(a&b)<<1);
      b=temp;
    }
    return b;
}
*/


//剑指 Offer 53 - II. 0～n-1中缺失的数字
/*
int missingNumber(int* nums, int numsSize)
{
    int i = 0;
    while ( i < numsSize )
    {
        if(nums[i] == i)
            i++;
        else
                break;
    }
    return i;
}
*/

//剑指 Offer 05. 替换空格
/*
calloc会清0内存，malloc不会。
void *memset(void *str, int c, size_t n)
C 库函数 void *memset(void *str, int c, size_t n) 复制字符 c（一个无符号字符）到参数 str 所指向的字符串的前 n 个字符。

char* replaceSpace(char* s) {
    int i = 0, k = 0;
    char* ret = calloc(3 * strlen(s) + 1, sizeof(char));
    while (s[i] != '\0') {
        if (s[i] != ' ') {
            ret[k++] = s[i];
        } else {
            ret[k++] = '%';
            ret[k++] = '2';
            ret[k++] = '0';
        }
        i++;
    }
    return ret;
}


*/

//剑指 Offer 09. 用两个栈实现队列
//加入的放入S1,输出的从S1放入S2.
/*
typedef struct {
    int len;
    int top1;
    int top2;
    int *s1;//栈1，入栈=入队
    int *s2;//栈2，出栈=出队
} CQueue;


CQueue* cQueueCreate() {
    CQueue *queue = malloc(sizeof(CQueue));
    queue->len = 10000;
    queue->top1 = -1;
    queue->top2 = -1;
    queue->s1 = malloc(queue->len * sizeof(int));
    queue->s2 = malloc(queue->len * sizeof(int));
    return queue;
}

void cQueueAppendTail(CQueue* obj, int value) {
    if(obj->top1 == -1)
        while(obj->top2 != -1)
            obj->s1[++(obj->top1)] = obj->s2[obj->top2--];
    obj->s1[++(obj->top1)] = value;
}

int cQueueDeleteHead(CQueue* obj) {
    if(obj->top2 == -1)
        while(obj->top1 != -1)
            obj->s2[++(obj->top2)] = obj->s1[obj->top1--];
    return obj->top2==-1 ? -1 : obj->s2[obj->top2--];
}

void cQueueFree(CQueue* obj) {
    free(obj->s1);
    free(obj->s2);
    free(obj);
}

/**
 * Your CQueue struct will be instantiated and called as such:
 * CQueue* obj = cQueueCreate();
 * cQueueAppendTail(obj, value);

 * int param_2 = cQueueDeleteHead(obj);

 * cQueueFree(obj);
*/


*/