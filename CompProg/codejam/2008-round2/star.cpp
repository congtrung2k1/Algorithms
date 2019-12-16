/**
 * Algorithm:
 * Binary search + inequalities
 */
#include<stdio.h>
#include<iostream>
#include<string.h>
#include<cmath>
using namespace std;

int x[10000];
int y[10000];
int z[10000];
int p[100000];

// whether [a,b] intersects with [c,d]
bool inter(double a, double b, double c, double d){

    double t = a;
    a = min(a,b);
    b = max(b,t);
    t = c;
    c = min(d,c);
    d = max(t,d);
    return (c <= b && b <= d )||
            (c <= a && a <= d) ||
            (a <= c && c <= b);
}

// whether power pp works
bool can(double pp, int t){
    double A=-1e99,B=1e99,C=-1e99,D=1e99,E=-1e99,F=1e99,G=-1e99,H=1e99;
    for (int i = 0; i < t; i++){
         A = max(A,x[i]+y[i]+z[i] - p[i]*pp);
         B = min(B,x[i]+y[i]+z[i]+p[i]*pp);
         C = max(C,x[i]+y[i]-z[i]-p[i]*pp);
         D = min(D,x[i]+y[i]-z[i]+p[i]*pp);
         E = max(E,x[i]-y[i]+z[i] - p[i]*pp);
         F = min(F,x[i]-y[i]+z[i]+p[i]*pp);
         G = max(G,-x[i] + y[i] + z[i] - p[i]*pp);
         H = min(H,-x[i] + y[i] + z[i] + p[i]*pp);
    
    }
    
    if ( !( A<=B && C<=D && E<=F && G<=H)) return false;
    return inter((A-H)/2, (B-G)/2, (C+E)/2, (D+F)/2);  
}
int main(){
    int nu;cin >> nu; int casen=1;
    while(nu--){
        int t;cin >> t;
        for (int i = 0; i < t;i++){
            cin >> x[i] >> y[i] >> z[i]>>p[i];
        }

        double lo = 0;
        double hi = 4*1e6;
        double ans = -1;
        while ((lo< hi)){
            double m = (lo+hi)/2;
            if(can(m,t)) { ans=m; hi = m-1e-7;}
            else lo = m+1e-7;
        }

        printf("Case #%d: %0.6f\n", casen++ , ans);
    }
}

