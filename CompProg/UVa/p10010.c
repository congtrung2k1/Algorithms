#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char grid[60][60];
int rows, cols;
int wordsCount;
char words[21][55];
int found[55];
int rr[55];
int cc[55];

char u(int ch)
{
    if ('a' <= ch && ch <= 'z') return ch-'a'+'A';
    return ch;
}
int r(int i, int j, int di, int dj, char*word)
{
    int r=i,c=j,k;
    int matched = 0;
    while (word[matched] && 0 <= r && r < rows && 0 <= c && c < cols){
        if (u(word[matched]) == u(grid[r][c])) matched++;
         else return 0;
         r += di;
         c += dj;
    }
    return word[matched]==0;

}
int check(int i, int j, char*word, int widx)
{
    if (u(grid[i][j]) != u(word[0])) return 0;
    int k= r(i,j,0,1,word) ||
           r(i,j,1,0,word) ||
           r(i,j,1,1,word) ||
           r(i,j,0,-1,word) ||
           r(i,j,-1,0,word)||
           r(i,j,-1,-1,word)||
           r(i,j,1,-1,word)||
           r(i,j,-1,1,word);
      if (k) { rr[widx] = i+1; cc[widx]=j+1;}
    return k;
}

void doit()
{
    int i,j,k;
    for (i=0;i<rows;i++){
        for (j=0;j<cols;j++){
        
            for(k=0;k<wordsCount;k++){
                if (found[k]) continue;
                if (check(i,j,&words[k][0],k)){found[k] = 1;}
                
            }
            
        }
    }
}

int main()
{
    int num;
    scanf("%d",&num);int first= 1;
    while(num--){
        if (!first) printf("\n");
        first = 0;
        memset(found,0,sizeof(found));
        scanf("%d%d",&rows,&cols);
        int i;
        for (i=0;i<rows;i++)
        {
            scanf("%s",&grid[i][0]);
        }
        scanf("%d",&wordsCount);
        for(i=0;i<wordsCount;i++)
            scanf("%52s", &words[i][0]);
        doit();
        // todo: print indices
        for (i=0;i<wordsCount;i++)
            printf("%d %d\n", rr[i], cc[i]);
    }
    return 0;
}
