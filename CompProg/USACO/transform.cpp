/*
user: tbhtan31
LANG: C++
TASK: transform
*/
#include<iostream>
#include<cstring>
#include<cstdlib>
#include<fstream>
using namespace std;

char ingrid[20][20];
char outgrid[20][20];
char tmpgrid[20][20];
char tmpgrid1[20][20];
int N;

int comp(char a[20][20], char b[20][20]){
    int i,j;
    for (i=0;i<N;i++)
        for(j=0;j<N;j++)
            if (a[i][j]!=b[i][j])return 0;
    return 1;
}

int rot90(char in[20][20], char out[20][20]){
    int i,j;
    for (i=0;i<N;i++){
        for (j=0;j<N;j++)
            out[i][j] = in[N-1-j][i];
    }
}

int ref(char in[20][20], char out[20][20]){
    int i,j;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++)
            out[i][j] = in[i][N-1-j];
    }
}

int ans(){

    rot90(ingrid,tmpgrid);
    if(comp(outgrid,tmpgrid))return 1;
    rot90(tmpgrid,tmpgrid1);
    if(comp(outgrid,tmpgrid1))return 2;
    rot90(tmpgrid1,tmpgrid);
    if(comp(outgrid,tmpgrid))return 3;

    ref(ingrid,tmpgrid);
    if(comp(outgrid,tmpgrid))return 4;


    rot90(tmpgrid,tmpgrid1);
    if(comp(outgrid,tmpgrid1))return 5;
    rot90(tmpgrid1,tmpgrid);
    if(comp(outgrid,tmpgrid))return 5;
    rot90(tmpgrid,tmpgrid1);
    if(comp(outgrid,tmpgrid1))return 5;

    if(comp(ingrid,outgrid))return 6;

    return 7;
}

int main(){
    ifstream in("transform.in");
    ofstream out("transform.out");
    in>>N;
    int i,j;
    for (i=0;i<N;i++){
        in>>ingrid[i];
    }
    for (i=0;i<N;i++){
        in>>outgrid[i];
    }
    out<<ans()<<endl;
    out.close();return 0;
}
