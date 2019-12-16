#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<iostream>
using namespace std;

const int W = 3000;

int ymin[2*W+100] ; // ymin[i] = min y for x=i
int ymax[2*W+100];

typedef long long ll;

ll area;
int xx[2];
int yy[2];
int cx = 0;
bool first = !false;

const int invalid = 0x7fffffff;
const int maxinvalid = -99999999;

// update area of polygon
void update(int x, int y){
    xx[cx] = x;
    yy[cx] = y;
    if (!first){
        area += xx[cx^1]*yy[cx] - yy[cx^1]*xx[cx];
        if (x != xx[cx^1]){
            int idx = min(xx[cx^1] ,x) + W+10;
            ymin[idx] = min(ymin[idx], yy[cx^1]);
            ymax[idx] = max(ymax[idx], yy[cx^1]);
        }
    }
    
    cx ^= 1;
    first=false;
}

int main(){
    int nu; cin >> nu;
    int casen=1;
    int dxx [] = {0, -1, 0, 1}; // from north to left
    int dyy[] =  {1, 0, -1, 0}; 
    while (nu--){
        string str;
        int p;
        cin >> p;
        int x=0, y=0;
        int dx = 0, dy=1;
        int angle = 0;
        cx = 0;area=0;
        first =true;
            for (int j = 0; j < 2*W+20;j++)
                 (ymin[j] = invalid, ymax[j] = maxinvalid);
        update(0,0);
        for (int i = 0; i < p;i++){
        cin >> str;
int t;        cin >> t;
            for (int j = 0;j<t;j++){
                for (int k=0;k < str.size();k++){
                    char c = str[k];
                    if (c == 'F') {x += dx; y += dy; update(x,y);}
                    else if (c=='L') angle = (angle-1 + 4)%4;
                    else if (c=='R') angle = (angle+1) % 4;
                    dx = dxx[angle];
                    dy = dyy[angle];
                }
            }

        }
            ll a2=0; // area of pockets plus polygon
            int maxidx = 3*W;
            int maxidx2 = -3*W;
            int themax = maxinvalid;
            int minidx = 3*W;
            int minidx2 = -3*W;
            int themin = invalid;
            for (int j = 0; j < 2*W+20;j++){
                if (ymax[j] != maxinvalid) 
                         if (ymax[j] > themax){
                            themax=ymax[j];
                            maxidx = 
                            maxidx2 = j;
                        }else if (
                            ymax[j] == themax) maxidx2 = j;
                
                if (ymin[j] != invalid )
                        if (ymin[j]<themin){
                            themin = ymin[j];
                            minidx = 
                                minidx2 = j;
                        }else if (ymin[j]==themin)
                            minidx2 = j;
            }


            int prevMax = maxinvalid;
            int prevMin = invalid;

            for (int j = 0; j <= maxidx;j++){
                if (ymax[j] != maxinvalid && ymax[j] < prevMax){
                    ymax[j] = prevMax;
                }
                prevMax = ymax[j];
            }
            for (int j = maxidx; j <= maxidx2; j++)
                ymax[j] = themax;


             prevMax = maxinvalid;
             prevMin = invalid;
            for (int j = 2*W+20; j > maxidx2;j--){
                if (ymax[j] != maxinvalid && ymax[j] < prevMax){
                    ymax[j] = prevMax;
                }
                prevMax = ymax[j];
            }

            for (int j = 0; j <= minidx;j++){
                if (ymin[j] != invalid && ymin[j] > prevMin){
                    ymin[j] = prevMin;
                }
                prevMin = ymin[j];
            }


            for (int j = minidx; j <= minidx2; j++)
                ymin[j] = themin;

             prevMax = maxinvalid;
             prevMin = invalid;
            for (int j = 2*W+20; j > minidx2;j--){
                if (ymin[j] != invalid && ymin[j] > prevMin){
                    ymin[j] = prevMin;
                }
                prevMin = ymin[j];
            }
            for (int j = 0; j < 2*W+20;j++){

                if (ymin[j] != invalid && ymax[j] != maxinvalid){
                    a2 += ymax[j] - ymin[j];
                 }
            }

            cout << "Case #"<<casen++ << ": "<<(a2 - abs(area)/2)<<endl;
    }

}
