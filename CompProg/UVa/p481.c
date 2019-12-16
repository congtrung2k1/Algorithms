/**
 * Algorithm:
 * Dynamic programming for LIS using binary search
 *
 * Gotchas:
 * - The O(n^2) version is too slow
 */
#include<string.h>
#include<stdio.h>
#include <vector>
using namespace std;

vector<int> pos; // pos[i] = index of smallest num that has an increasing
                // subsequence of len i+1 ending at that num
vector <int> backidx; // backidx[i] = index of predecessor of num[i]
vector<int> num; // seq
int n;

void doit(){

    int i,j;
    int themax = 1;// max length
    
    pos.push_back(0);
    backidx.push_back(-1);

    for (i=1;i<n;i++){
        const int cur =num[i];
        int upp = themax-1;
        int low = 0;
        int found = -1;

        // search for largest num[pos[found]] smaller than cur
        while (low<=upp){
            int mid = (low+upp)/2;
            if (mid != themax-1 &&
                    num[pos[mid]] < cur && cur <= num[pos[mid+1]])
            {found=mid; break;}
            if (mid == themax-1 && num[pos[mid]] < cur){found=mid;break;}

            if (num[pos[mid]] >= cur)upp=mid-1;
            else  low = mid+1;
        }

        if (found+2 > themax){
            themax = found+2;
            pos.push_back(i);
        }else{
            // update pos
            if (cur < num[pos[found+1]]) pos[found+1] = i;
        }

        backidx.push_back(pos[found]);
    }

    int maxidx = pos[themax-1];

    vector<int> stk ;
    printf("%d\n-\n", themax);
    int pp=0;
    while (maxidx>=0){
        stk.push_back( num[maxidx]);
        maxidx = backidx[maxidx];pp++;
    }

    for (i=pp-1;i>=0;i--){printf("%d\n", stk[i]);}

}
int main(){ int i=0;
    while (9){ int pp;
        int k=scanf("%d", &pp); if (k!=1)break;
        num.push_back(pp);i++;
    }
    n=i;
    if (n==0) printf("0\n-\n");
    else doit();
}
