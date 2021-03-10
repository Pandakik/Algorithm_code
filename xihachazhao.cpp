#include<stdio.h>
int main()
{
	int i,j,k;
	int map[10];
	int nums[6] = {3,5,5,6,4,4};
	for(i=0;i<6;i++)
	{
		if(map[nums[i]]==1)
		{printf("%d ",nums[i]);
		continue;
		}
		map[nums[i]]=1;
	}
	return -1;
}
