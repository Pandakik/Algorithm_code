#include<stdio.h>
#include<stdlib.h>
#include<time.h>
typedef struct node{ //节点数据类型
int data;
struct node *lchild,*rchild;
}Tnode;
void insertTree(Tnode **r,int data){ //插入二叉排序树
if(*r==NULL){ //如果树为空，则建树
*r=(Tnode *)malloc(sizeof(Tnode));
(*r)->data = data;
(*r)->lchild=NULL;
(*r)->rchild=NULL;
}
else if(data<(*r)->data) //当前值小于根结点，建左子树
insertTree(&((*r)->lchild),data);
else if(data>(*r)->data) //当前值大于根结点，建右子树
insertTree(&((*r)->rchild),data);
}
void Creatree(Tnode **r,int a[],int n){ //调用插入函数，实现二叉排序树的创建
int i;
for(i=0;i<n;i++)
insertTree(&(*r),a[i]);
}
int GetHeight(Tnode *r){ //定义统计二叉树的高度的函数
int hl, hr, max;
if (r!= NULL){
hl = GetHeight(r->lchild); //求左子树高度
hr = GetHeight(r->rchild); //求右子树高度
max = hl > hr ? hl : hr;
return (max + 1);
}
else return 0;
}
void outleaf(Tnode *r){ //定义输出二叉树的叶子节点的函数
if(r==0) return ;
else if(r->lchild==NULL&&r->rchild==NULL) //节点的左右子树同时为空，即为叶子
printf("%d ",r->data);
outleaf(r->lchild) ;
outleaf(r->rchild) ;
}
void inorder(Tnode *r){ //定义实现中序遍历的函数
if(r){
inorder(r->lchild);
printf("%d ",r->data);
inorder(r->rchild);
}
}
int main()
{
srand(time(NULL));
Tnode *r=NULL;
int DataCount,Maxdata,i,j;
int *arr;
while(1) //死循环，不得到正确输入不退出
{
printf(" 请输入 DataCount:");
scanf("%d",&DataCount);
printf(" 请输入 Maxdata:");
scanf("%d",&Maxdata);
if(DataCount>=10&&DataCount<=20&&Maxdata>=50&&Maxdata<=100) break;
printf(" 输入不正确，请重新输入 ! \n");
fflush(stdin); //清空输入
}
if((arr=(int *)malloc(DataCount*sizeof(int)))==NULL) //申请动态数组
{
printf(" 分配内存空间失败，程序退出！ ");
return 0;
}
for(i=0;i<DataCount;i++) { //向申请成功的数组中赋值
arr[i]=rand()%(Maxdata+1);
for(j=0;j<i;j++) //保证随机数不重复
if(arr[i]==arr[j])
i--;
}
printf(" 输出不重复的数据序列： \n");
for(i=0;i<DataCount;i++) //输出不重复的数据序列
printf("%d \t",arr[i]);
Creatree(&r,arr,i);
printf(" 输出二叉树的高度： \n");
printf("%d\n",GetHeight(r)); //输出二叉树的高度
printf(" 输出二叉树的叶子节点 : \n");
outleaf(r); //输出二叉树的叶子节点
printf("\n");
printf(" 输出中序遍历序列： \n");
inorder(r); //输出中序遍历序列
printf("\n");
free(arr); //使用完后要释放所申请的空间
return 0;
}
