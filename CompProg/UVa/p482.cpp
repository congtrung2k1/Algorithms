#include<iostream>
#include<sstream>
#include<cmath>
#include<cstdlib>
#include<string>
using namespace std;

string s[99999];
int a[99999];
char line[999999];

int main(){
    int N;cin>>N;
    int i,j,f=0;

    while(N--){
        if(f)cout<<endl;
        f=1;
        cin.getline(line, sizeof line);
        cin.getline(line, sizeof line);
        cin.getline(line, sizeof line);
        istringstream ss(line);
        j=0;
        for (i=0;ss>>a[i];j++,i++);
        for(i=0;i<j;i++)
            cin>>s[a[i]-1];
        for(i=0;i<j;i++)
            cout<<s[i]<<endl;
    }
}
