/**
 * Solved using Segment tree which is overkill
 * and much slower.
 */
#include<iostream>
#include<cstring>
#include<cstdlib>
using namespace std;

struct seg{
    int lo, hi; // inclusive
    char name[22];
};

struct node{
    int lo, hi; // inclusive
    seg*s;
    int scount;
    node*left,*right;
};

node nodes[100000];
seg s[11000];
int n;
int a[22000];
node *root;

int comp(const void*a , const void*b){
    return *(int*)a - *(int*)b;
}

inline bool inter(seg*s, node*cur){
    return (s->hi >= cur->lo || s->lo <= cur->hi)
        ||(s->lo <= cur->lo && cur->hi <= s->hi);
}

void insert(node*cur,seg*s){
    if(s->lo <= cur->lo && cur->hi <= s->hi){
        cur->s=s;
        cur->scount++;
        return;
    }
    if (cur->left&&  inter(s,cur->left))
        insert(cur->left, s);
    if (cur->right && inter(s,cur->right))
        insert(cur->right, s);
}

void build(){
    memset(nodes,0,sizeof nodes);
    qsort(a,n*2, sizeof (a[0]),comp);
    int idx = 0, i, prev = -1;
    for(i=0;i<2*n;i++){
        if (prev == a[i])continue;
        a[idx++]=prev=a[i];
    }
    int nidx = 0;
    node & first = nodes[nidx++];
    first.lo= -1; first.hi=a[0]-1;

    for (i=1;i<=idx;i++){
        node &cur = nodes[nidx++];
        cur.lo = cur.hi = a[i-1];
        if (i < idx){
            node &cur2 = nodes[nidx++];
            cur2.lo = a[i-1]+1; cur2.hi = a[i]-1;
        }
    }

    node&last = nodes[nidx++];
    last.lo = a[idx-1]+1; last.hi = 1<<30;

    int previdx = 0;
    do{
        int lastidx = nidx;
        for(i=previdx;i<lastidx;i++){
            node&cur = nodes[nidx++];
            cur.left =& nodes[i];
            cur.lo = cur.left->lo;
            cur.hi = cur.left->hi;
            if(i+1<lastidx){
                cur.right = &nodes[i+1];
                cur.hi = cur.right->hi;
                i++;
            }
        }
        previdx=lastidx;
    }while(nidx-previdx>1);

    root = &nodes[nidx-1];
    for(i=0;i<n;i++)
        insert(root,&s[i]);
}

const char* query(int q){
    const char* ans="UNDETERMINED";
    node*cur = root;
    int found=0;
    while(cur){
        if(cur->s){
            if (found++ || cur->scount>1) return "UNDETERMINED";
            ans = cur->s->name;
        }
        if (cur->left && cur->left->lo <= q && q <= cur->left->hi){
            cur=(cur->left);
        }
        else if(cur->right&&cur->right->lo <= q && q<= cur->right->hi){
            cur=cur->right;
        }
        else break;
    }
    return ans;
}

int main(){
    int cases,q,numq;
    cin>>cases;
    while(cases--){
        cin>>n;
        for (int i=0;i<n;i++){
            cin>>s[i].name>>s[i].lo>>s[i].hi;
            a[i*2]=s[i].lo; a[i*2+1]=s[i].hi;
        }
        build();
        cin>>numq;
        for (int i=0;i<numq;i++){
            cin>>q;
            cout<<query(q)<<endl;
        }
        if(cases)cout<<endl;
    }
    return 0;
}
