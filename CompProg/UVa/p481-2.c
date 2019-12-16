#include<stdio.h>
#include<string.h>
#include<vector>

using namespace std;

vector<int> pos; // pos[i] = idx the num that is the end of
                 // subseq of length i+1
vector<int> backidx; // idx of predecessor of num[i]
vector<int> num;
int n;

void doit(){
    pos.push_back(0);
    backidx.push_back(-1);
    int themax= 1;
    int i,j;
    for (i=1;i<n;i++){
        int cur = num[i];
        int upp = themax - 1;
        int low = 0; int found = -1;
        while (low<=upp){
            int mid=(low+upp)/2;
            if (mid != themax-1 && 
                num[pos[mid]] < cur && cur <= num[pos[mid+1]])
            {found=mid;break;}
            if (mid == themax-1 &&
                num[pos[mid]] < cur){found=mid;break;}
            if (num[pos[mid]] >= cur) upp = mid-1;
            else low = mid+1;
        }
        if (found + 2 > themax){
            themax=found+2;
            pos.push_back(i);
        }
        else if (cur < num[pos[found+1]]) pos[found+1] = i;
        backidx.push_back(pos[found]);
    }

    vector<int> stk ;
    int pp = 0;
    int maxidx = pos[themax-1];
    printf("%d\n-\n",themax);
    while (maxidx>=0){
        stk.push_back(num[maxidx]);pp++;
        maxidx=backidx[maxidx];
    }
    for (i=pp-1;i>=0;i--){
        printf("%d\n", stk[i]);
    }
}

int main()
{
    while (9){ int p; int k = scanf("%d", &p); if (k!=1)break;
        num.push_back(p); n++;}
    if (n==0) printf("0\n-\n");
else     doit();
}

