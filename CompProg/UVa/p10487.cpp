/**
 * Solved using brute force.
 */
#include<cstdlib>
#include<iostream>
using namespace std;
int s[1001];
int main(){
    int n;int cases=1;
    while(cin>>n){
        if(!n)break;
        cout<<"Case "<<cases++<<":"<<endl;
        int i,q,sum;
        for(i=0;i<n;i++)
            cin>>s[i];
        int numq;
        cin>>numq;
        for(i=0;i<numq;i++){
            cin>>q;
            int mindiff=1<<30;
            for(int j=0;j<n;j++){
                for(int k=j+1;k<n;k++){
                    int diff=(q-s[j]-s[k]);
                    if(abs(diff)<abs(mindiff)){
                        mindiff=diff;
                    }
                }
            }
            cout<<"Closest sum to "<<q<<" is "<<q-mindiff<<"."<<endl;
        }
    }
}
