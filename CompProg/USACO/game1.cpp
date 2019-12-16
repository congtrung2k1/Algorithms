/*
LANG: C++
TASK: game1
*/
/**
 * Dynamic programming.
 */
#include<fstream>
#include<cstring>
using namespace std;
int N;
int seq[101];
int d[101][101];

// returns max score for current player.
// we can reuse the same function as both players use the same strategy.
// total == (seq[a] + ... + seq[b])
int find(int a,int b,int total){
    int&m=d[a][b];
    if(m)return m;
    if(a==b){
        return total;
    }
    // scores of opponent (next player).
    int s1 = find(a+1,b,total-seq[a]);
    int s2 = find(a,b-1,total-seq[b]);
    // minus off the minimum possible score for opponent.
    return m=total-min(s1,s2);
}

int main(){
    ifstream in("game1.in");
    ofstream out("game1.out");
    in>>N;
    int i,j,total=0;
    for(i=0;i<N;i++){
        in>>seq[i];
        total+=seq[i];
    }
    j=find(0,N-1,total);
    out<<j<<" "<<(total-j)<<endl;
}


