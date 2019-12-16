#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int adj[30][30];
int nei[30];
char visited[30];
int ntrees;
int nacorns;
int q[1000];


int doit(int start)
{
    int qidx=0;
    int qn = 1;
    q[0]=start;
    int acorn = 1;

    while(qidx<qn){
        int cur = q[qidx];
        int cnt = nei[cur];
        for (int i=0;i<cnt;i++){
            int nxt = adj[cur][i];
            acorn = 0;
            if (visited[nxt]) continue;
            visited[nxt]=1;

            q[qn++] = nxt;
        }
        qidx++;
    }
    return acorn;
}

int pts[99];

int main()
{
    int nu;
    scanf("%d", &nu);
    for (int c = 1; c<=nu;c++){char s[900];
        memset(visited,0,sizeof(visited));
        memset (nei,0,sizeof(nei));
        while (1){
            gets(s);
            if (s[0]=='*') break;
            int i=0;
            char first=0, sec=0;
            while ( s[i]){
                char cc=s[i];
                if ( 'A' <= cc && cc <= 'Z'){
                    if (!first) first = cc;
                    else {
                        int nf = first - 'A';
                        int nsec = cc - 'A';
                        adj[nf ][nei[nf]++] = nsec;
                        adj[nsec][nei[nsec]++]=nf;break;
                    }
                }i++;
            }
        }
        gets(s);
        int i,j;
        int npts = 0;
        for (i=0; s[i];i++){
            char cc = s[i];
            if ('A' <= cc && cc <='Z'){
                pts[npts] =(int) cc-'A'; npts++;
            }
        }
        ntrees=nacorns=0;
        for (i=0;i<npts;i++){
            if (visited[pts[i]]) continue;
            if (doit(pts[i])) nacorns++;
            else ntrees++;
        }
        printf("There are %d tree(s) and %d acorn(s).\n", ntrees,nacorns);
    }
}



