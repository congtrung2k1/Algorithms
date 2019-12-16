class Solution {
public:

    int removeDuplicates(int A[], int n) {
        if(!n)return 0;
        int i,j,prev=A[0]+1;
        for(i=j=0;i<n;i++){
            if(prev!=A[i])
                A[j++]=A[i];
            prev=A[i];
        }
        return j;
    }
};