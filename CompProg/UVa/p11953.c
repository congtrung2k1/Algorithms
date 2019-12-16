/**
Algorithm:

Flood fill

*/
#include<stdio.h>
#include<string.h>

struct ret{
 int hit, none;
};

int ncol, nrow;
char visited[101][101];
char grid[101][101];

ret find (int r0, int c){
    if (visited[r0][c] || grid[r0][c] == '.'){
      ret r;r.hit=r.none=0;  return r;
    }
    visited[r0][c] =1;
    ret r;
    r.hit =( grid[r0][c] == '@' ? 1 : 0 );
    r.none =1- r.hit; 
    ret r2 ;
    if (c > 0){
        r2 = find(r0, c-1); r.hit += r2.hit; r.none += r2.none;
    }
    if (c<ncol-1) // r2 = find(r, c+1);
     {   r2 = find(r0, c+1); r.hit += r2.hit; r.none += r2.none;}

    if (r0 > 0) // r2 = find(r, c+1);
     {   r2 = find(r0-1, c); r.hit += r2.hit; r.none += r2.none;}

    if (r0<nrow-1) // r2 = find(r, c+1);
     {   r2 = find(r0+1, c); r.hit += r2.hit; r.none += r2.none;}

     return r;
}
int cc=1;
int main(){ int nu; scanf("%d", &nu);
    while (nu--){ int n;
            scanf ("%d", &n);ncol=nrow=n;
            int i,j; char s[99]; gets(s);
            for (i=0;i< n;i++){
                 gets(&grid[i][0]);
            }
        memset (visited, 0,sizeof(visited)); int ship=0;
        for (i=0;i<n;i++){
             for (j=0;j < n;j++){
                 ret r = find(i,j);
                 if ( r.none ) ship++;
             }
        }

        printf("Case %d: %d\n",cc++,ship);
    }
}
