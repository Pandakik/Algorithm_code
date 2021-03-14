int cmp(const void* a , const void* b ){
    char s1[1024];
    char s2[1024];
    sprintf(s1 , "%d%d" , *(int*)a , *(int*)b);
    sprintf(s2 , "%d%d" , *(int*)b , *(int*)a);
    return strcmp(s1,s2);
}
                                                                    
char* minNumber(int* nums, int numsSize){
    if(numsSize < 0){
        return "";
    }
    if(numsSize == 0){
        return "0";
    }
    qsort(nums , numsSize , sizeof(int) ,  cmp);

    char* ch , *s ;
    ch = (char*)malloc(sizeof(char)*1024);
    s = ch;
    for(int i = 0; i < numsSize ; i++ ){
        sprintf(s , "%d" , nums[i]);
        s += strlen(s);
    }
    return ch;
}
int cmp(const void* a, const void* b)
{
    char s1[1024];
    char s2[1024];
    sprintf(s1, "%d%d", *int(*)a, *int(*)b);
    sprintf(s2, "%d%d", *int(*)b, *int(*)a);
    return strcmp(s1, s2);
}
char* minNumber(int* nums, int numsSize) {
    if (numsSize == 0)
        return 0;
    if (numsSize < 0)
        return " ";

    qsort(nums, numsSize, sizeof(int), cmp);
    char* ch, * s;
    ch = (char*)malloc(sizeof(char) * 1024);
    s = ch;
    for (int i = 0; i < numsSize; i++)
    {
        sprintf(s, "%d", nums[i]);
        s += strlen(s);
    }
    return ch;
}


