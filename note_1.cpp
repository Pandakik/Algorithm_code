//malloc�������
/*
 str = (char *) malloc(15);
  free(str);
  
malloc��new�Ĳ�ͬ��
�Ӻ��������Ͽ��Կ�����malloc �� new ������������ͬ: 
new ����ָ�����͵�ָ�룬���ҿ����Զ���������Ҫ��С��
 p = new int; //��������Ϊint* ����(������ָ��)�������СΪ sizeof(int);
  
�� malloc ����������Ǽ���Ҫ�ֽ����������ڷ��غ�ǿ��ת��Ϊʵ�����͵�ָ�롣
int* p;
p = (int *) malloc (sizeof(int));
  
*/

//��ָ Offer 17. ��ӡ��1������nλ��
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

//��ָ Offer 18. ɾ������Ľڵ�
/*
struct ListNode* deleteNode(struct ListNode* head, int val){
    if(head == NULL) {  //  ����
        return NULL;
    }
    if(head->val == val) {  //  ͷ�ڵ�ΪҪɾ���Ľڵ�
        return head->next;
    }

    struct ListNode* pre = head;
    while ((pre->next != NULL) && (pre->next->val != val)){  //  û���ҵ�����������Ѱ��
        pre = pre->next;
    }

    if(pre->next != NULL) {  //  �ҵ���Ҫɾ���Ľڵ�
        pre->next = pre->next->next;
    }

    return head;
}

*/

//��ָ Offer 65. ���üӼ��˳����ӷ�
/*
AND (λ��&) OR ( λ��| ) XOR ( λ���^ )

1 & 1 = 1�� 1 | 1 = 1�� 1 ^ 1 = 0

1 & 0 = 0�� 1 | 0 = 1�� 1 ^ 0 = 1

0 & 1 = 0�� 0 | 1 = 1�� 0 ^ 1 = 1

0 & 0 = 0�� 0 | 0 = 0�� 0 ^ 0 = 0

int add(int a, int b){
    while(a!=0){
        int temp=a^b;
       a=((unsigned int)(a&b)<<1);
      b=temp;
    }
    return b;
}
*/


//��ָ Offer 53 - II. 0��n-1��ȱʧ������
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

//��ָ Offer 05. �滻�ո�
/*
calloc����0�ڴ棬malloc���ᡣ
void *memset(void *str, int c, size_t n)
C �⺯�� void *memset(void *str, int c, size_t n) �����ַ� c��һ���޷����ַ��������� str ��ָ����ַ�����ǰ n ���ַ���

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

//��ָ Offer 09. ������ջʵ�ֶ���
//����ķ���S1,����Ĵ�S1����S2.
/*
typedef struct {
    int len;
    int top1;
    int top2;
    int *s1;//ջ1����ջ=���
    int *s2;//ջ2����ջ=����
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