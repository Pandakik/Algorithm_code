#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>
typedef struct node{ //节点数据类型
int data;
struct node *lchild,*rchild;
}Tnode;
Tnode *mycopy(Tnode*r){ //二叉树的复制
if(!r) return NULL;
Tnode*copyr=(Tnode*)malloc(sizeof(Tnode));
copyr->data=r->data;
copyr->lchild=mycopy(r->lchild);
copyr->rchild=mycopy(r->rchild);
return copyr;
};
Tnode *search(Tnode *r,int key){ //在二叉排序树中查找值为 key 的节点
if(r==NULL)
{
printf(" 没有找到！ ");
return NULL;
}
else if(r!=NULL&&key==r->data){
printf("Find it ! \n");
printf(" 输出数据在内存中的地址： ");
printf("%d",&r);
return r;
}
else if(key<r->data)
return search(r->lchild,key);
else if(key>r->data)
return search(r->rchild,key);
}
//获得其父节点
Tnode *getFather(Tnode *r, Tnode *s)
{
Tnode *sf;
if(r==NULL||r==s)
sf=NULL;
else {
if(s==r->lchild||s==r->rchild)
sf= r;
else if(s->data > r->data)
sf=getFather(r->rchild,s);
else
sf=getFather(r->lchild,s);
}
return sf;
}
//二叉树删除
void DeleteNode(Tnode *r,int key)
{
Tnode *L,*LL; //在删除左右子树都有的结点时使用；
Tnode *p=r;
Tnode *parent=r;
int child=0; //0 表示左子树， 1 表示右子树；
if(!r) //如果排序树为空，则退出；
return ;
while(p) //二叉排序树有效；
{
if(p->data==key)
{
if(!p->lchild&&!p->rchild) //叶结点 (左右子树都为空 )；
{
if(p==r) //被删除的结点只有根结点；
free(p);
else if(child==0)
{
parent->lchild=NULL; //设置父结点左子树为空；
free(p); //释放结点空间；
}
else //父结点为右子树；
{
parent->rchild=NULL; //设置父结点右子树为空；
free(p); //释放结点空间；
}
}
else if(!p->lchild) //左子树为空，右子树不为空；
{
if(child==0) //是父结点的左子树；
parent->lchild=p->rchild;
else //是父结点的右子树；
parent->rchild=p->rchild;
free(p); //释放被删除的结点；
}
else if(!p->rchild) //右子树为空，左子树不为空；
{
if(child==0) //是父结点的左子树；
parent->lchild=p->lchild;
else //是父结点的右子树；
parent->rchild=p->lchild;
free(p); //释放被删除的结点；
}
else
{
LL=p; //保存左子树的结点；
L=p->rchild; //从当前结点的右子树进行查找；
if(L->lchild) //左子树不为空；
{
LL=L;
L=L->lchild; //查找左子树；
p->data=L->data; //将左子树的数据保存到被删除结点；
LL->lchild=L->lchild; //设置父结点的左子树指针为空；
for(;L->lchild;L=L->lchild);
L->lchild=p->lchild;
p->lchild=NULL;
}
else
{
p->data=L->data;
LL->rchild=L->rchild;
}
}
p=NULL;
}
else if(key<p->data) //需删除记录的关键字小于结点的数据；
{ //要删除的结点 p 是 parent 的左子树；
child=0; //标记在当前结点左子树；
parent=p;//保存当前结点作为父结点；
p=p->lchild; //查找左子树；
}
else //需删除记录的关键字大于结点的数据；
{ //要删除的结点 p 是 parent 的右子树；
child=1; //标记在当前结点右子树查找；
parent=p; //保存当前结点作为父结点；
p=p->rchild; //查找右子树；
}
}
}
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
Tnode *r=NULL,*copyr=NULL,*r1,*r2;
int DataCount,Maxdata,i,j,k,m,key,key1;
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
for(i=0;i<DataCount;i++) //向申请成功的数组中赋值
{
arr[i]=rand()%(Maxdata+1);
for(j=0;j<i;j++) //保证随机数不重复
if(arr[i]==arr[j])
i--;
}
printf(" 输出不重复的数据序列： \n");
for(i=0;i<DataCount;i++) //输出不重复的数据序列
printf("%d \t",arr[i]);
Creatree(&r,arr,i);
printf(" 输出源二叉树的高度： ");
printf("%d\n",GetHeight(r)); //输出源二叉树的高度
printf(" 输出源二叉树的叶子节点 : ");
outleaf(r); //输出源二叉树的叶子节点
printf("\n");
printf(" 输出源二叉树中序遍历序列： ");
inorder(r); //输出源二叉树中序遍历序列
printf("\n");
copyr=mycopy(r); //从源二叉树拷贝二叉树副本
printf(" 输出二叉树副本中序遍历序列： ");
inorder(copyr); //输出二叉树副本中序遍历序列，并与源二叉树进行比较
printf("\n");
while(1){
printf(" 如果在源二叉树中查找，请输入 1；如果在二叉树副本中查找，请输入 2： ");
scanf("%d",&k);
if(k!=1&&k!=2){
printf(" 选择错误！请重新输入！ \n");
fflush(stdin); //清空输入
}
else{
printf(" 请输入要查找的节点： ");
scanf("%d",&key);
}
if(k==1){
printf(" 查找结果如下： ");
r1=search(r,key);
printf("\n");
break;
}
if(k==2){
printf(" 查找结果如下： ");
r2=search(copyr,key);
printf("\n");
if(r2==NULL) break; //副本中不存在该数据，输出提示源二叉树是否存在
else { // 副本中存在该数据，删除操作
printf(" 如果要删除数据，请输入 1; 否则，请输入 0： ");
scanf("%d",&m);
if(m){
DeleteNode(copyr,r2->data); //删除节点
printf(" 删除成功！ ");
printf("\n");
printf(" 源二叉树中序遍历： ");
inorder(r); //调用中序遍历函数，输出源二叉树中序遍历序列
printf("\n");
printf(" 源二叉树的高度 :");
printf("%d\n",GetHeight(r)); //输出源二叉树的高度
printf(" 二叉树副本中序遍历： ");
inorder(copyr); // 输出二叉树副本中序遍历序列
printf("\n");
printf(" 二叉树副本的高度 :");
printf("%d\n",GetHeight(r)); //输出二叉树副本的高度
break; }
else break;
} } }
free(arr); //使用完后要释放所申请的空间
return 0;
}
