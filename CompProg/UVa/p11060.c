/**
Algorithm:
Topological sort using backtracking

*/
#include<map>
#include<string>
#include<stdio.h>
#include<string.h>

int n; // # beverages
using namespace std;
map<string,int> idxes; // names to indexes
map<int,string> names; // indexes to names
int before[102][102]; // before[i] = list of idxes that i must appear before
int nei[102]; // nei[i ] = length of before[i] list
int bcnt[102]; // # of nodes that must appear before i
int curbcnt[102]; 
int stk[102];
char used[102];
char avail[102];

#define cls(p) memset(p,0 ,sizeof(p))

bool find(int depth)
{
    if (depth == n) return true;

    int i,j;
    for (i=0;i < n;i++){
        if (used[i]||!avail[i]) continue;
        used[i] = 1;
        int cnt = nei[i];
        for (j = 0; j <  cnt;j++){
            int bef = before [ i][j];
            if (++ curbcnt[bef] == bcnt[bef]) avail[bef] = 1;
        }

        stk[depth] = i;
        if (find(depth+1)) return true;

        for (j = 0; j <  cnt;j++){
            int bef = before [ i][j];
            -- curbcnt[bef] ;
            avail[bef] = 0;
        }
        used[i] = 0;
    }

}

int main(){
 int cc=1;
    while (9){
        int p=scanf ("%d", &n); if (p!=1)break;
        int i,j; idxes.clear(); names.clear();
        char s[99]; gets(s);
        for (i=0;i< n;i++){
            gets(s);
            string name (s);
             idxes[name] = i;
             names[i] = name;
        } cls(bcnt);
 int k; cls(nei);
        scanf ("%d", &k);
        for (i=0;i<k;i++){
            char s2[99];
            scanf("%s %s", s,s2);
            int idx1 = idxes[s];
            int idx2 = idxes[s2];
            before[idx1 ][nei[idx1]++] = idx2;
            bcnt[idx2] ++;
        }
cls(used); cls(avail); cls(curbcnt); 
            for (i=0;i < n;i++){
                if (bcnt[i]==0)avail[i]=1;
            }
        find (0);

        
        printf("Case #%d: Dilbert should drink beverages in this order:",cc++);
        
        for (i=0;i < n; i++){
            printf(" %s", names[ stk[i]  ].c_str());
        }
        printf(".\n\n");
    }
}






