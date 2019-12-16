/**
 * Use a linked list backed by a vector for the LRU cache.
 * For get and set operations, move the referenced element to the head.
 * Keep track of the tail and delete the tail when cache is full.
 */
#include<iostream>
#include<unordered_map>
#include<vector>
using namespace std;
struct node{
    int next,prev,val,key;
    node(): next(-1), prev(-1){}
};
class LRUCache{
public:
    // maps from key to node index.
    typedef unordered_map<int,int> mapt;
    mapt m;
    vector<node> nodes;
    int headidx,tailidx;
    const int cap;

    LRUCache(int capacity): cap(capacity), headidx(-1), tailidx(-1) {
    }

    int get(int key) {
        mapt::iterator it=m.find(key);
        if(it==m.end()) return -1;

        const int curidx=it->second;
        movefront(curidx);
        return nodes[curidx].val;
    }

    void movefront(int curidx){
        node&cur=nodes[curidx];
        node&head=nodes[headidx];

        if (cur.prev>=0){
            node&prev=nodes[cur.prev];
            prev.next=cur.next;
        }
        else return ;

        if (cur.next>=0){
            node&next=nodes[cur.next];
            next.prev=cur.prev;
        }
        else tailidx=cur.prev;

        head.prev=curidx;
        cur.prev=-1;
        cur.next=headidx;
        headidx=curidx;
    }

    void removetail(){
        m.erase(nodes[tailidx].key);
        if(tailidx==headidx)return;
        tailidx=nodes[tailidx].prev;
        nodes[tailidx].next=-1;
    }

    void set(int key, int value) {
        pair<mapt::iterator,bool> p=m.emplace(make_pair(key,0));
        int&curidx=(p.first)->second;
        if(p.second){//inserted
            node nd;
            nd.next=headidx;nd.key=key; nd.prev=-1; nd.val=value;
            if(nodes.size()<cap){
                curidx=nodes.size();
                nodes.push_back(nd);
            }
            else{
                curidx=tailidx;
                removetail();
                nodes[curidx]=nd;
            }
            if(headidx>=0)
                nodes[headidx].prev=curidx;
            else tailidx=curidx;
            headidx=curidx;
        }
        else{
            nodes[curidx].val=value;
            movefront(curidx);
        }
    }
    void print(){
        cout<<"head: "<<headidx<<endl;
        cout<<"tail: "<<tailidx<<endl;
        for(int i=0;i<nodes.size();i++){
            node&cur=nodes[i];
            cout<<cur.prev<<","<<cur.next<<","<<cur.val<<endl;
        }
        cout<<endl;
    }
};

int main(){
    {LRUCache s(1);
    s.set(1,2);
    cout<<(s.get(1)==2)<<endl;
    cout<<(s.get(2)==-1)<<endl;
    s.set(2,1);
    cout<<(s.get(2)==1)<<endl;
    cout<<(s.get(1)==-1)<<endl;
    s.set(3,2);
    cout<<(s.get(3)==2)<<endl;
    cout<<(s.get(2)==-1)<<endl;
    cout<<(s.get(1)==-1)<<endl;
    s.set(3,2);
    cout<<(s.get(3)==2)<<endl;
    cout<<(s.get(2)==-1)<<endl;
    cout<<(s.get(1)==-1)<<endl;
    }{
    LRUCache s=LRUCache(2);
    s.set(1,2);
    cout<<(s.get(1)==2)<<endl;
    cout<<(s.get(2)==-1)<<endl;
    s.print();
    s.set(2,3);
    cout<<(s.get(1)==2)<<endl;
    cout<<(s.get(2)==3)<<endl;
    s.print();
    s.set(3,4);
    cout<<(s.get(1)==-1)<<endl;
    cout<<(s.get(2)==3)<<endl;
    cout<<(s.get(3)==4)<<endl;
    s.print();
    s.set(2,30);
    cout<<(s.get(1)==-1)<<endl;
    cout<<(s.get(2)==30)<<endl;
    cout<<(s.get(3)==4)<<endl;
    s.print();
    s.set(5,0);
    cout<<(s.get(1)==-1)<<endl;
    cout<<(s.get(2)==-1)<<endl;
    cout<<(s.get(5)==0)<<endl;
    cout<<(s.get(3)==4)<<endl;
    }

};
