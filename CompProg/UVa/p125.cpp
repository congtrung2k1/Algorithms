/**
 * Let A be the adjacency matrix. So A^N gives the no. of paths of length N
 * for each intersection. Paths of length >= N must be cyclic.
 * To find intersections in cyclic paths, compute A^(N+1) to A^(2N-1).
 */
#include<iostream>
#include<cstring>
using namespace std;
typedef int mat[31][31];

mat adj, t1, t2, ans;
int N;

void mult(mat src, mat dest){
    int i,j;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            int a=0;
            for(int k=0;k<N;k++){
                a+=adj[k][j]*src[i][k];
            }
            dest[i][j]=a;
        }
    }
}

int main(){
    int i,j,cc=0;
    while(cin>>j){
        N=0;
        memset(adj,0,sizeof adj);
        for(i=0;i<j;i++){
            int a,b;
            cin>>a>>b;
            adj[a][b]=1;
            N=max(N,max(a,b));
        }
        N++;
        mat*s1=&t1, *s2=&t2;
        memcpy(t2,adj,sizeof t2);
        memset(ans,0,sizeof ans);
        for(i=0;i<2*N-1;i++){
            swap(s1,s2);
            for(j=0;j<N;j++){
                for(int k=0;k<N;k++){
                    int a=(*s1)[j][k];
                    int &b=ans[j][k];
                    if(1+i>=N&&a)
                        b=-1;
                    else if(b>=0)
                        b+=a;
                }
            }
            mult(*s1,*s2);
        }
        cout<<"matrix for city "<<cc++<<endl;
        for(i=0;i<N;i++){
            for(j=0;j<N;j++){
                cout<<(j==0?"":" ")<<(ans[i][j]);
            }
            cout<<endl;
        }
    }
}
