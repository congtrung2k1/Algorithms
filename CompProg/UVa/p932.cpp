/**
 * Solved by brute force method. For each queen, assume it does not exist,
 * then find a valid, empty slot on the board and check whether the missing
 * queen can move there.
 */
#include<iostream>
#include<cstring>
using namespace std;
int row[100];
int col[100];
int d1[100];
int d2[100];
int board[35][35];
int n;

inline void set(int i, int j){row[i]=col[j]=d1[i+j]=d2[i-j+31]=1;}
inline void clear(int i, int j){row[i]=col[j]=d1[i+j]=d2[i-j+31]=0;}
inline int isset(int i, int j){return row[i] || col[j] || d1[i+j] || d2[i-j+31];}

int check(){
    for (int i=0;i < n;i++)
        for (int j=0;j < n;j++){
            if(!board[i][j])continue;
            if (isset(i,j))return 0;
            set(i,j);
        }

    return 1;
}

int find(){
    for (int a=1; a <= n;a++){
        int found=1;
        int arow, acol;
        memset(row,0,sizeof row);
        memset(col,0,sizeof col);
        memset(d1,0,sizeof d1);
        memset(d2,0,sizeof d2);

        for (int i=0;i < n;i++){
            for (int j=0;j < n;j++){
                if (board[i][j]==a){arow=i;acol=j;}
                if(board[i][j]==a ||!board[i][j])continue;
                if (isset(i,j)){i=999;found=0;break;}
                set(i,j);
            }
        }
        if(found){
            for (int i=0;i < n;i++)
                for (int j=0;j < n;j++){
                    if(!isset(i,j)){
                        if(arow == i || acol == j || arow+acol == i+j || arow-acol==i-j){
                            board[arow][acol]=0;
                            board[i][j]=1;
                            return 1;
                        }
                    }
                }
        }
    }
    return 0;
}

int main(){
    int first=1;
    while(cin>>n){
        if(!first)cout<<endl;
        first=0;
        memset(board, 0, sizeof board);
        memset(row,0,sizeof row);
        memset(col,0,sizeof col);
        memset(d1,0,sizeof d1);
        memset(d2,0,sizeof d2);
        int f=1;
        for (int i=0;i < n;i++)
            for (int j=0;j < n;j++){
                char c;
                cin>>c;
                if (c=='X'){
                    board[i][j]=f++;

                }
            }
        if(check())cout<<"YES"<<endl;
        else{
            cout<<"NO"<<endl;
            if(find()){
                cout<<"YES"<<endl;
                for (int i=0;i < n;i++){
                    for (int j=0;j < n;j++){
                        cout << (board[i][j] ? 'X':'0') ;
                    }
                    cout<<endl;
                }
            }else cout<<"NO"<<endl;
        }
    }
    return 0;
}
