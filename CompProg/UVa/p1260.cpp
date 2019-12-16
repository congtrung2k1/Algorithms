/**
 * Solved using iterative loops.
 */
#include<cstdlib>
#include<iostream>
using namespace std;

int main(){
    int cases;
    cin>>cases;
    while(cases--){
        int i,n;
        int a[2000];
        cin>>n;
        for (i=0;i<n;i++){
            cin>>a[i];
        }
        int sum=0;
        for (i=0;i<n;i++){
            for(int j=0;j<i;j++){
                if(a[j] <= a[i])sum++;
            }
        }
        cout << sum << endl;
    }
}
