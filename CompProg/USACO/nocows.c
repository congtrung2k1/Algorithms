/*
ID:tbhtan31
LANG:C
TASK:nocows
*/

/*
Here are the respective outputs:
        ----- our output ---------
        5010
        ---- your output ---------
        3066
        --------------------------

        ------ Data for Run 9 ------
        177 57 
        ----------------------------
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int f[102][400];

int get(int hei, int num)
{
    if (f[hei][num] >= 0) return f[hei][num];

    int sum = 0, tmp = 0;
    int i = 0;
    int j = 0;
    
    // vary # nodes on left side
    for (j = 2*hei-3; j <= num - 2;j += 2)
    {
        int left = get(hei-1, j);
        if (left == 0) continue;
        
        // fix height on left side to be hei-1
        // vary height on right side
        tmp = 0;
        for (i = hei-2; i >= 1; i--)
        {
            tmp +=  get(i,num-1-j);
        }
        
        tmp %= 9901;
        sum = (sum + left*(tmp*2 +  get(hei-1,num-1-j))) % 9901;
    }
    
    return f[hei][num] = (sum % 9901);
}

int main()
{
    FILE * in = fopen ("nocows.in","r");
    FILE * out = fopen ("nocows.out","w");
    
    int n,k;
    
    int p = fscanf(in, "%d%d", &n,&k);
    
    //f[i][k] = w=1..n-2 f[w][k-1] * f[n-1-w][j=1..k-1];
    // let f[i][k] = no. of trees with i # nodes and height up to k
    // f[i][k] = 
    int i,j,w,q;
    for (i = 0; i < 102; i++)
    {
        for (j = 0; j < 400; j ++) f[i][j] = -1;
    }
    
    for (i = 1; i < 30;i++)
        for (j = 1; j < 400; j++){
            if ((1 << i) - 1 < j) f[i][j] = 0;
            else if ((1<<i) - 1==j  )f[i][j] = 1;
        }
        

    
   /* todo: use top down recursion */
     // for (i = 2; i <= k; i++)
     // {
         // long long* fi1 = &f[i-1][0];
         // long long maxnodes = (1<<i)-1;
         // for (q = 1; q <= maxnodes; q+=2)
         // {
             // long long sum = 0;
             // long long del = 0;
             // for (j = 1; j <= i-2; j++) /*vary height*/
             // {
                 // long long * fj = &f[j][0];
                 // for (w = 1; w <= q-2;w++)
                 // {
                     // sum = (sum+2*fi1[w] * fj[q-1-w]) ;
                  
                 // }
             // }
           
                 // for (w = 1; w <= q-2;w++)
                 // {
                    
                     // sum =(sum+ fi1[w] * fi1[q-1-w]) ;
                 // }
             // f[i][q] = sum%9901;
         // }

     // }

    get(k,n);
    fprintf(out, "%d\n",f[k][n]%9901);
    return 0;
}