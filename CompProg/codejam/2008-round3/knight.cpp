/**
 * Algorithm:
 *  - Transform the knight's possible movement into another lattice
 *  - Use Manhanttan grid formula to count number of paths
 *  - Use inclusion-exclusion to exclude the paths containing rocks
 */
#include <iostream>
#include <string.h>
#include<stdlib.h>

using namespace std;

int H,W,R;
struct rock {int  r,c;};
rock rocks[100];
const int mod = 10007;
typedef long long ll;

ll inv[mod+2]; // inv[i] == mult inv of i mod p


ll ext_gcd(ll a, ll b){
    ll x=0; ll y= 1; ll bb=b;
    ll lastx = 1; ll lasty = 0;
    while (b>0){
        ll q = a / b;
        ll t = a;
        a = b;
        b = t % b;
        t = x; x = lastx - q*x;
        lastx = t;
        t = y; y = lasty - q*y;
        lasty = t;
    }

    while( lastx<0) lastx += bb;
    return lastx;
}


ll choosemod(ll m, ll n){
    ll ret = 1;
    if ( n==0) return 1;
    if ( n > m) return 0;
    if ( m < mod) {
            for (int a = m-n+1; a <= m ;a++){
                ret = (ret * a) % mod;
            }
            for (int a = 1; a <= n; a++)
                ret = (ret * inv[a]) % mod;
    }
    else
    {
            // recursive using lucas' theorem
            // m choose n mod p == prod (mi choose ni) mod p
            while (m||n){
                ret = (ret * choosemod(m%mod, n%mod)) % mod;
                m/= mod;
                n/=mod;
            }
    }
    return ret;
}

ll f(int s){
      ll ret = 1;
      int prevr = 0; int prevc = 0;
      for (int i = 0; i < R;i++){
        int bit = s & (1<<i);
        if (bit==0) continue;
        rock & rock = rocks[i];
        if ((rock.c < prevc || rock.r < prevr)) return 0;
        ret = (ret * choosemod(rock.c  - prevc + rock.r - prevr, rock.c-prevc)) % mod;
         prevc = rock.c; prevr = rock.r;
      }
      ret = (ret * choosemod(W-prevc+H-prevr,W-prevc)) %mod;
      return ret;
}

int comp(const void * a , const void *b){
    rock * r1 = (rock*) a;
    rock * r2 = (rock*) b;
    int k = r1->c - r2->c;
    if (k!=0) return k;
    return r1->r - r2->r;
}

// count number of bits
int count (int i ){
    int c= 0 ;
    while (i){ if (i&1) c ++; i >>= 1; }
    return c;
}

// maps r & c to r2 and c2
// return true if transformed and within bounds
bool map(ll r, ll c, int & r2, int & c2){
    r2 = r-1-(r+c-2)/3;
    c2 = c-1-(r+c-2)/3;
    return (r+c)%3==2 && r2 <= H && c2 <= W && r2 >= 0 && c2 >= 0;
}

int main(){
    for (int i = 1; i <= mod; i++){
        inv[i] = ext_gcd(i,mod);
    }
    int nu; cin >> nu; int casen = 1;
    while (nu--){
        cin >> H >> W >> R;
        bool can = map(H,W,H,W);
        ll ret = 0;
        // need to read the rocks no matter what...
            int idx = 0;
            for (int i = 0; i < R; i++){
                int a,b;
                cin >> a >> b;
                if (map(a, b, rocks[idx].r, rocks[idx].c))
                    idx++;
            }
            R=idx;
        if (can){
            qsort(rocks, R, sizeof(rock), comp);
            for (int i = 0;  i < (1<<R); i++){
                ret = (mod + ret + f(i) * (count(i)%2 ? -1 : 1)) % mod;
            }
            while(ret<0)ret += mod;
        }
        cout << "Case #" << casen++ << ": " << ret << endl;
    }
}
