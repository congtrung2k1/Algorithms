/**
 * Tricky part is parent's status might not have been computed or given.
 */
#include<iostream>
#include<unordered_map>
#include<vector>
#include<string>
#include<algorithm>
using namespace std;

// 0: non, 1: rec, 2: dom
typedef unordered_map<string,int> map;
typedef unordered_map<int,int> map2;
map idxmap;
map2 statusmap;
map2 relmap;
vector<string> names;

inline int get(int a, int b){return (a<<16)|(b);}
inline int first(int mask){return mask>>16;}
inline int second(int mask){return mask&0xffff;}
inline int getindex(string&s){
    map::iterator it=idxmap.find(s);
    if (it==idxmap.end()){
        int idx = idxmap.size();
        return idxmap[s]=idx;
    }
    return it->second;
}

int getstatus(int idx){
    map2::iterator it = statusmap.find(idx);
    if(it!=statusmap.end()){
        return it->second;
    }
    it = relmap.find(idx);
    int i1 = first(it->second);
    int i2 = second(it->second);
    int s1 = getstatus(i1);
    int s2 = getstatus(i2);
    if(s1+s2>=3)
        return statusmap[idx]=2;
    else if(s1+s2>=2)
        return statusmap[idx]=1;
    else
        return statusmap[idx]=0;
}

int main(){
    int N,i,j;
    cin>>N;
    for(i=0;i<N;i++){
        string s1,s2;
        cin>> s1>>s2;
        int i1=getindex(s1);
        if(s2=="dominant"){
            statusmap[i1]=2;
            names.push_back(s1);
        }
        else if(s2=="recessive"){
            statusmap[i1]=1;
            names.push_back(s1);
        }
        else if(s2=="non-existent"){
            statusmap[i1]=0;
            names.push_back(s1);
        }
        else{
            int i2=getindex(s2);
            map2::iterator it = relmap.find(i2);
            if(it==relmap.end()){
                relmap[i2]=get(0,i1);
            }
            else {
                names.push_back(s2);
                relmap[i2]=get(i1,second(it->second));
            }
        }
    }
    sort(names.begin(),names.end());
    for(i=0;i<names.size();i++){
        int idx = idxmap[names[i]];
        int d=getstatus(idx);
        cout<<names[i]<<" "<<(d==2?"dominant":(d==1?"recessive":"non-existent"))<<endl;
    }

}
