/**
Algorithm:
Greedy using min-heap

Theory:
Since K<N, we can do :
- Sort the players by their ratings
- Generate all N-1 diffs in ratings between all two adjacent players
- Sort the diff or use a min-heap
- Starting from the smallest diff, check whether the diff can be used
  . if not, skip over to next one
  If using the current diff, update the players' statistics like games
  played, colors used, etc.
*/
#include<string.h>
#include<stdio.h>
#include<vector>
#include<algorithm>


using namespace std;
struct node{
int diff, idx1, idx2;};
struct player{ int played, rating; char nblack, nwhite;};
int n,k;
vector<node> q;
player pp[100004]; typedef long long ll;
class comp{
public:bool operator()(const node&a, const  node&b) const {
    return a.diff > b.diff;
}};
int comp2( const void *a, const void *b){
    return ((player*)a)-> rating - ((player*)b)->rating;
}
comp comp;
void doit(){
    ll total=0;
    int num = 0; node cur;
    while (q.size() && num<k){
        cur=q.front();
        pop_heap(q.begin(),q.end(),comp);
        q.pop_back();
        if ( pp[cur.idx1].played==2 ||
           pp[cur.idx2].played==2)continue;
         player &pp1 = pp[cur.idx1];
         player&pp2 = pp[cur.idx2];
         if (pp1.rating < pp2.rating){
            if (pp1.nwhite || pp2.nblack) continue;
            pp1.nwhite++;pp2.nblack++;
         }
         else {if (pp1.nblack||pp2.nwhite)continue;
            pp1.nblack++; pp2.nwhite++;}
        pp1.played++; pp2.played++;
        total +=  cur.diff; num++;
    }
    printf("%lld\n", total);
}

int main(){
    scanf("%d%d", &n,&k);
    int i,j; 
    for (i=0;i<n;i++){
        scanf ("%d", & pp[i].rating);
    }
    qsort(pp, n, sizeof(pp[0]), comp2);

    for (i=1; i < n;i++){
        node cur; cur.idx1 = i; cur.idx2 = i-1;
        cur.diff =  pp[i].rating - pp[i-1].rating;
        q.push_back(cur);
    }
    make_heap(q.begin(),q.end(),comp);
    doit();
}
