class Solution {
public:
    int removeDuplicates(int A[], int n) {
        if(!n)return 0;
        int prevlen=0,prev=A[0]+1;
        int i,j=0;
        for(i=0;i<n;i++){
            int cur=A[i];
            if(cur==prev){
                if(++prevlen<=1)
                    A[j++]=cur;
            }
            else {
                prevlen=0;
                A[j++]=cur;
            }
            prev=cur;
        }
        return j;
    }
};