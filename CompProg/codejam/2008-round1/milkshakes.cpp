#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int numUn[2100]; // numUn[i] = number of unmalted flavors liked by cust i
int malted[2100]; // malted[i] = malted flavor liked by cust i (-1 if none)
char likes[2100][2100];// likes[i][j] == 1 iff cust i likes flavor j
char visited[2100]; // visited[cust i]
        bool choice[2100]; // choice[i] = whether to produce malted flav i
int main(){
int casen=1;
    int nu; scanf("%d", &nu);
    while (nu--){
        int numf; int numc;
        scanf("%d%d", &numf, &numc);
        memset(likes, 0 ,sizeof likes);
        memset(numUn, 0, sizeof numUn);
        memset(malted, -1, sizeof malted);
        memset(visited,0,sizeof visited);
        memset(choice,0,sizeof choice);
        for (int i = 0; i < numc; i++){
            int t;
            scanf("%d", &t);
            for (int j = 0; j < t;  j++){
                int f,m;
                scanf("%d%d", & f, & m);
                if (m){ 
                    malted[i] = f;
                }else {
                    numUn[i]++;
                    likes[i][f] = 1;
                }
            }
        }
        bool poss=true;
        bool found = false;
        while (! found){
            found = true;
        for (int i = 0; i<numc;i++){
            if (numUn[i] == 0  &&!visited[i]){
                    visited[i]=1;
                 if(malted[i] == -1){
                    poss = false;
                    break;
                 }
                    found = false;
                choice[malted[i]] = true;
                 for (int j = 0; j < numc; j++){
                    if(likes[j][ malted[i] ]){
                        numUn[j]--;
                        likes[j][malted[i]]=0;
                        visited[j] = 0;
                    }
                 }
            }
        }}
        printf("Case #%d:",casen++);
        if (poss)
        for (int i = 1; i <=numf;i++)
            if(choice[i])printf(" 1");
            else printf(" 0");
        else printf(" IMPOSSIBLE");
        printf("\n");
    }
}
