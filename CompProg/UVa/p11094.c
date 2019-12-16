/**
Algorithm:
Flood fill

Gotchas:
- M is the # of rows!
  So 'x' is the row index! Different from the usual meaning of 'y'
- The letters can be anything other than l and w
  The king's position tells you what represents land
- Grid wraps around at column 0 and N-1
- Look for largest area except the initial King's land
- Diagonally adjacent doesn't count
*/

#include<string.h>
#include<stdio.h>


char grid[22][22]; // true iff land
char visited[22][22];
int nrow,ncol;
char land;
int find(int r, int c){
    if (land!=grid[r][c] ||visited[r][c]) return 0;
    visited[r][c]=1;
    int sum = 1 + find(r,(c+1)%ncol)+find(r,(ncol+(c-1))%ncol);
    if (r>0){
        sum+= find(r-1,c) ;
    }

    if (r<nrow-1){
        sum+= find(r+1,c);
     }

     return sum;
}


int main(){
    while (9){
        int k=scanf("%d%d", &nrow,&ncol);
        if (k!=2)break;
        int i,j; memset(visited,0,sizeof(visited));
        char s[999]; gets(s);
        for (i=0;i<nrow;i++){
            gets(&grid[i][0]);
        }
        int x,y;
        scanf("%d%d",&x,&y);
         land = grid[x][y];
find(x,y);
        int max = 0;
        for (i=0;i<nrow;i++){
            for (j=0;j<ncol;j++){
                int a = find(i,j);
                if (a > max)max=a;
            }
        }
        printf("%d\n", max);
    }
}


