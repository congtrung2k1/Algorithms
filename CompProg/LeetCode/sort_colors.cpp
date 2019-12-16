#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    void sortColors(int A[], int n) {
        int f[3]={0};
        int i,j,k;
        for(i=0;i<n;i++){
            int cur=A[i];
            f[cur]++;
            int prev=cur;
            for(k=j=0;j<=2;j++){
                k+=f[j];
                if(j>=cur&&f[j]){
                    swap(A[k-1],prev);
                }
            }
        }
    }
};
void check(const vector<int>&a){
    int*A=new int[a.size()];
    int i,j;
    for(i=0;i<a.size();i++)
        A[i]=a[i];
    Solution s;
    s.sortColors(A,a.size());

    for(i=0;i<a.size();i++)
        cout<<A[i]<<",";
    cout<<endl;
    delete[]A;
}
int main(){
    check({});
    check({0});
    check({1});
    check({2});
    check({0,2});
    check({0,1,2});
    check({2,1,0});
    check({2,2,1,0});
    check({2,2,1,1,0});
    check({2,2,0,0,1});
    check({2,1,2,0,0,1});
    check({2,1,2,1});
}
