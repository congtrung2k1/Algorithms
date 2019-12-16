/**
 * Solved using a linear loop.
 */
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<cstring>
using namespace std;

struct seg{
    int lo,hi;
    char name[22];
};
seg s[11000];
int n;

int comp(const void*a, const void*b){
    seg&s1 = *(seg*)a;
    seg&s2 = *(seg*)b;
    return s1.lo-s2.lo;
}

int search(int q){
    q++;
    int lo = 0;
    int hi = n-1;
    while(lo<hi){
        int mid = (lo+hi)/2;
        if(s[mid].lo > q){
            hi=mid-1;
        }
        else if(s[mid].lo < q)
            lo=mid+1;
        else return mid;
    }
    return hi;
}

const char*query(int q){
    int idx = search(q);
    int i;
    const char*ans = NULL;
    for (i=idx;i>=0;i--){
        if(s[i].lo <= q && q <= s[i].hi){
            if(ans) return "UNDETERMINED";
            ans =s[i].name;
        }
    }
    return ans?ans:"UNDETERMINED";
}

int main(){
    int cases;
    cin>>cases;
    while(cases--){
        int i,q,numq;
        cin>>n;
        for(i=0;i<n;i++){
            cin>>s[i].name>>s[i].lo>>s[i].hi;
        }
        qsort(s,n,sizeof s[0],comp);
        cin>>numq;
        for(i=0;i<numq;i++){
            cin>>q;
            cout<<query(q)<<endl;
        }
        if(cases)cout<<endl;
    }
}
