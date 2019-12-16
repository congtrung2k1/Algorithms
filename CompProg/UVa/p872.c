/**
Algorithm:
Backtracking

*/
#include <stdio.h>
#include<string.h>

int before[30][30]; // before[i] => list of idx that i must appear before
int nei[30]; // length of before[i] list
int bcnt[30]; // bcnt[i] = # of candidates that must be before i
int curbcnt[30]; 
char out[20999999]; // output buffer
int outidx; // current index for output buffer
int n; // # nodes
char pos[260];
char stk[90]; // stack

// returns log(m) base 2
inline int getpos(int m){
    if (m <= (1<<8)) return pos[m];
    if (m <= (1<<16)) return 8+pos[m>>8];
    if (m <= (1<<24)) return 16+pos[m>>16];
    return 24+pos[m>>24];
}


void gen(int depth,int mask){
    int i,j;

    if(depth==n){
        stk[2*depth-1]='\n';
        memcpy(&out[outidx], stk,2*depth);
        outidx+=2*depth;
        return;
    }
   
    int origmask = mask;
    while(mask){
        int m = (mask) & (-mask);
        int p = getpos(m);
        stk[2*depth] = p+'A';
        stk[2*depth+1]=' ';
        int cnt = nei[p];
        int more=0; 
        for (i=0;i<cnt;i++){
            int bef = before[p][i];
            if (++curbcnt[bef]==bcnt[bef]) {
                more |= 1<<bef;
            }
        }

        mask ^= m;
        gen(depth+1,(origmask ^ m)|more);
        for (i=0;i<cnt;i++){
            int bef = before[p][i];
            --curbcnt[bef];
        }
    }

}
char active[30];
char in[400*5];
int main(){
    int nu;scanf ("%d",&nu); 
    gets(in);
    gets(in);
    int k;
    for (k= 0; k <= 8;k++){
        pos[1<<k]=k;
    }
    while (nu--){
        gets(in);
        memset(active,0,sizeof(active));
        int i,j; n=0;
        for (i=0; in[i];i++){
            char c = in[i];
            if ( 'A' <= c && c <= 'Z'){
                active[c-'A'] = 1; n++;
            }
        }
        
        // read constraints
        gets(in); memset(nei,0,sizeof(nei));
        memset (bcnt,0,sizeof(bcnt));
        for (i=0;  in[i];i++){
            char c = in[i];
            if (c=='<'){
                int a = in[i-1]-'A';
                int b = in[i+1] - 'A';
                before[a][ nei[a] ++ ] = b;
                bcnt[b]++;
                i+=2;
            }
        }
        // read blank line
        outidx = 0;
        gets(in);

        // generate initial candidates
        int mask = 0;
        memset(curbcnt,0,sizeof(curbcnt));
        for (i=0;i<27;i++){
            if (bcnt[i] ==0&&active[i]) mask |= 1<<i;
        }

        // generate output
        gen(0,mask);

        if (outidx ){
        out[outidx]=0;
        printf("%s", out);
        }else printf("NO\n");

        if (nu) printf("\n");
    }
}

