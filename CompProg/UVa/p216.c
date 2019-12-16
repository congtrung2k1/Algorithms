/**
Algorithm:
Brute force backtracking

Gotchas:
- Add an additional 16 feet to each distance between two computers.
- Sqrt of sum of squares is not sum of sqrts of squares!!
  */

#include<math.h>
#include<iostream>
#include<string.h>
#include<stdio.h>
using namespace std;
char used[100];
int n;
int x[10];
int y[10];
double dist[10][10];
int stk[100];
int curstk[100];
double  mindist = 0;
void find(int cur, double sum, int k){
    if (sum >= mindist) return ;
    if (k == n){
        if (sum < mindist) {
            memcpy(stk, curstk, 100*sizeof(int));
            mindist = sum;
        }return;
    }

    int i,j;
    for (i=0;i<n;i++){
        if (used[i]) continue;
        used[i]=1;
        curstk[k]=i; 
        find( i, sum+dist[cur][i], k+1);
        used[i] = 0;
    }
}

void doit(){

    int i,j;
    for (i=0;i<n;i++){
        for (j=0;j<n;j++){
                int xx = (x[i]-x[j]); int yy =(y[i]-y[j]);
            dist[i][j] = dist[j][i]  =sqrt( xx*xx+yy*yy)+16;
        }
    }

    
}

int cc=1;
int main(){

    while (9){
     cin >> n;

     if (n==0) return 0;
     int i,j;
     for (i=0;i<n;i++)
     
     {
        cin >> x[i] >> y[i];
     }

     doit();
     mindist = (double)0x7fffffff;
     for (i=0;i<n;i++){
        used[i] = 1;curstk[0] = i; find (i, 0.0, 1); used[i]=0;
     }
double sum = 0;
printf("**********************************************************\n");
     printf("Network #%d\n", cc++);
     for (i=0;i<n-1;i++){
     printf("Cable requirement to connect (%d,%d) to (%d,%d) is %.2lf feet.\n",  x[stk[i]], y[stk[i]], x[stk[i+1]], y[stk[i+1]],dist[stk[i]][stk[i+1]]);
     sum +=  dist[stk[i]][stk[i+1]] ;}

     printf("Number of feet of cable required is %.2lf.\n",
                sum);
    }
}

