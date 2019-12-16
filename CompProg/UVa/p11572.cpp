#include<iostream>
#include<unordered_map>
#include<vector>
using namespace std;

typedef unordered_map<int,int> map;
map m;
vector<int> seq;

int main(){
    int cases;
    cin>>cases;
    while(cases--){
        int N,i,j,k;
        cin>>N;
        m.clear(); seq.clear();
        int run=0, ans=0, read=0;
        for(i=0;i<N;i++){
            if(i>=read){
                cin>>k;
                read++;
            }
            else k=seq[i];
            if(i>=seq.size())
                seq.push_back(k);
            else
                seq[i]=k;
            map::iterator it=m.find(k);
            if(it==m.end()){
                m[k]=i;
                ans=max(ans,++run);
            }
            else{
                run=0;
                i=it->second;
                m.clear();
            }
        }
        cout<<ans<<endl;
    }
}
