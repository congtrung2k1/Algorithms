#include<stdio.h>
#include <vector>
#include<algorithm>
#include<iostream>
#include<map>
struct key{
    int idx;
    int freq;
    int s;
};

int p,k,l;

using namespace std;
vector<key> keys;

bool comp(const key&a, const key&b){
    return a.freq>b.freq;
}
int main(){
    int nu;
    cin >> nu; int casen=1;
    while(nu--){
keys.clear();
        cin >> p>>k>>l;
        for (int i =0; i < l ;i++){
            key kk;
            cin>>kk.freq;
            kk.idx = i;
            keys.push_back(kk);
        }
        sort(keys.begin(),keys.end(),comp);
        int s =1; int left = k;
        long long all=0;
        for (int i = 0; i < l;i++){
            all += s*keys[i].freq;
            left--;
            if (left==0){left=k; s++;}
        }
        cout <<"Case #"<<casen++ <<": "<<all<<endl;
    }
}



