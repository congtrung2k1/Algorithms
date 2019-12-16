/**
 * Algorithm:
 * DP for LIS and LDS
 *
 * Vector is used since I don't know how many buildings there will be..
 *
 */

#include<string.h>
#include<stdio.h>
#include<vector>

using namespace std;
vector<int> hei;
vector<int> wid;
vector<int> lisw;
vector<int> ldsw;
int n;
int cc=1;
void doit()
{
    int i,j;
    for (i=0;i<n;i++){
        int h = hei[i];
        int maxw = 0;
        for (j=0; j < i;j++){
            if (h > hei[j] && lisw[j]>maxw){
                maxw = lisw[j]; 
            }
        }
        lisw.push_back(maxw+wid[i]);
    }


    for (i=0;i<n;i++){
        int h = hei[i];
        int maxw = 0;
        for (j=0; j < i;j++){
            if (h < hei[j] && ldsw[j]>maxw){
                maxw = ldsw[j]; 
            }
        }
        ldsw.push_back(maxw+wid[i]);
    }

    int maxlisw = 0;
    int maxldsw = 0;
    for (i=0;i<n;i++){
        if (ldsw[i]>maxldsw)maxldsw = ldsw[i];
        if (lisw[i]>maxlisw)maxlisw=lisw[i];
    }
    if ( maxlisw>=maxldsw){
        printf("Case %d. Increasing (%d). Decreasing (%d).\n",
            cc++, maxlisw, maxldsw);
    }
    else 
        printf("Case %d. Decreasing (%d). Increasing (%d).\n",
            cc++, maxldsw, maxlisw);
}

int main()
{
    int nu;scanf("%d", &nu);
    while (nu--){
        scanf("%d", &n);
        int i,j;

        for(i=0;i < n;i++){ int k;
            scanf ("%d", & k); hei
            .push_back(k);
        }
        for (i=0;i<n;i++){
            int k; scanf ("%d", &k);
            wid.push_back(k);
        }
        doit();
        hei.clear();wid.clear();lisw.clear();ldsw.clear();
    }
}
