/*
TASK: shopping
LANG: C++
*/
/**
 * Solved using dynamic programming. We model the regular item price as an offer
 * for convenience.
 */
#include<iostream>
#include<fstream>
#include<cstdlib>
#include<cstring>
using namespace std;

struct prod{int idx,count;};
struct offer{prod prods[5];int nprods,price;};
offer offers[999];
int noffers;
int codetoidx[9999]={-1}; // maps code to index
int d[6][6][6][6][6]; // DP array : min cost of items of specific quantities
char set[6][6][6][6][6]; // whether the DP entry is valid

int find(int aa[5]){
    int i,j,k;
    if(set[aa[0]][aa[1]][aa[2]][aa[3]][aa[4]])
        return(d[aa[0]][aa[1]][aa[2]][aa[3]][aa[4]]);
    j=0;
    for(i=0;i<5;i++)
        j+=aa[i];
    if(j==0)
        return 0;
    int m=1<<30;
    for(i=0;i<noffers;i++){
        offer&o=offers[i];
        if(o.price<0)continue;
        int bb[5];
        memcpy(bb,aa,sizeof bb);
        int ok=1;
        for(j=0;j<o.nprods;j++){
            prod&p=o.prods[j];
            bb[p.idx]-=p.count;
            if(bb[p.idx]<0)
            {ok=0;break;}
        }
        if(ok){
            m=min(m,o.price+find(bb));
        }
    }
    set[aa[0]][aa[1]][aa[2]][aa[3]][aa[4]]=1;
    d[aa[0]][aa[1]][aa[2]][aa[3]][aa[4]]=m;
    return m;
}

int main(){
    ifstream in("shopping.in");
    ofstream out("shopping.out");
    in>>noffers;
    int i,j,k;
    int aa[99]={0};
    for(i=0;i<noffers;i++){
        offer&o=offers[i];
        in>>o.nprods;
        for(k=0;k<o.nprods;k++){
            in>>o.prods[k].idx>>o.prods[k].count;
        }
        in>>o.price;
    }
    in>>j;
    for(i=0;i<j;i++){
        int a,b,c;
        in>>a>>b>>c;
        codetoidx[a]=i;
        aa[i]=b;
        offer&o=offers[noffers++];
        o.price=c;
        o.nprods=1;
        o.prods[0].idx=a;
        o.prods[0].count=1;
    }
    for(i=0;i<noffers;i++){
        offer&o=offers[i];
        for(k=0;k<o.nprods;k++){
            j=o.prods[k].idx=codetoidx[o.prods[k].idx];
            if(j<0)
                o.price=-1;
        }
    }
    out<<find(aa)<<endl;
    out.flush();
}

