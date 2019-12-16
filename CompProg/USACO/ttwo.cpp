/*
user: tbhtan31
LANG: C++
TASK: ttwo
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

char grid[11][11];
int cc,cr,fr,fc,cd,fd;
int dc[]={0,1,0,-1},dr[]={-1,0,1,0};

int valid(int n){
    return 0<=n&&n<=9;
}

int move(int&cr,int&cc,int&cd){
    int newcr = dr[cd]+cr;
    int newcc = dc[cd]+cc;
    if(!valid(newcr)||!valid(newcc)||'*'==grid[newcr][newcc])cd=(cd+1)%4;
    else{
        cr=newcr;cc=newcc;
    }
}

int main(){
    ifstream in("ttwo.in");
    ofstream out("ttwo.out");
    int i,j;
    for (i=0;i<10;i++){
        in>>grid[i];
        for (j=0;j<10;j++){
            switch(grid[i][j]){
            case 'F':fr=i;fc=j;break;
            case 'C':cr=i;cc=j;break;
            }
        }
    }
    int ans=0,found=0;
    while(ans<=160000){
        move(fr,fc,fd); move(cr,cc,cd);
        ans++;
        if(cr==fr&&cc==fc){found=1;break;}
    }
    out<<found*ans<<endl;
    out.flush();out.close();
    return 0;
}
