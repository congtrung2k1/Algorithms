/*
user: tbhtan31
LANG: C++
TASK: spin
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

struct wedge{int start, span;};
struct wheel{int nwedges,speed;wedge w[5];};
wheel wheels[5];
int a[5];
int ans;

// find intersection of [a,b] and [c,d]
void inter(int a, int b, int c, int d, int&e, int&f){
// this is tedious because we don't assume angle is discrete
// and we handle circular cases.
    if(a>b){
        if(c>d){
            e=max(a,c); f=min(b,d);
        }
        else{
            if(c <= a && a <= d){e=a; f=d;}
            else if(a<=c){e=c;f=d;}
            else if(c <= b && b <= d){e=c;f=b;}
            else if(b>=d){e=c;f=d;}
            else{e=f=-1;}
        }
    }
    else if(c>d){
        if(a <= c && c <= b){e=c; f=b;}
        else if(c<=a){e=a;f=b;}
        else if(a <= d && d <= b){e=a;f=d;}
        else if(d>=b){e=a;f=b;}
        else f=e=-1;
    }
    else{
        if(a <= c && c <= b){e=c; f=min(b,d);}
        else if(a <= d && d <= b){e=a; f=min(b,d); }
        else if(c <= a && b <= d){e=a; f=b;}
        else{
            e=f=-1;
        }
    }
}

void find(int depth){
    int i,j;
    if(depth==5){
        for(j=0;j<360;j++){
            int e=wheels[0].w[a[0]].start + wheels[0].speed * j;
            int f=wheels[0].w[a[0]].span+e;
            for(i=1;i<5;i++){
                wedge&w = wheels[i].w[a[i]];
                int c=w.start+wheels[i].speed*j;
                int d = c+w.span;
                e %= 360; f %= 360;
                inter(c%360, d%360, e,f, e,f);
                if (e <0)break;
            }
            if (e >=0)
            {ans=min(ans,j);break;}
        }
        return;
    }

    wheel&w=wheels[depth];
    for(j=0;j<w.nwedges;j++){
        a[depth]=j;
        find(depth+1);
    }
}


int main(){
    ifstream in("spin.in");
    ofstream out("spin.out");
    int i,j,k;
    for (i=0;i<5;i++){
        wheel&w = wheels[i];
        in>>w.speed>>w.nwedges;
        for (j=0;j<w.nwedges;j++){
            in>>w.w[j].start>>w.w[j].span;
        }
    }
    ans=999;
    find(0);
    if (ans<999)out<<ans<<endl;
    else out<<"none"<<endl;
    out.flush();out.close();
    return 0;
}
