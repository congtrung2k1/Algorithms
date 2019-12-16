/**
 * Straightforward solution, not sure what this technique is called.
 */
#include<iostream>
#include<cstdlib>
#include<vector>
using namespace std;

struct state{int lastrank,len;};
int rk[99]; // rk[i] == rank of event i
int N;
int b[99]; // b[i] == event at i^th place
vector<state> states;

int score(){
    int i,j;
    states.clear();
    int m=1;
    for(i=0;i<N;i++){
        int currank=rk[b[i]];
        int size=states.size();
        for (j=0;j<size;j++){
            state s=states[j];
            if(s.lastrank<currank){
                s.lastrank=currank;
                m=max(m,++s.len);
                states.push_back(s);
            }
        }
        state s; s.lastrank=currank; s.len=1;
        states.push_back(s);
    }
    return m;
}

int main(){
    cin>>N;
    int i,j;
    for(i=0;i<N;i++){
        cin>>j;
        rk[i]=j;
    }
    while(cin>>j){
        b[j-1]=0;
        for(i=1;i<N;i++){
            cin>>j;
            b[j-1]=i;
        }
        cout<<score()<<endl;
    }
}
