/**
 * Note that s[0]+...+s[M-1] == (N-1)(a[0]+...a[N-1]), so find N-1 numbers is enough.
 * Also,
 * s[0] == a[0]+a[1]
 * s[1] == a[0]+a[2]
 * s[M-2] == a[N-1]+a[N-3]
 * s[M-1] == a[N-1]+a[N-2]
 * Brute force to guess a[1]+a[2], a[2]+a[3], a[2]+a[4], a[N-2]+a[N-3], to find all
 * numbers. Then run thru the M pairs to check for consistency.
 * Max Total runtime would be (32 choose 4)*M which is about 1 mill.
 */
#include<iostream>
#include<cstdlib>
#include<cstring>
using namespace std;
typedef long long ll;

int s[99],a[99],N,M;

int comp(const void*a,const void*b){
    return *(int*)a-*(int*)b;
}

int check(){
    int i,j,t[40],m=0;
    for(i=0;i<N;i++)
        for(j=i+1;j<N;j++)
            t[m++]=a[i]+a[j];
    qsort(t,m,sizeof t[0],comp);
    return memcmp(t,s,sizeof t[0]*m)==0;
}

int main(){
    while(cin>>N){
        int i,j,k,p;
        M=N*(N-1)/2;
        ll sum=0;
        for(i=0;i<M;i++){
            cin>>s[i];
            sum+=s[i];
        }
        sum/=N-1;
        int solved=0;
        qsort(s,M,sizeof s[0],comp);
        for(i=2;i<M;i++){
            ll t=((ll)s[0]+s[1]-s[i])/2;
            a[0]=t;
            a[1]=s[0]-t;
            a[2]=s[1]-t;
            if(N==3){
                if(check()){solved=i=j=k=p=1<<30;break;}
                continue;
            }
            for(j=i+1;j<M;j++){
                a[3]=s[j]-a[2];
                if(N==4){
                    if(check()){solved=i=j=k=p=1<<30;break;}
                    continue;
                }
                for(k=j+1;k<M;k++){
                    a[4]=s[k]-a[2];
                    if(N==5){
                        if(check()){solved=i=j=k=p=1<<30;break;}
                        continue;
                    }
                    for(p=k+1;p<M;p++){
                        t=((ll)s[M-1]+s[M-2]-s[p])/2;
                        a[N-3]=t;
                        a[N-2]=s[M-1]-t;
                        a[N-1]=s[M-2]-t;
                        if(N==9)a[5]=sum-a[0]-a[1]-a[2]-a[3]-a[4]-a[6]-a[7]-a[8];
                        if(check()){solved=i=j=k=p=1<<30;break;}
                    }
                }
            }
        }
        if(solved){
            qsort(a,N,sizeof a[0],comp);
            for(i=0;i<N;i++)
                cout<<(i?" ":"")<<a[i];
            cout<<endl;
        }else cout<<"Impossible"<<endl;
    }
    return 0;
}
