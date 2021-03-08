#include<stdio.h>
#include<stdlib.h>
#include<time.h>
typedef struct node{ //�ڵ���������
int data;
struct node *lchild,*rchild;
}Tnode;
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
Tnode *r=NULL;
int DataCount,Maxdata,i,j;
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
for(i=0;i<DataCount;i++) { //������ɹ��������и�ֵ
arr[i]=rand()%(Maxdata+1);
for(j=0;j<i;j++) //��֤��������ظ�
if(arr[i]==arr[j])
i--;
}
printf(" ������ظ����������У� \n");
for(i=0;i<DataCount;i++) //������ظ�����������
printf("%d \t",arr[i]);
Creatree(&r,arr,i);
printf(" ����������ĸ߶ȣ� \n");
printf("%d\n",GetHeight(r)); //����������ĸ߶�
printf(" �����������Ҷ�ӽڵ� : \n");
outleaf(r); //�����������Ҷ�ӽڵ�
printf("\n");
printf(" �������������У� \n");
inorder(r); //��������������
printf("\n");
free(arr); //ʹ�����Ҫ�ͷ�������Ŀռ�
return 0;
}
