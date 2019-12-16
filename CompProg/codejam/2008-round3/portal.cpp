#include<iostream>
#include<cstring>
#include<deque>

struct node{
    char r,c;
    char r2, c2; // portal coords
    // we only keep track of one portal
    // since we can always create the other portal just before
    // we enter it
    int moves;
};
using namespace std;
deque<node> q;

char map[20][20];
int rows; 
int cols;
int sr, sc;  // starting pos
int er, ec; // ending pos
char visited[20][20][20][20];//[4];

// scan up, down, left, right until we hit a wall
// and then move the portal there
void gen(node&nw, char & k,  int lim,  int delta){
    char old = k;
    for (; k >=0 && k < lim; k += delta){
        
            if (map[nw.r2][nw.c2] != '#')continue;
            k -= delta;
            if (visited[nw.r][nw.c][nw.r2][nw.c2]) break;
             (visited[nw.r][nw.c][nw.r2][nw.c2]=1);
             q.push_back(nw);
             break;
    }  
    k=old;
}
void gen(node&cur, node&nw, int nr, int nc){
    nw.r = nw.r2= nr; nw.c =nw.c2= nc;
    
    // move the portal in the 4 directions
    gen(nw, nw.r2, rows, 1);
    gen(nw, nw.r2, rows, -1);
    gen(nw, nw.c2, cols, 1);
    gen(nw, nw.c2, cols, -1);

    // we move the player but not the portal
    nw.r2 = cur.r2;
    nw.c2 = cur.c2;
     if ( !visited[nr][nc][nw.r2][nw.c2])
        q.push_back(nw);

     (visited[nr][nc][nw.r2][nw.c2]=1);
}
// move the player to the new coords nr,nc
// and move the portal as well
void moveit(node&cur,  int nr, int nc){
    node nw;
    nw.moves=cur.moves+1;
    if (nr >= 0 && nr < rows && nc >=0 && nc < cols ){
        if(map[nr][nc] == '#') {
             gen(cur, nw, cur.r2, cur.c2);
        }else gen(cur, nw, nr,nc);
    }
}
int casen=1;
void find(){
    node  n;
    n.r = n.r2=sr;
    n.c = n.c2=sc;
    
    n.moves=0;
    memset(visited,0,sizeof visited);
    gen(n,n.r2, rows, -1); 
    gen(n,n.r2, rows, 1); 
    gen(n,n.c2, cols, -1); 
    gen(n,n.c2, cols, 1); 
    
    node cur;
    bool ok = false;
    // BFS
    while (q.size()){
        cur = q.front();
        q.pop_front();
        if (cur.r == er && cur.c ==ec){ok=true; break;}
        int r = cur.r; int c = cur.c;
        moveit(cur,r+1,c);
        moveit(cur,r-1, c);
        moveit(cur,r,c+1);
        moveit(cur,r,c-1);
    }
    cout <<"Case #" <<casen++ <<": ";
    if (ok) cout << cur.moves << endl;
    else cout << "THE CAKE IS A LIE" << endl;
}

int main(){
    int nu; cin>>nu;
    while (nu--){
        cin >> rows >> cols; 
        memset(map, '#', sizeof map);
        for (int i = 1; i <= rows; i++){
            string str; cin >> str;
            for (int j = 1; j <= str.size();j++){
                if (str[j-1] == 'O') {sr =  i; sc = j;}
                else if (str[j-1] == 'X'){er = i; ec = j;}
            }
            memcpy(&map[i][1], str.c_str(), cols);
        }
        rows += 2; cols += 2; // sentinel
        q.clear();
        find();
    }
}
