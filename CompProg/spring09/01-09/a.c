#include<string.h>
#include<stdio.h>

int grid[1001][1001];

int main(){

    int i,j , r, c;
    scanf ("%d%d", & r, &c);
    for ( i = 0; i < r ;  i++){
        for (j=0; j < c; j ++){
            scanf("%d",&grid[i][j]);
        }
    }
    long long area = 0;
    for (i=0; i < r; i++){
        for (j=0; j < c; j++){
        
            int cur = grid[i][j];
            int top = i > 0 ?  grid[i-1][j] : 0;
            int bot = i < r-1 ? grid[i+1][j] : 0;
            int left = j> 0 ?grid[i][j-1] : 0;
            int right = j<c-1 ? grid[i][j +1]:0;

            
            if (left<cur) area += cur-left;
            if (right <cur) area += cur-right;
            if (top<cur) area += cur-top;
            if(bot<cur) area += cur-bot;
                area++;
        }
    }
    printf("%lld\n",area);
}


