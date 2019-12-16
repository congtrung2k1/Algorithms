/*
user: tbhtan31
LANG: C++
TASK: stamps
*/
/**
 * Dynamic programming: store the least number of stamps needed to form
 * a given value. Then for i from 1 to ..., go thru each stamp and you figure out :)
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

int K,N,stamps[201];
int p[2000001];

int main(){
    ifstream in("stamps.in");
    ofstream out("stamps.out");
    int i,j;
    in>>K>>N;
    for (i=0;i<N;i++)in>>stamps[i];

    for(i=1;;i++){
        int m=1<<30;
        for(j=0;j<N;j++){
            int v = i-stamps[j];
            if(v<0)continue;
            m=min(m,p[v]+1);
        }
        p[i]=m;
        if(m>K)break;
    }
    out<<i-1<<endl;
    out.flush();out.close();
    return 0;
}
