#include <stdio.h>
#include <map>
#include <stdlib.h>
#include<string>
#include<string.h>
using namespace std;

char tornName[1000];
char teamNames[1000][40];
typedef struct
{
    int idx;
    int points;
    int wins;
    int ties;
    int loss;

    int goalsFor;
    int goalsAgainst;
    int games;
} team;

map<string, team*> m;

team teams[100];
int numTeams;
int comp(const void *a, const void *b)
{
    team *aa = (team*)a;
    team *bb = (team*)b;
    int k = bb->points - aa->points;
    if (k!=0) return k;
    k = bb->wins - aa->wins;
    if (k!=0) return k;
    k = (bb->goalsFor-bb->goalsAgainst) - (aa->goalsFor-aa->goalsAgainst);
    if (k!=0) return k;
    k = bb->goalsFor - aa->goalsFor;
    if (k!=0) return k;
    k= aa->games - bb->games;
    if (k!=0) return k;
    k= strcasecmp(&teamNames[aa->idx][0], &teamNames[bb->idx][0]);
    if (k!=0) return k;
    return bb->idx-aa->idx;
}
int main()
{
    int nu;char ppp[1000];
    scanf ("%d", &nu);gets(ppp);
    int f =0;
    while (nu--)
    {
    m.clear();
        if (f) printf("\n"); f=1;
        gets(tornName);char pp[1000];
        
        int i,j,k;
        
        memset(teams, 0, sizeof(teams));
        scanf("%d", &numTeams);gets(pp);
        for (i=0;i< numTeams;i++){
            gets(&teamNames[i][0]);
         //   printf("%s\n", &teamNames[i][0]);
            string s(&teamNames[i][0]);
            m[s] = &teams[i];
            teams[i].idx = i;
            
        }
        scanf("%d", &k);gets(pp);
        char s[10000];
        for (i=0;i < k;i++){
            gets(s);
            char * c =(char*) strchr(s, '#');
            *c =0;
            string ss(s);
            team*t1 = m[ss];
            char *c2 = (char*) strchr(c+1, '@');
            *c2 = 0;
            char *c3 = (char*) strchr(c2+1, '#');
            *c3=0;
            int t1s = atoi(c+1);
            int t2s = atoi(c2+1);
            ss = string(c3+1);
            team*t2 = m[ss];
            t1->games++;
            t2->games++;
            
            t1->goalsFor += t1s;
            t1->goalsAgainst += t2s;
            t2->goalsFor += t2s;
            t2->goalsAgainst += t1s;
            
            if (t1s > t2s){ t1->wins++; t2->loss++; t1->points += 3;}
            else if (t1s < t2s){t2->wins++; t1->loss++;t2->points+=3;}
            else { t1->points++; t2->points++;
                    t1->ties ++; t2->ties++;}
            
        }
        printf("%s\n", tornName);
        qsort(teams, numTeams, sizeof(teams[0]), comp);
        for (i=0;i<numTeams;i++){
            printf("%d) %s %dp, %dg (%d-%d-%d), %dgd (%d-%d)\n",
                1+i, &teamNames[teams[i].idx][0], 
                teams[i].points, teams[i].games, 
                teams[i].wins, teams[i].ties, teams[i].loss,
                teams[i].goalsFor - teams[i].goalsAgainst,
                teams[i].goalsFor, teams[i].goalsAgainst);
        }
    }return 0;
}


