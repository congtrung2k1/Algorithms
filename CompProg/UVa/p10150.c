#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <map>
#include <string>
#include <deque>
char words[26000][18];
unsigned int hash[26000];
int len[26000];
using namespace std;
map<string, int> m;
int w;
vector< vector<int>* > edges;

int is(char * s1, char*s2, int i, int j){
    if (len[i]!=len[j]) return 0;
    int k;
    
    int m=0;for (k= len[i]-1; k >=0;k--){
        if (s1[k] != s2[k]) {
            m++;
            if (m > 1) return 0;
        }
    }
    return m==1;
}

struct node{
    int back;
    int cur;
    int nncur;
};
node nodes[26000];
int nnidx = 0;
int used[26000];
int out[26000] ;
vector<int> ee[26000];
 deque<node> q;
int find(int iter, int idx1, int idx2){
   q.clear();
    used[idx1]=iter;
    nodes[0].back = -1;
    nodes[0].cur = idx1;
    nodes[0].nncur = 0;
    nnidx=1;
    node c;
    q.push_back(nodes[0]);
    while (q.size()){
         c = q.front();
         q.pop_front();
        if (c.cur == idx2) break;
        const vector<int>* e = edges[c.cur];
        for(std::vector<int>::const_iterator it = e->begin(); it != e->end(); ++it) {
           if (used[*it] != iter){
                nodes[nnidx].cur = *it;
                nodes[nnidx].nncur = nnidx;
                nodes[nnidx].back = c.nncur;
                used[*it]=iter;
                q.push_back(nodes[nnidx]);
                nnidx++;
           }
        }

    }
    if (c.cur == idx2){
        int k = 0;
        do{
            
             out[k] =c.cur;
            k++;
           
            if (c.back <0) break;
             c = nodes[c.back];
         }while(1);
         int i;
         for (i = k-1; i>=0;i--){
            printf("%s\n", &words[out[i]][0]);
         }
         return 1;
    }
    return 0;
}


int main(){
    char s[1000];
    w=0;
    while(1){
        gets(&words[w][0]);
    //    printf("%s \n", &words[w][0]);
        if (words[w][0]==0) break;
        len[w] = strlen(&words[w][0]);
        string str(&words[w][0]);
        m[str] = w;
        
        w++;
    }
    int i,j,k;
    for (i=0;i<w;i++){
    vector<int> &  e =ee[i];
        edges.push_back((vector<int>*)&e);
    }
    for (i =0; i < w;i++){
    
        vector<int> &  e =ee[i];
       
        for (j=i+1;j < w;j++){
            if (is(&words[i][0], &words[j][0], i,j)){
                e.push_back(j);
                edges[j]->push_back(i);
            }
        }
    }
    int f = 0;
  //  string s1,s2;
    while (1){
        
        char s1[100], s2[100];
       int k= scanf("%s%s", s1,s2);
      
        if (k!=2)break;
        string str1(s1), str2(s2);
        map <string, int> :: const_iterator it1 = m.find( str1 );
        map <string, int> :: const_iterator it2 = m.find( str2 );
        if (f) printf("\n");
        f++;
        if (it1 == m.end() || it2 == m.end() ) {
            printf("No solution.\n");continue;
         }
        int len1 = len[it1->second];
        int len2 = len[it2->second];
        if (len1 != len2 ||!find(f,it1->second, it2->second)){
            printf("No solution.\n");continue;
         }
         
    }
    return 0;
}


