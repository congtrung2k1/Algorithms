/**
Algorithm:
One min-heap and one max-heap

Multiset should do. Not sure whether the builtin priority queue class
is sufficient.

Gotchas:
- Must somehow remove used elems from one heap in the other 
  or have a way to keep track.
- scanf's are faster than cin/out
*/
#include<stdlib.h>
#include<string.h>
#include<stdio.h>

int big[1000999];
int bigsize;
int sm[1000999];
int smsize;
int cnt[1000999]; // keep track which elems are in the heaps.


template<int order>
void perup(int*a, int idx){
    while (idx){
        int paridx = (idx-1)/2;
        if (order*(a[paridx] - a[idx]) > 0){
            int t =a[paridx];
            a[paridx] = a[idx];
            a[idx]=t;
            idx = paridx;
        }else break;
    }
}

template<int order>
void perdown(int*a,int size, int idx){
    while(idx < size){
        int leftidx = idx*2+1;
        if (leftidx < size){

            int rightidx = leftidx+1;
            int cur=a[idx];
            int swapidx = leftidx;
            int swap= a[leftidx];
            int left=swap;
            if (rightidx<size){ int right=a[rightidx];
                    if (order*(left-right)>0){
                        swapidx = rightidx;
                        swap = a[rightidx];
                    }
            }
            if (order*(swap - cur) < 0){
                a[idx]=swap;
                a[idx=swapidx] = cur;
            } else break;
        }
        else break;
    }
}


template<int order>
void push(int*a, int&size, int e){
    a[size] = e;
    perup<order>(a, size);
    size++;
}

template<int order>
int pop(int*a, int&size){
    if (size==0)return -1;
    int ret = a[0];
    size--;
    a[0] = a[size];
    perdown<order>(a,size,0);
    return ret;
}
int main(){ int n;
while (9){
    scanf("%d",&n);
        if (n==0) break;
        int i,j;smsize=bigsize=0;
        long long sum=0;
        memset(cnt,0,sizeof(cnt));
        for (i=0;i < n;i++){
int k;            scanf("%d",&k);

            for (j=0; j<k;j++){
                int p;  scanf("%d",&p);
                push<-1>(big,bigsize,p);
                push<1>(sm,smsize,p);
                cnt[p]++;
            }
             int a,b;
                while(9){
                    a = pop<-1>(big,bigsize);
                    if (cnt[a]) break;
                }
                cnt[a]--;
                while(9){
                    b = pop<1>(sm,smsize);
                    if (cnt[b]) break;
                }
                cnt[b]--;
                sum+=a-b;
            
        }
        printf("%lld\n", sum);
    }
}
