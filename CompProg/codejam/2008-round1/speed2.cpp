/**
 * This is the faster version using binary indexed tree
 */
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<unordered_map>
typedef long long ll;
int comp(const void *a, const void *b){
    return *(ll*)a-*(ll*)b;
}


ll A[500005];
ll tree[500005];
ll out2[500005];
ll out[500005];
ll maxval;
ll n,m,x,y,z;
std::unordered_map<ll,int> mapy;

const ll mod = 1000000007;

// bin indexed tree
void update(int idx, int delta){
    while (idx <= maxval){
        tree[idx] += delta;
        tree[idx] %= mod;
        idx += (idx& -idx);
    }
}

ll read(int idx){
    ll sum=0;
    while(idx){
        sum+=tree[idx];
        sum %= mod;
        idx -= (idx &-idx);
    }return sum%mod;
}

int main(){
    int nu;
    scanf ("%d",&nu); int casen=1;
    while (nu--){
            scanf("%lld%lld%lld%lld%lld", &n,&m,&x,&y,&z);
memset(tree,0,sizeof tree);
            for (int i = 0;i < m;i++){
                scanf("%lld", &A[i]);
            }
       for (int i = 0; i < n;i++){
            out[i] = out2[i] = A[i%m];
            A[i%m] = (x*A[i%m]+y*(i+1))%z;
       }
        
        qsort(out, n, sizeof (ll), comp);
        int nxt=1;int prev=-1;
        
        // normalize the seq values        
        for (int i = 0; i < n;i++){
            if (prev != out[i]) mapy[out[i]] = nxt++;
            prev=out[i];
        }
        
        maxval = nxt;
        for (int i = 0;i<n;i++){
            int cur = mapy[out2[i]];
            update(cur,1+ read(cur-1));
        }
        printf("Case #%d: %d\n", casen++, (int)read(nxt-1));
    }
}

