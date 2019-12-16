/*
LANG: C++
TASK: heritage
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

char in[30];
char pre[30];
char post[30];
int npost;

void make(int in1, int in2, int pre1, int pre2){
    char a=pre[pre1];
    int i,j, inidx;
    for(i=0;i<=in2;i++){
        if(in[i]==a)break;
    }
    inidx=i;
    if(inidx>in1){
        make(in1,inidx-1,pre1+1,pre1+inidx-in1);
    }
    if(inidx<in2){
        make(inidx+1,in2,pre1+inidx-in1+1,pre2);
    }
    post[npost++]=a;
}

int main(){
    ifstream fin("heritage.in");
    ofstream fout("heritage.out");
    int i,j;
    fin>>in>>pre;
    int len=strlen(in);
    make(0,len-1,0,len-1);
    fout<<post<<endl;
    fout.flush();fout.close();
    return 0;
}
