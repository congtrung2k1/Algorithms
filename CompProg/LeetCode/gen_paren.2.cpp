/**
 * Idea is to start with an empty string. At each recursive step, append
 * either a ( or ).  A ) always matches some ( correctly, unless the current
 * number of ( is less than or equal to that of ).
 */
#include <vector>
#include<iostream>
#include<stack>
using namespace std;
struct state{
    int lcount, rcount, step;
    state(): step(0){}
};
class Solution {
public:
    /* Recursive version: */
    void gen(vector<string>&v, int lcount, int rcount, string&s){
        if(lcount==0){
            s.append(rcount, ')');
            v.emplace_back(s);
            s.resize(s.size() - rcount);
        }
        else if(lcount<=rcount){
            s.append(1, '(');
            gen(v, lcount-1, rcount, s);
            s.back() = ')';
            gen(v, lcount, rcount-1, s);
            s.resize(s.size() - 1);
        }
    }
    vector<string> generateParenthesis(int n) {
        vector<string> v;
        string s;
        stack<state> states;
        state next; next.lcount=next.rcount=n;
        states.push(next);
        while(states.size()){
            state&cur=states.top();
            if(cur.lcount==0){
                s.append(cur.rcount, ')');
                v.emplace_back(s);
                s.resize(s.size()-cur.rcount);
            }
            else if(cur.lcount<=cur.rcount){
                next=cur;
                next.step=0;
                cur.step++;
                if(cur.step==1){
                    s.append(1, '(');
                    next.lcount--;
                    states.push(next);
                    continue;
                }
                else if(cur.step==2){
                    s.back() = ')';
                    next.rcount--;
                    states.push(next);
                    continue;
                }
                s.resize(s.size()-1);
            }
            states.pop();
        }
        return v;
    }
};
int main(){
    Solution s;
    int i,j;
    for(j=1;j<=5;j++){
        cout<<j<<": "<<endl;
        vector<string>v=s.generateParenthesis(j);
        for(i=0;i<v.size();i++){
            cout<<v[i]<<endl;
        }
        cout<<"------------"<<endl;
    }
}
