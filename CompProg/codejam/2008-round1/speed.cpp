/**
 * This is the slower version based on a non-balanced tree.
 */

#include<stdio.h>
#include<iostream>
#include<string.h>
typedef long long ll;
struct node{
    int count;
    int num;
    int left;
    int right;
};

node nodes[500005];
int root;
int next;

const ll mod = 1000000007;
// returns idx
int insert(int cur, int num, int &acc){
    
    if (cur<0){
        nodes[next].num=num;
        nodes[next].count = acc;
        nodes[next].left = -1;
        nodes[next].right=-1;
        return next++;
    }

    node&root = nodes[cur];
    if (root.num >= num){
        root.left= insert(root.left, num, acc);
    root.count = (root.count+acc)%mod;
        return cur;
    }
    acc =(acc+(ll)root.count)%mod;
    root.right = insert(root.right, num, acc);
    return cur;
}
using namespace std;
int A[500005];
int S[500005];
int map[500005];
int comp(const void * a , const void *b){
    return *(int*)a- *(int*)b;

}
#include<stdlib.h>
int main(){
    int nu; int casen=1;
    cin >> nu;
    while(nu--){
        ll n,m,x,y,z;
        cin >> n >> m >> x >> y >> z;
        memset(nodes,-1,sizeof nodes);
        root = -1;
        next = 0;
        for (int i = 0; i <m;i++){
            cin >> A[i];
        }
        ll sum = 0;
        for (int i = 0;  i<n;i++){
            S[i] = A[i%m];
            A[i%m] = (x*A[i%m]+y*(i+1))%z;
        }

        qsort(S, n, sizeof (int), comp);

        int idx = 0;
        int prev = -1;
        for (int i = 0;i < n;i++){
            int newprev = S[i];
            // NOTE: will crash here if newprev is too large
            if (S[i] != prev) map[newprev] = ++idx;
            prev = newprev;
        }
        for (int i = 0; i < n;i++){
            int acc = 1;
            root = insert(root, map[S[i]], acc);
            sum = (sum+acc)%mod;
         }
        cout <<"Case #"<<casen++ <<": "<<sum<<endl;
    }
}



