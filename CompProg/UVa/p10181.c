/**
Algorithm:
IDA*

How to represent a board state:
Use 64-bit bitmask! Each cell is 0-15 and there are 16 cells.
So in total 4*16 = 64 bits required! Just nice!
Note that using an array might not be too bad either, in fact
I don't really know which way is faster

Use inversion method to check solvability. (Search wolfram)

We don't really need to keep track of previous board states so as
to avoid redundant searching of previously encountered states.

When do we encounter previously encountered states again?
-When we do undo the last move, i.e., LR, UD , etc.
-Redundant cycles such as RDLU times 2
(which causes you to go back to the original state)

The former occurs more frequently so it is important for the 
recursive method to avoid it. The latter is relatively rarer
so the speed up by avoiding it is insignificant I think.

Since we're using DFS and don't keep track of previous board states,
the space complexity is linear.

Conclusions: 
Couldn't have done it without searching for help on the net...
Also, heuristics are powerful !

Gotchas:
- Initial board already solved
- Out of memory for keeping track of large number of states
- Wasting precious time computing for non-solvable board and previously found
  states
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define abs(a)  ((a) >= 0 ? (a): -(a))

typedef long long unsigned state_t;

const state_t goal = 0x0fedcba987654321;  // goal state

int sr,sc;            // starting row,col (zero-based)
state_t ss;           // starting state
char soln[999];       // backtracking solution string

inline state_t set(state_t s, int r, int c, int n)
{
    int i = r*4 + c;
    state_t mask = (state_t)15 << (4*i);
   
    return ( s & (~mask)) | ((state_t)n << (4*i));
}

inline int get(state_t s, int r, int c )
{    
    int i = r*4 + c;  
    return ( s >> (4*i)) & 15;
}

// manhattan distance which is also the min (lowest bound) moves needed
 int cost(state_t s)
{
	int r,c;
	int d = 0;
	for (r = 0; r < 4; r ++){
		for (c = 0; c < 4; c++){
			int t = s & 15;		
			s >>= 4;

            // skip the empty cell as once all other cells are in place
            // then the empty cell must also be in place.
			if (t !=0 ) {
				int tr = (t-1) / 4;
				int tc = (t-1) % 4;
				d += abs(c-tc) +abs(r-tr); 
			}
		}
	}
	return (d);
}

// delta method to calc min moves for new state instead of using
// the full blown cost method
inline int deltaCost(state_t s, int r, int c, int r2, int c2){
	int n = get(s, r2,c2);
	int tr = (n-1)/4;
	int tc = (n-1)%4;
	return abs(r-tr)+abs(c-tc) - abs(r2-tr)-abs(c2-tc);
}

/*
void print(state_t s )
{int i;
    for (i=0;i < 16; i ++){
        printf("%d ", s & 15);
        s >>= 4;
        if ((i+1) % 4 == 0) printf("\n");
    }
}

// search for the empty cell
void getpos(state_t s, int* r, int *c){
	int rr, cc;
	for (rr=0;rr< 4;rr++){
		for (cc=0;cc<4;cc++){
			if (get (s, rr,cc)==0){
				*r = rr; *c=cc; return;
			}
		}
	}
}*/

#define TRYIT(dr,dc,dir1) \
    /*Calculate cost (min moves) of new state using delta method to save time */ \
int newSCost = sCost+deltaCost(s,r,c,r+dr,c+dc);\
if (depth + newSCost <= costLimit ){\
	state_t news = set(set(s, r+dr, c+dc, 0), r,c, get(s, r+dr, c+dc)); \
	  tries[numt].r = dr+r;\
	  tries[numt].c = dc+c;\
	  tries[numt].dir=dir1;\
	  tries[numt].newSCost=newSCost;\
	  tries[numt++].s=news;\
}

bool dfs(int depth, int sCost, int costLimit, int r, int c, state_t s, char prev)
{
	struct {
		state_t s;
		int newSCost;
		char dir;
		char r, c;
	} tries[4];
	int numt = 0;

    // cost of current state is zero means we reached the goal
	if (sCost == 0) {
		soln[depth]=0;
		printf("%s\n",soln);
		return true;
	}
	
    // make sure we don't go back to where we came from...
         if (prev != 'D' && r){TRYIT(-1,0,'U');}
         if (prev != 'U' && r <= 2){TRYIT(1,0,'D');}
         if (prev != 'R' && c){TRYIT(0,-1,'L');}
         if (prev != 'L' && c <= 2){TRYIT(0,1,'R');}

	// loop to try the lowest cost first
	int i,j; int maxidx = 0;
	for (i=0;i < numt;i++){
		for (j = 0; j < numt;j++){
			if (tries[j].dir>=0 && tries[j].newSCost < 
				tries[maxidx].newSCost){
				maxidx = j;	
			}
		}
		
		soln[depth]=tries[maxidx].dir;

  		bool ok= dfs(depth+1,
			tries[maxidx].newSCost,costLimit, 
			tries[maxidx].r, tries[maxidx].c, 
            tries[maxidx].s, soln[depth]);
		  if(ok)return true;
		  tries[maxidx].dir = -1;
		  maxidx = (maxidx+1)%numt;
	}

	return false;
}

bool doit()
{
    // min moves needed to transit to goal state
	int sCost = cost(ss);

    // we could need more moves than that ... try up to 50
	for(int limit = sCost; limit <= 50; limit++){
		bool ok= dfs(0, sCost, limit, sr, sc, ss, 0);
		if (ok) return true; 
	}
	return false;
}

int main(int argc, char**argv)
{
	int i;
    int nu;
    scanf("%d", &nu);
    while (nu--){
        int c;
        ss = 0;
	int invSum = 0;
	int has[20] = {0};

        for (i = 0; i < 16; i ++){
            scanf("%d", & c );
            ss = set(ss, i/4, i %4, c);
		has[c] = 1;

		if (c == 0){ invSum += 1+i/4; sr = i/4; sc=i%4;}
		int j; 
		for (j=1;j < c; j ++){
			if (!has[j] ) invSum ++;
		}
		
        }

        if (invSum %2 || ! doit()) 
        	printf("This puzzle is not solvable.\n");
    }
}

