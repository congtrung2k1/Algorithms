/**
 * Algorithm:
 * Brute force find all subsets that are minority and keep track of
 * each minority's votes #
 * Then for each party, find the power index
 *
 * */
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int v[1010]; // v[i] is # coalitions that have exactly i votes
int w[1010][22]; // w[i][p] is # coalitions that have i votes involving party p
int par[22]; // # members in each party
int maxidx=0;
int npar;
int maj; // min votes needed to form majority
int stk[22];

void  find(int depth, int stkcnt,  int sum)
{
    if (sum >= maj){
        return ;
    }

    if (depth==npar){
        if (sum > maxidx) maxidx=sum;
        int i;
        v[sum]++;
        for (i=0;i<stkcnt;i++){
            w[sum][ stk[i] ]++;
        }
        return;
    }

    find(depth+1, stkcnt , sum);
    stk[stkcnt] = depth;
        find(depth+1, stkcnt+1,sum + par[depth]);
}

int main(int argc, char**argv)
{
    int nu;
    scanf("%d", &nu);
    for (int cc = 1; cc <= nu;cc++){
        scanf("%d", &npar);
        int sum = 0;
        for (int i = 0; i < npar; i++){
            scanf("%d", &par[i]);
            sum += par[i];
        }

        if (sum % 2 ) // odd
            maj = (sum+1)/2;
        else maj = sum/2 + 1;

        maxidx=0;
        memset(v,0,sizeof(v));
        memset(w,0,sizeof(w));
        int i,j; find(0,0,0);
        for (i=0;i<npar;i++){
            int pp = par[i];
            int pwr = 0;
            if (pp >= maj) j = 0;
            else j = maj-pp;
            for (; j <= maxidx ;j++){
               pwr += v[j]; 
               pwr -= w[j][ i];
            }
            printf("party %d has power index %d\n", i+1, pwr);
        }
        printf("\n");
    }
    return 0;
}

