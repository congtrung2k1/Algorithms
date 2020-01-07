#include<bits/stdc++.h>
using namespace std;

typedef long long int lli;
lli x;

lli get(lli cs, lli mu){
    if (mu == 0) return 1;
    lli q = get(cs, (lli)mu / 2);
    if (mu%2 == 0)
        return (q * q) % 29;
    else return (q * q * cs) % 29;
}


int main(){
    cin >> x;
    while (x!=0){
        lli a = (get(2, 2*x+1) - 1) % 29;
        lli b = (get(3, x+1) - 1) % 29;
        lli c = (get(167, x+1) - 1) % 29;
        lli d = (get(332, 27) % 29) % 29;
        cout << (a*b*c*d) % 29 << endl;
        cin >> x;
    }
    
    return 0;
}