#include<iostream>
#include<cstdlib>
#include<cstring>
using namespace std;

int board[52][52];
int R,C;

int count(int r,int c){
    int i,j,s1=1<<30,s2=1<<30;
    for(j=c+1;j<C;j++){
        if(board[r][j]==0){s1= j-c;break;}
    }
    for(j=c-1;j>=0;j--){
        if(board[r][j]==0){s2= c-j;break;}
    }
    int s = min(s1,s2);
    return s <=  C ? s : -1;
}

int main(){
    int c=1;
    int cases; cin>> cases;
    while(cases--){
        cin>>R>>C;
        int i,j;
        for(i=0;i<R;i++){
            for(j=0;j<C;j++){
                char ch;cin>>ch;board[i][j]=ch-'0';
            }
        }
        int minmoves= -1;
        for (j=0;j<C;j++){
            int moves=0;
            for(i=0;i<R;i++){
                if(board[i][j]){
                    int cc=count(i,j);
                    if(cc<0){moves=-1;break;}
                    moves+=cc;
                }
            }
            if(moves>=0 &&  (minmoves== -1 || moves<minmoves)){
                minmoves=moves;
            }
        }
        cout<<"Case "<<c++<<": "<< minmoves;
        cout<<endl;
    }
}
