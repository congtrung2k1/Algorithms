/**
 * Solved using maps. There are at most 1m lines, so use a map to keep track
 * of the lines and the file they come from.
 * Then go thru each line of the code snippet and keep track of the states.
 */
#include<iostream>
#include<string>
#include<map>
#include<cstring>
#include<vector>
#include<cstdlib>
using namespace std;

struct fileline{int nameidx,line,next;}; // zero based
typedef map<int,int> sm; // maps file idx and line index to count
typedef map<string,int> lm;
sm states, states2, *s1=&states,*s2=&states2;
string names[102]; // fragment names
int N;
char best[102];
fileline lines[1000002];
lm linemap; // lines[linemap[line]] == fileline linked list

void read(string&s){
    s.clear();
    bool isprevspace=true;
    while(1){
        char c=cin.get();
        if(c=='\n')break;
        if(c=='\r')continue;
        if(c==' '){
            if(isprevspace)continue;
            isprevspace=true;
        }
        else isprevspace=false;
        s.push_back(c);
    }
    if(s.size() && s[s.size()-1]==' ')
        s.resize(s.size()-1);
}

inline int getmask(int idx, int line){
    return (idx<<22)|line;
}

int main(){
    int i,j;
    string line;
    while(cin>>N){
        memset(best,0,sizeof best);
        states.clear();
        states2.clear();
        linemap.clear();
        int ntotallines=0;
        for(i=0;i<N;i++){
            cin>>names[i];
            int nline=0;
            while(1){
                read(line);
                if(line=="***END***")break;
                if(line.size()==0)continue;
                fileline &fl=lines[ntotallines++];
                fl.nameidx=i;
                fl.line=nline++;
                lm::iterator iter = linemap.find(line);
                if (iter==linemap.end()){
                    fl.next=-1;
                    linemap[line]=ntotallines-1;
                }
                else{
                    fl.next = iter->second;
                    iter->second=ntotallines-1;
                }
            }
        }
        int ans=0;
        while(1){
            read(line);
            if(line=="***END***")break;
            if(line.size()==0)continue;
            swap(s1,s2);
            s2->clear();
            lm::iterator it = linemap.find(line);
            int idx= it==linemap.end()? -1:it->second;
            // go thru linked list.
            while(idx>=0){
                fileline&fl=lines[idx];
                int s = 1;
                int mask=getmask(fl.nameidx,fl.line);
                sm::iterator it2 = s1->find(mask);
                if(it2!=s1->end()){
                    s = it2->second+1;
                }
                (*s2)[getmask(fl.nameidx,fl.line+1)]=s;
                if(s>=ans){
                    if(s>ans){
                        memset(best,0,sizeof best);
                        ans=s;
                    }
                    best[fl.nameidx]=1;
                }
                idx=fl.next;
            }
        }
        cout<<ans;
        for(i=0;i< 102;i++){
            if(best[i])cout<<" "<<names[i];
        }
        cout<<endl;
    }
}

