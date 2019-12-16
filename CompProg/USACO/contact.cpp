/*
user: tbhtan31
LANG: C++
TASK: contact
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

int A,B,N;

struct seq{
    int freq, len, n, idx;
};

seq seqs[1<<16];
char s[200001];

int comp(const void*a,const void*b){
    const seq* s1=(seq*)a;
    const seq* s2=(seq*)b;
    int k = s1->freq-s2->freq;
    if(k)return -k;
    k=s1->len-s2->len;
    if(k)return k;
    return s1->n-s2->n;
}

int main(){
    ifstream in("contact.in");
    ofstream out("contact.out");
    int i,j;
    in>>A>>B>>N;
    int len=0;
    while(!in.eof()){
        in>>&s[len];
        len += strlen(&s[len]);
    }
    for (j=A;j<=min(len,B);j++){
        int v=0;
        for (i=0;i<j-1;i++){
            v = (v<<1) | (s[i]-'0');
        }
        for (i=j-1;i<len;i++){
            v =( (v<<1)&((1<<j)-1) )| (s[i]-'0');
            int idx = v | (1<<j);
            seqs[idx].freq++;
            seqs[idx].len=j;
            seqs[idx].n=v;
            seqs[idx].idx=i-(j-1);
        }
    }
    qsort(seqs,1<<16,sizeof seqs[0],comp);
    int count=0;
    for (i=0;count<N&&seqs[i].freq;i++){
        seq&ss=seqs[i];
        out<<ss.freq<<endl;
        count++;
        for(j=1;seqs[i].freq==ss.freq;j++,i++){
            seq&s2=seqs[i];
            char & c=s[s2.idx+s2.len];char t=c; c=0;
            if(j==7){out<<endl;j=1;}
            out<<(j==1?"":" ")<<&s[s2.idx];
            c=t;
        }
        i--;
        out<<endl;
    }
    out.flush();out.close();
    return 0;
}
