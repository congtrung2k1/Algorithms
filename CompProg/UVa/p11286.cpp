#include<iostream>
#include<unordered_map>
#include<cstdlib>
using namespace std;

typedef char combi[10];

int comp(const void*a, const void*b){
    return *(int*)a-*(int*)b;
}

string get(int a[5]){
    qsort(a,5,sizeof a[0],comp);
    int i,j;
    string s;
    for(i=0;i<5;i++){
        int n = a[i]-100;
        s.push_back(n&255);
        s.push_back(n>>8);
    }
    return s;
}

int main(){
    int N;
    while(1){
        cin>>N;
        if(!N)break;
        int i,j,a[5],ans=1,themax=0;
        unordered_map<string,int> m;
        for(j=0;j<N;j++){
            for(i=0;i<5;i++){
                cin>>a[i];
            }
            string c = get(a);
            int cc=1;
            if(m.find(c)==m.end()){
                m[c]=1;
            }
            else{
                cc = ++m[c];
            }
            themax=max(themax,cc);
        }
        ans=0;
        for(unordered_map<string,int>::iterator it=m.begin();it!=m.end();it++){
            if(it->second==themax)
                ans+=themax;
        }
        cout<<ans<<endl;
    }
}

