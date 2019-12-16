/**
Algorithm:
Dijkstra's algorithm using a min-heap

*/

#include<string>
#include<map>
#include<vector>
#include<string.h>
#include<algorithm>
#include<stdio.h>
#include<iostream>

using namespace std;

map<string,int>  langToIdx; // maps a lang to its index
vector<string> words;
int len[2004]; // word len
int nwords;
int adj[2004][2004];
int nei[2004];
int lang1[2004]; // language 1 of word[i]
int lang2[2004]; // language 2 of word[i]

const int tar = 2001; // idx of target node. all words in ending lang will
                      // point to this target
const int start = 2002; // idx of start node which points to all words
                       // in starting lang

map<int,vector<int> > lang; // maps lang to word indices
struct node{
    int dist; int idx;
};
char visited[2004];
vector<node> q; // disjkstra heap


class comp {
    public: bool operator()(const node&a, const node &b) const{
        return a.dist > b.dist;
    }
    
};
comp comp;
void doit();
int main(){
     for (int i = 0;  i < 2001;i++){
        words.push_back(string());
     }
    while (9){
        scanf("%d",&nwords);
        if (nwords==0)break;
        langToIdx.clear();
        lang.clear();
        memset(visited,0,sizeof(visited));
        memset(nei,0,sizeof(nei));
        int i,j;
        int langcnt = 0; string slang,tlang;
        cin >> slang >> tlang; string ss = slang, tt=tlang;
        langToIdx[slang] = ++langcnt;
        langToIdx[tlang] = ++langcnt ; 
        for (i=0;i < nwords;i++){ 
            cin >> slang >> tlang ;
            cin >> words[i]; len[i] = words[i].size();
            int l1 = (langToIdx[slang]);
            if (l1 == 0){
                langToIdx[slang] = l1=++langcnt;
            }
            lang[l1].push_back(i);
            int l2 = langToIdx[tlang];
            if (l2 == 0){
                langToIdx[tlang] = l2= ++langcnt;
            }
            lang1[i] = l1; lang2[i] = l2;
            lang[l2].push_back(i);

        }
     const   vector<int> &sswords = lang[langToIdx[ss]];
        for (i  = sswords.size() -1;i>=0;i--){
           adj[start][nei[start]++] = sswords[i];  
        }
        const vector<int>&ttwords = lang[langToIdx[tt]];
        for (i=  ttwords.size()-1; i>=0;i--){
            adj[ttwords[i]][nei[ttwords[i]]++] = tar;
        }
        for (i=0;i<nwords;i++){
            const vector<int>&words1 =lang[lang1[i]];
            const vector<int>&words2 =lang[lang2[i]];
            const char f = words[i][0];
            for (j= words1.size()-1; j >=0;j--){
                int p = words1[j];
               if (p==i ||f == words[p][0]) continue;
               adj[i][nei[i]++]= p; 
            } 
            for (j= words2.size()-1; j >=0;j--){
                int p = words2[j];
               if (p==i||f == words[p][0]) continue;
               adj[i][nei[i]++]= p; 
            } 
        }
        len[tar]=0;doit();
    }
}
void doit(){
    node cur;
    cur.dist = 0; cur.idx = start;
    q.clear();
    q.push_back(cur); int solved=0;
    while (q.size()){
        cur = q.front(); 
        pop_heap(q.begin(),q.end(),comp); q.pop_back();
        if (visited[cur.idx]) continue;
        visited[cur.idx]=1;
        if(cur.idx==tar){solved=1;break;}
        int cnt = nei[cur.idx];
        for (int i = 0; i < cnt; i ++){
             int nxt = adj[cur.idx][i];
             node nw; nw.dist = cur.dist + len[nxt];
             nw.idx = nxt;
            q.push_back( nw); push_heap(q.begin(),q.end(),comp);

        }
    }    
    if (solved) printf("%d\n",cur.dist);
    else printf("impossivel\n");
}




