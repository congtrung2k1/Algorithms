/**
* Algorithm:
* Dynamic programming
*/

#include<stdio.h>
#include<string.h>

typedef struct 
{
int exp;
int fav;
} ret;

// f[i][j] is the max favor for i amt of $ and j items
ret  f[12001][111];
int v[111]; // favor
int p[111]; // price
int m,n;

void find(int i,int j, ret*r)
{
    if (i==0||j<0){ r ->exp = 0; r->fav=0; return;}
    if (f[i][j].exp!=0){ *r= f[i][j]; return;}

    if (i>=p[j]){ 
        ret r1,r2;
        find(i-p[j],j-1, &r1); 
        r1.fav += v[j];r1.exp += p[j];
        find(i,j-1, &r2);
        // choose the one with more favor
        if (r1.fav>r2.fav){
            f[i][j] = r1;
            *r=f[i][j];
            return  ;
        }
        // choose the one more expensive so we can exceed 2000$
        if (r1.fav == r2.fav && r1.exp>r2.exp)
        {
            f[i][j] = r1;
            *r=f[i][j];
            return  ;
        }
        *r=( f[i][j]=r2);return;
    }
    else {ret r1; find(i,j-1,&r1); f[i][j]=r1;*r=r1;}
}

int main()
{
    while (9){
    int k=        scanf("%d%d", &m,&n);
    if (k!=2) break;

        int i,j;
        for (i=0;i<n;i++){
            scanf("%d%d", & p[i],& v[i]);
        }

    if (n==0||m==0) {printf("0\n"); continue;}
memset(f,0,sizeof(f));
    int morig = m;
        if (m > 1800)m+=200;
        ret ans ;
        ans.fav=0; ans.exp=0;
        find(m,n-1,&ans);
        if (ans.exp <= 2000) {
            find(morig, n-1, &ans);
        } 

        printf("%d\n",ans.fav);
    }
}



