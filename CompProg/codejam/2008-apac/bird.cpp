/**
 * Algorithm: 
 * Pure simple math.
 * All (h,w) pairs that satisfy the two respective ranges must necessarily
 * form a rectangle. A pair is in the rect iff it is a bird.
 * First form the smallest rect that contains all bird points.
 * Then for each untested bird point, check whether it is in the 
 * original rect. If it is, then it is a bird. 
 * Otherwise, extend the original rect to form a
 * new rect and test whether the new rect contains any non-bird point.
 * If it does, then the untested point is a non-bird; otherwise it is
 * unknown.
 *
 */
#include<iostream>
#include<stdlib.h>
#include<algorithm>

using namespace std;

const int unk = 0;
const int yes = 1;
const int no = 2;

// range struct
struct ra{ 
    int min,max;
    ra():max(0), min(10000000){}
    void update(int a){
        min = std::min(a, min);
        max = std::max(a, max);
    }
    bool has(int a){return min<=a && a <=max;}
};

int hh[100000];
int ww[100000];
int numNot;

int main(){
    int nu;
    cin  >> nu; int casen=1;
    while(nu--){ int n;
        cin >> n;
        string what;
        ra rangeh, rangew;
        numNot=0;

        for (int i = 0;  i < n;i++){
            int h,w;
            cin >> h >> w >> what;
    
            if(what=="NOT") {
                hh[numNot] = h;
                ww[numNot] = w;
                numNot++;
                cin >> what;
           }
           else{
                rangeh.update(h);
                rangew.update(w);
           }
        }


        cin >>n; cout << "Case #" << casen++<<":\n";
        for(int i = 0; i < n;i++){ int h,w;
            cin >> h >> w;

            // add untested point to form new rectangle
            ra hr = rangeh; hr.update(h);
            ra hw = rangew; hw.update(w);
            int result = unk;

            // if untested point is already in old rect, 
            // then yes it's a bird
            if (rangeh.has(h) && rangew.has(w)) result = yes;
            else {
                // check whether the new rectangle contains any non-bird
                for (int j =0 ; j < numNot;j++){
                    if (hr.has(hh[j]) && hw.has(ww[j])) {result= no; break;}
                }
            }
            
            if (result ==no)
                cout << "NOT BIRD";
            else if (result==unk)
                cout <<"UNKNOWN";
            else cout << "BIRD";
            cout <<endl;
        }
    }
}
