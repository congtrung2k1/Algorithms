/**
 * Algorithm: Brute force with caching
 * Note: This takes a while...
 */
#include<iostream>
#include<map>
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

using namespace std;
map<int,bool> cache;
map<int,int> is; // 0 means unknown, 1 means no, 2 means yes happy
char line[1000];
int ans[1<<10]; // precomputed ans

inline int to(int num, int b){
    return num * 10+b;
}
int main(){
    
    // precompute for all possible inputs
    for (int k=1; k < (1<<9);k++){
        int i;
        int start = 2;
        // find the max starting point to search from
        for (int p=1; p < k; p++){
            if ((p&k)==p) // check that p is a subset of k
                start = max(start,ans[p]);
        }
        for (i= start; ;i++){
            bool ok = true;
            for (int j = 0;  j < 9;j++){
                if (!(k & (1<<j))) continue;
                int b = j+2;
                int num=i;
                int sum;
                cache.clear();
                do {
                    sum =0;
                    int r = is[to(i,b)] ;
                    if (r==1){ ok=false; j=10;break; }
                    if (r==2){ break; }
                    while(num){
                        sum += (num % b)*(num%b);
                        num /= b;

                    }
                    if (cache[sum]){
                        is[to(i,b)]=1;ok=false;j=10;break;}
                    cache[sum]=true;
                    num=sum;
                }while(sum!=1);
                if(ok)is[to(i,b)]=2;
            }
            if (ok) break;
        }
        ans[k] = i;
    }
    
    int nu; scanf("%d",&nu); int casen=1;
    gets(line);
    while(nu--){
        gets(line);
        char* p = strtok(line, " ");
        int mask=0;
        while(p){
            mask |= 1<<( atoi(p)-2);
            p = strtok(NULL, " ");
        }
        cout << "Case #"<<casen++ << ": "<<ans[mask]<<endl;
    }
}
