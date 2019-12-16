#include<iostream>
#include<stdlib.h>
#include<string.h>
using namespace std;

int cards;
int packetSize;

double dp[50];
char has[50];
double dp2[50][50];
char has2[50][50];

// return prob of getting i new cards with j cards seen so far
// i = no. of new unique cards desired in a packet
// j = unique cards seen so far
// return choose(cards-j,i)*choose(j,packetSize-i)/
//        choose(cards,packetSize);
double ppc(int i, int j){
    if (i>packetSize) return 0;
    if (packetSize-i>j) return 0;
    if (i>cards-j)return 0;
    if (has2[i][j]) return dp2[i][j];
    double r = 1;
    int a = cards-j-i+1;  // 1..cards-j
    int b = 1; // 1..i
    int c = j-packetSize+i+1; // 1..j
    int d = 1; // 1..packetSize-i
    int e = cards-packetSize+1; // 1..cards
    int f = 1; // 1..packetSize
    bool changed= false;
    if (i==0) a  = cards;
    if (packetSize-i==0) {c = j+1; }

    do{
        changed = false;
        if (a <= cards-j){changed = true;r *= a++; }
        if (b <= i) { changed = true; r /= b; b++;}
        if (c <= j){changed=true; r *= c++;}
        if (d <= packetSize-i){changed=true; r/= d++;}
        if(e <= cards){changed=true; r /= e++;}
        if(f <= packetSize){changed=true; r *= f++;}
    }while(changed);

    has2[i][j]=1;
    return dp2[i][j] = r;
}

// return expected # cards needed with  n cards seen so far
// n = unique cards encountered
double E(int n){
    if (has[n]) return dp[n];

    if (n==cards) return 0;

    double r = 1;
    for (int i = n+1; i <= min(cards,n+packetSize);i++){
        r += ppc(i-n,n)*E(i); 
    }

    has[n] = 1;
    dp[n] = r/(1-ppc(0,n));
    return dp[n];
}

int main(){
    int nu; int casen=1; cin>>nu;
    while(nu--){
        cin >> cards >> packetSize;
        memset(has,0,sizeof has);
        memset(has2,0,sizeof has2);

        cout <<"Case #"<<casen++<<": "<< E(0) << endl;
    }
}

