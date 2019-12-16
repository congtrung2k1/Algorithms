/*
user: tbhtan31
LANG: C++
TASK: combo
*/
#include<iostream>
#include<fstream>
#include<cstdlib>
#include<cstring>
using namespace std;

int N;

int overlap(int a, int b, int x, int y){
    if (a <= x && x <= b)
        return min(y,b)-x+1;
    if (a <= y && y <= b)
        return y - max(a,x)+1;
    return 0;
}

int overlap(int a, int b){
    int a1 = min(a,b)-2;
    int a2 = min(a,b)+2;

    int b1 = max(a,b)-2;
    int b2 = max(a,b)+2;

    if (a1 < 1){
        if(b1 < 1)
            return overlap(a1,a2,b1,b2);
    }
    return overlap(a1+N,a2+N, b1,b2)+overlap(a1,a2,b1,b2);
}

int main(){
    ifstream in("combo.in");
    ofstream out("combo.out");
    in>>N;
    int i,j;
    int a,b,c;
    int d,e,f;
    in >> a>>b>>c>>d>>e>>f;
    int ans = N <= 5 ? N*N*N : (5*5*5 *2 - overlap(a,d) * overlap(b,e) * overlap(c,f));
    out << ans << endl;
    out.close();
    return 0;
}

