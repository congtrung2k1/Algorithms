/*
user: tbhtan31
LANG: C++
TASK: kimbits
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;
typedef unsigned int uint;
uint N,L,I;
int bitcount[256];
int ch[32][32];

int choose(int n, int x){
    if(ch[n][x]) return ch[n][x];
    int a=1,b=1,c=1;
    int i,j;
    for(i=1;i<=n;i++){
        a*=i;
        while(a%b==0&&b<=x){a/=b;b++;}
        while(a%c==0&&c<=n-x){a/=c;c++;}
    }
    return ch[n][x]=a;
}

int getbitcount(int n){
    return bitcount[n&255] + bitcount[(n>>8)&255] +
    bitcount[(n>>16)&255] + bitcount[(n>>24)&255];
}

void print(ofstream&out, int n){
    int i,j;
    for(i=N-1;i>=0;i--){
        int bit=n&(1<<i);
        out<<(bit?1:0);
    }
    out<<endl;
}

int main(){
    ifstream in("kimbits.in");
    ofstream out("kimbits.out");
    uint i,j;
    in>>N>>L>>I;
    for (i=0;i<256;i++){
        j=i; int c=0;
        while(j) {c += j&1; j>>=1;}
        bitcount[i]=c;
    }
    uint rank=0;
    for (i=0;i<65536;i++){
        int c=getbitcount(i);
        // t == # of numbers in [i*65536,(1+i)*65536-1] that are valid.
        uint t=0;
        for(j=0; j<=min((uint)16,L-c) ;j++){
            t+=(uint)choose(16,j);
        }
        if (rank+t >= I){
            j = i*65536-1;
            for (;rank<I;){
                if(getbitcount(++j)<=L)rank++;
            }
            print(out,j);
            break;
        }
        rank += t;
    }
    out.flush();out.close();
    return 0;
}

