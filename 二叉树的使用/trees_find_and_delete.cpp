#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>
typedef struct node{ //�ڵ���������
int data;
struct node *lchild,*rchild;
}Tnode;
Tnode *mycopy(Tnode*r){ //�������ĸ���
if(!r) return NULL;
Tnode*copyr=(Tnode*)malloc(sizeof(Tnode));
copyr->data=r->data;
copyr->lchild=mycopy(r->lchild);
copyr->rchild=mycopy(r->rchild);
return copyr;
};
Tnode *search(Tnode *r,int key){ //�ڶ����������в���ֵΪ key �Ľڵ�
if(r==NULL)
{
printf(" û���ҵ��� ");
return NULL;
}
else if(r!=NULL&&key==r->data){
printf("Find it ! \n");
printf(" ����������ڴ��еĵ�ַ�� ");
printf("%d",&r);
return r;
}
else if(key<r->data)
return search(r->lchild,key);
else if(key>r->data)
return search(r->rchild,key);
}
//����丸�ڵ�
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
//������ɾ��
void DeleteNode(Tnode *r,int key)
{
Tnode *L,*LL; //��ɾ�������������еĽ��ʱʹ�ã�
Tnode *p=r;
Tnode *parent=r;
int child=0; //0 ��ʾ�������� 1 ��ʾ��������
if(!r) //���������Ϊ�գ����˳���
return ;
while(p) //������������Ч��
{
if(p->data==key)
{
if(!p->lchild&&!p->rchild) //Ҷ��� (����������Ϊ�� )��
{
if(p==r) //��ɾ���Ľ��ֻ�и���㣻
free(p);
else if(child==0)
{
parent->lchild=NULL; //���ø����������Ϊ�գ�
free(p); //�ͷŽ��ռ䣻
}
else //�����Ϊ��������
{
parent->rchild=NULL; //���ø����������Ϊ�գ�
free(p); //�ͷŽ��ռ䣻
}
}
else if(!p->lchild) //������Ϊ�գ���������Ϊ�գ�
{
if(child==0) //�Ǹ�������������
parent->lchild=p->rchild;
else //�Ǹ�������������
parent->rchild=p->rchild;
free(p); //�ͷű�ɾ���Ľ�㣻
}
else if(!p->rchild) //������Ϊ�գ���������Ϊ�գ�
{
if(child==0) //�Ǹ�������������
parent->lchild=p->lchild;
else //�Ǹ�������������
parent->rchild=p->lchild;
free(p); //�ͷű�ɾ���Ľ�㣻
}
else
{
LL=p; //�����������Ľ�㣻
L=p->rchild; //�ӵ�ǰ�������������в��ң�
if(L->lchild) //��������Ϊ�գ�
{
LL=L;
L=L->lchild; //������������
p->data=L->data; //�������������ݱ��浽��ɾ����㣻
LL->lchild=L->lchild; //���ø�����������ָ��Ϊ�գ�
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
else if(key<p->data) //��ɾ����¼�Ĺؼ���С�ڽ������ݣ�
{ //Ҫɾ���Ľ�� p �� parent ����������
child=0; //����ڵ�ǰ�����������
parent=p;//���浱ǰ�����Ϊ����㣻
p=p->lchild; //������������
}
else //��ɾ����¼�Ĺؼ��ִ��ڽ������ݣ�
{ //Ҫɾ���Ľ�� p �� parent ����������
child=1; //����ڵ�ǰ������������ң�
parent=p; //���浱ǰ�����Ϊ����㣻
p=p->rchild; //������������
}
}
}
void insertTree(Tnode **r,int data){ //�������������
if(*r==NULL){ //�����Ϊ�գ�����
*r=(Tnode *)malloc(sizeof(Tnode));
(*r)->data = data;
(*r)->lchild=NULL;
(*r)->rchild=NULL;
}
else if(data<(*r)->data) //��ǰֵС�ڸ���㣬��������
insertTree(&((*r)->lchild),data);
else if(data>(*r)->data) //��ǰֵ���ڸ���㣬��������
insertTree(&((*r)->rchild),data);
}
void Creatree(Tnode **r,int a[],int n){ //���ò��뺯����ʵ�ֶ����������Ĵ���
int i;
for(i=0;i<n;i++)
insertTree(&(*r),a[i]);
}
int GetHeight(Tnode *r){ //����ͳ�ƶ������ĸ߶ȵĺ���
int hl, hr, max;
if (r!= NULL){
hl = GetHeight(r->lchild); //���������߶�
hr = GetHeight(r->rchild); //���������߶�
max = hl > hr ? hl : hr;
return (max + 1);
}
else return 0;
}
void outleaf(Tnode *r){ //���������������Ҷ�ӽڵ�ĺ���
if(r==0) return ;
else if(r->lchild==NULL&&r->rchild==NULL) //�ڵ����������ͬʱΪ�գ���ΪҶ��
printf("%d ",r->data);
outleaf(r->lchild) ;
outleaf(r->rchild) ;
}
void inorder(Tnode *r){ //����ʵ����������ĺ���
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
while(1) //��ѭ�������õ���ȷ���벻�˳�
{
printf(" ������ DataCount:");
scanf("%d",&DataCount);
printf(" ������ Maxdata:");
scanf("%d",&Maxdata);
if(DataCount>=10&&DataCount<=20&&Maxdata>=50&&Maxdata<=100) break;
printf(" ���벻��ȷ������������ ! \n");
fflush(stdin); //�������
}
if((arr=(int *)malloc(DataCount*sizeof(int)))==NULL) //���붯̬����
{
printf(" �����ڴ�ռ�ʧ�ܣ������˳��� ");
return 0;
}
for(i=0;i<DataCount;i++) //������ɹ��������и�ֵ
{
arr[i]=rand()%(Maxdata+1);
for(j=0;j<i;j++) //��֤��������ظ�
if(arr[i]==arr[j])
i--;
}
printf(" ������ظ����������У� \n");
for(i=0;i<DataCount;i++) //������ظ�����������
printf("%d \t",arr[i]);
Creatree(&r,arr,i);
printf(" ���Դ�������ĸ߶ȣ� ");
printf("%d\n",GetHeight(r)); //���Դ�������ĸ߶�
printf(" ���Դ��������Ҷ�ӽڵ� : ");
outleaf(r); //���Դ��������Ҷ�ӽڵ�
printf("\n");
printf(" ���Դ����������������У� ");
inorder(r); //���Դ�����������������
printf("\n");
copyr=mycopy(r); //��Դ��������������������
printf(" �����������������������У� ");
inorder(copyr); //�����������������������У�����Դ���������бȽ�
printf("\n");
while(1){
printf(" �����Դ�������в��ң������� 1������ڶ����������в��ң������� 2�� ");
scanf("%d",&k);
if(k!=1&&k!=2){
printf(" ѡ��������������룡 \n");
fflush(stdin); //�������
}
else{
printf(" ������Ҫ���ҵĽڵ㣺 ");
scanf("%d",&key);
}
if(k==1){
printf(" ���ҽ�����£� ");
r1=search(r,key);
printf("\n");
break;
}
if(k==2){
printf(" ���ҽ�����£� ");
r2=search(copyr,key);
printf("\n");
if(r2==NULL) break; //�����в����ڸ����ݣ������ʾԴ�������Ƿ����
else { // �����д��ڸ����ݣ�ɾ������
printf(" ���Ҫɾ�����ݣ������� 1; ���������� 0�� ");
scanf("%d",&m);
if(m){
DeleteNode(copyr,r2->data); //ɾ���ڵ�
printf(" ɾ���ɹ��� ");
printf("\n");
printf(" Դ��������������� ");
inorder(r); //��������������������Դ�����������������
printf("\n");
printf(" Դ�������ĸ߶� :");
printf("%d\n",GetHeight(r)); //���Դ�������ĸ߶�
printf(" ������������������� ");
inorder(copyr); // ������������������������
printf("\n");
printf(" �����������ĸ߶� :");
printf("%d\n",GetHeight(r)); //��������������ĸ߶�
break; }
else break;
} } }
free(arr); //ʹ�����Ҫ�ͷ�������Ŀռ�
return 0;
}
