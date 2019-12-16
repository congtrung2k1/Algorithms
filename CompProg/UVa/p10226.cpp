#include<iostream>
#include<unordered_map>
#include<vector>
#include<string>
#include<algorithm>
using namespace std;
int N;
typedef unordered_map<string,int> map;

int main(){
    cin>>N;
    char line[40];
    cin.getline(line, sizeof line);
    cin.getline(line, sizeof line);
    while(N--){
        map m;
        vector<string> names;
        int total=0;
        while(10){
            cin.getline(line, sizeof line);
            if (line[0]==0)break;
            string s(line);
            total++;
            if(m.find(s)==m.end()){
                m[s]=1;
                names.push_back(s);
            }
            else
                m[s]++;
        }
        sort(names.begin(),names.end());
        for(vector<string>::iterator it=names.begin();it!=names.end();it++){
            map::iterator it2=m.find(*it);
            printf("%s %.4f\n",it2->first.c_str(),100*it2->second/(double)total);
        }
        if(N)printf("\n");
    }
}

