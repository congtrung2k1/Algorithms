/**
Algorithm:
- Basically, divide the path into intervals, with
the big stones being the boundaries of the intervals.

- The answer is the max of the greatest leap for each interval.

- Within each interval, alternate allocation of small stones to
the 'to' and 'fro' trips. 
In fact, the 'to' and 'fro' can be considered the same, i.e., the
direction is not important.

- With this alternating allocation, the greatest leap for each interval 
is the greatest individual leap in either the 'to' or 'fro' trip.
*/
#include <iostream>
#include <stdlib.h>
#include<stdio.h>
int dist[200];
int big[200]; // 0 or 1
using namespace std;
int d; int n;
int find(int s, int e){


    int max=0;
    
    int p = dist[s];
    for (int i = s+1; i <= e; i+=2)
    {
        int dd = dist[i] - p; p = dist[i];
        
        max = std::max(dd,max);
    }

    int i;
    for (i = s+2; i <= e; i+=2)
    {
        int dd = dist[i] - dist[i-2];
        max = std::max(dd,max);
    }
    if (i < e) max=std::max(max, dist[e]-dist[i]);
    
    return max;
}

int main()
{int casen=1;
    int nu; 
    cin>>nu;
    while (nu--){
        cin >> n >> d;
        for (int i = 0; i < n;i++){
            char s[90];
            cin >> s;
            dist[i+1] = atoi(&s[2]);
            big[i+1] = (s[0] == 'B');
        }

        // sentinel entries
        big[0]=0; dist[0]=0;
        big[n+1] = 1;
        dist[n+1]=d;

        int max=0; int prev= 0;
        for (int i = 1; i <= n; i++){
            if (big[i]){  max = std::max(find(prev,i), max); prev= i;}
        }

        // finish up the rest
        max = std::max(find(prev, n+1), max);
        cout << "Case "<<casen << ": "<<max<<endl;
        casen++;
    }
}


