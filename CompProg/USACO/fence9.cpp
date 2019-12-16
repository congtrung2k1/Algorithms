/*
LANG: C++
TASK: fence9
*/
/**
 * For each 1 <= y coord < m, calculate the number of points.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;


int main(){
    ifstream fin("fence9.in");
    ofstream fout("fence9.out");
    int i,j,n,m,p,ans=0;
    fin>>n>>m>>p;
    if (p>n){
        for(i=1;i<m;i++){
            int start=(n*i)/m+1;
            int end=p-((p-n)*i)/m-1;
            if(end>=start)ans+=end-start+1;
        }
    }
    else{
        for(i=1;i<m;i++){
            int start=(n*i)/m+1;
            int end=((n-p)*i);
            if(end%m==0)end=end/m+p-1;
            else end=end/m+p;
            if(end>=start)ans+=end-start+1;
        }
    }
    fout<<ans<<endl;
    fout.flush();fout.close();
    return 0;
}
