/*
user: tbhtan31
LANG: C++
TASK: fact4
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

int N;

int main(){
    ifstream in("fact4.in");
    ofstream out("fact4.out");
    int i,j;
    in>>N;
    j=1;
    for(i=1;i<=N;i++){
        j *= i;
        while(j%10==0) j/=10;
        j %= 10000;
    }
    out<<j%10<<endl;
    out.flush();out.close();
    return 0;
}

