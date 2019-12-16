/*
user: tbhtan31
LANG: C++
TASK: fracdec
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
#include<cmath>
using namespace std;

int visited[100011];
char digits[100001];
char output[200000];
int n,d;

void doit();

int main(){
    ifstream in("fracdec.in");
    in>>n>>d;
    doit();
    return 0;
}
void doit(){
    ofstream out("fracdec.out");
    memset(visited,-1,sizeof visited);
    int i,j;
    int len=sprintf(output,"%d.",n/d);
    n %= d;
    if (n==0){
        out<<output<<'0'<<endl;
        return;
    }
    int count=0;
    int repeat=-1;
    while(n){
        int a =n*10;
        int b = a/d;
        if(visited[n]>=0){
            repeat=visited[n];
            break;
        }
        visited[n]=count;
        digits[count++]=b;
        n = a % d;
    }
    for (i=0;i<count;i++){
        int d=digits[i];
        if(i==repeat){
            output[len++]='(';
        }
        output[len++]=d+'0';
    }
    if(repeat>=0)output[len++]=')';
    for(i=0;i<len;i++){
        out<<output[i];
        if((i+1)%76==0||i==len-1)out<<endl;
    }
    out.flush();
}
