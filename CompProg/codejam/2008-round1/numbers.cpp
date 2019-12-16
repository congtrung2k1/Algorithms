#include <stdio.h>
#include <stdlib.h>
#include<string.h>

// a = m1*m2
void times(int a[2][2], int m1[2][2] , int m2[2][2] ){
    memset(a,0,sizeof (int)*2*2);
    for (int i = 0; i < 2; i++)
        for (int k=0;k < 2;k++)
            for (int  j=0;j<2;j++)
                {a[i][j] += m1[i][k]%1000 * m2[k][j]%1000;
                a[i][j] %= 1000;
                }
}

void mult(int p, int ret[2][2]){
    if (p == 1){
        ret[0][0] = 3;
        ret[0][1] = 5;
        ret[1][0] = 1;
        ret[1][1] = 3;
        return ;
    }

    int m1[2][2];
    mult(p/2,m1);
    times(ret, m1,m1);
    
    if (p%2)
    {
        mult(1,m1);
        int ret2[2][2];
        times(ret2, m1, ret);
        memcpy(ret, ret2, sizeof ret2);
    }
}

int main(){
    int nu; 
    scanf ("%d", &nu); 
    int casen=1;

    while (nu--){ int p;
        scanf("%d", &p);

        int ans[2][2];
        mult(p-1,ans);
        int sum = (3*ans[0][0] +ans[0][1])*2;
        sum = (sum+999)%1000;
        
        printf("Case #%d: %03d\n", casen++, sum);
    }
}



