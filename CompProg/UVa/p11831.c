#include<stdio.h>
#include<string.h>


#define empty 0
#define sticker 1
#define pillar 2

int orient; // 0-3
char in[99999]; // nul term
int r,c;
char grid[102][102];
// NESW
int ddr[] = {-1,0,1,0};
int ddc[] = {0,1,0,-1};
int stick =0;
int nrows; int ncols;
void doit(){
    int i,j;
    for (i=0; in[i];i++){
        char c0 = in[i]; int nr,nc;
        if (c0=='D'){
            orient = (4+(orient+1))%4;continue;
        } if (c0=='E'){
            orient = (4+(orient-1))%4; continue;
        }
        nr = ddr[orient]+r;
        nc = ddc[orient]+c;
      //  printf("%d %d\n",nr,nc);
        if (nr < 0 || nr >= nrows || nc < 0 || nc>=ncols){
            continue;
        }
        char nxt = grid[nr][nc];
        if (nxt == sticker){
            grid[nr][nc]=empty;stick++; r=nr;c=nc;
        }else if (nxt == pillar){
            continue;
        }
        r=nr;c=nc;
    }
}

int main(){

    while(9){ int s;
        scanf("%d%d%d", &nrows, &ncols, &s);
        if (nrows + ncols+s==0) break;
        int i,j; char tmp[9]; gets(tmp);
        for (i=0;i<nrows;i++){
            char ss[9999];
            gets(ss);
            for (j=0;j < ncols;j++){
                char c0=ss[j];
                grid[i][j]=empty;
                if (c0=='*') grid[i][j] = sticker;
                else if (c0=='#')grid[i][j] = pillar;
                else if (c0=='N') {r=i;c=j;orient =0;}
                else if (c0=='S') {r=i;c=j;orient = 2;}
                else if(c0=='L'){r=i;c=j;orient=1;}
                else if (c0=='O'){r=i;c=j;orient=3;}
            }
        }
        gets(in);
        stick=0;doit();
        printf("%d\n",stick);
    }
}



