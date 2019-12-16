/**
 * Solved using bitmasks and brute force. The trick here is to break down
 * a tower's coverage into discrete components, and using bitmasks to ensure
 * no double counting when summing up two or more towers' coverages.
 */
#include<cstring>
#include<cstdlib>
#include<iostream>
using namespace std;

struct zone{
    int mask, n;
};

int n, nbuild,nzones;
zone zones[50];
int towers[50];
int lo[1<<16];
int hi[1<<16];
char bitcount[1<<20];
int allmasklo[1<<10];
int allmaskhi[1<<10];
int masks[50]; // masks[i] == tower i mask

int sum(int mask){
    int i, s=0;
    for(i=0;i<n;i++){
        if ((mask&(1<<i))) s+= towers[i];
    }
    for(i=n;i<(n+nzones);i++){
        if ((mask&(1<<i))) s+= zones[i-n].n;
    }
    return s;
}

int addmask(int selected){
    int i, allmask=0;
    for(i=0;i<n;i++){
        if(selected&(1<<i))allmask|=masks[i];
    }
    return allmask;
}

int ansmask;
int ncust=0;
void find(){
    int i;ncust=0;
    for(i=0;i<(1<<n);i++){
        int count = bitcount[i];
        if (count != nbuild)continue;
        int allmask = allmasklo[i&((1<<10)-1)] | allmaskhi[i>>10];
        int s= lo[allmask&65535]+hi[(allmask>>16)&65535];
        if(s>ncust){
            ansmask = i;
            ncust=s;
        }
    }
}

int main(){
    int c=1,i;
    for (i=0;i<(1<<20);i++){
        int c=0,j=i;
        while(j){
            if(j&1)c++;
            j >>= 1;
        }
        bitcount[i]=c;
    }
    while(1){
        cin>>n>>nbuild;
        if(!n)break;
        for(i=0;i<n;i++){
            cin>>towers[i];
        }
        int ncommon;
        cin>>ncommon; nzones=ncommon;
        for(i=0;i<ncommon;i++){
            int j; cin>> j;
            int mask = 0;
            for(int k=0;k<j;k++){
                int t; cin>>t;
                mask |= 1<<(t-1);
            }
            int num; cin>> num;
            zones[i].mask=mask; zones[i].n=num;
        }
        for(i=0;i<n;i++){
            int mask=1<<i;
            for (int j=0;j<ncommon;j++)
                if(zones[j].mask&(1<<i)) {
                    towers[i] -= zones[j].n;
                    mask |= 1 << (n+j);
                }
            masks[i]=mask;
        }
        for(i=0;i< (1<<16);i++){
            lo[i] = sum(i);
            hi[i] = sum(i<<16);
        }
        for(i=0;i<(1<<10);i++){
            allmasklo[i]=addmask(i);
            allmaskhi[i]=addmask(i<<10);
        }
        find();
        cout<<"Case Number  "<<c++<<endl
            <<"Number of Customers: "<<ncust<<endl
            <<"Locations recommended:";
        for(i=0;i<n;i++)
            if(ansmask&(1<<i))
                cout<<" "<<i+1;
        cout<<endl<<endl;
    }
}

