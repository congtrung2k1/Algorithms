#include<stdio.h>
#include<stdlib.h>
#include<string.h>
typedef long long ll;
struct node{
    ll f[211];
};

char str[100];
int len;
node dp[45];
char has [45];
node zero;
node find(int idx){
    if (has[idx]) return dp[idx];

    if (idx == len){
        zero.f[0] = 1; return zero;
    }

    node s;
    memset(&s, 0,sizeof s);
    int sum = 0;
    for (int i = idx;i < len;i++){
        sum = (sum*10 + str[i] - '0') %210;
        node nxt = find(i+1);

        for (int j = 0; j < 210;j++){
            s.f[j] += nxt.f[(j+sum)%210] + nxt.f[(420+j-sum)%210];
        //    s.f[(sum-j+420)%210] += nxt.f[j];
          //  s.f[(j+sum)%210] += nxt.f[j];
        }
    }

    has[idx]=1;
return    dp[idx] = s;

}

int main(){
    int nu;scanf("%d",&nu);
    int casen=1;gets(str);
    while(nu--){
        gets(str); len = strlen(str);
        
        memset(has,0,sizeof has);node s = find(0);
        ll sum = 0;
        for (int i = 0; i < 210;i++){
            if (i % 2 == 0 ||
                i % 3 == 0||
                i % 5==0||
                i %7==0) sum+=s.f[i];
        }
        printf("Case #%d: %lld\n", casen++,sum/2);

    }
}


