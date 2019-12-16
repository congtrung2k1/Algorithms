#include<string.h>
#include<stdio.h>

// f[i][j] is 2 iff there is a way to
// sum to (i-16000) using the first j items
// 1 iff no way
// 0 iff not known
char f[80010][41];

int t[100]; // transaction values
char state[100]; // possible state of each transaction
                 // 3 if can be both
                 // 1 if can be add
                 // 2 if can be minus
int n,fl; // # and flow

// base to account for negative sums
#define base 40010

// returns true if it's possible to sum up to flow with j items
bool find(int sum, int j){
    
    if(j <0){
    
        if (sum==fl){
            return true;
        }
        return false;
    }
    if (f[sum+base][j] ) return f[sum+base][j] == 2;

    // try adding the j^th item
    bool b1 = find(sum+t[j], j-1);
    bool b2 = find(sum-t[j], j-1);
    if (b1 ){ // add
        state[j] |= 1;
    }
    if (b2){ // minus
        state[j] |= 2;
    }
    if (b1||b2){
        f[sum+base][j]=2; return true;
    }
    f[sum+base][j]=1; return false;
}


int main()
{
    while(9){
        scanf("%d%d",&n,&fl);
        if (n==0)break;
        int i,j;
        for (i=0;i<n;i++){
            scanf("%d",&t[i]);
        }
        memset(state,0,sizeof(state));
        memset(f,0,sizeof(f));
        bool b =find (0,n-1);
        if (!b) printf("*\n");
        else{
            for(i=0;i<n;i++){
                printf("%c", state[i] == 3 ? '?' : (state[i]==1?'+':'-'));
            }
            printf("\n");
        }
    }
}
