/*
Algorithm:
Backtracking with pruning
Pruning and heuristics:
- Identify components and backtrack for each component rather than across
  components
- Don't backtrack on redundant nodes
- Try nodes with highest degree first
- Don't repeat search, for e.g.: If you tried 1,2 then don't try 2,1
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <deque>

typedef long long unsigned mask_t;

typedef struct {
	int neicount;
	int nei[40]; // term by -1
	mask_t mask;
} node_t;

int toremove[40]={0};
node_t nodes[40];
int comps[40][40]; // components indices, term by -1
int n,m;
int numcomp;
mask_t compmasks[40];

int count(mask_t m)
{
	int i;
	int c=0;
	while (m){
		if (m&1)c++; 
		m >>= 1;
	}
	return c;
}

// largest first
int degcomp1(const void *a, const void *b){
	return count( nodes[ *(int*)b ].mask) -
	count( nodes[*(int*)a]. mask);
}

void findcomp(int nc, int i, int*visited)
{
	std::deque<int> q ;
	q.push_back(i);
	int numelem= 0;
	while (q.size()){
		int idx = q.front();q.pop_front();
		compmasks[nc] |= (mask_t)1 << idx;
		if (! toremove[idx])
		{comps[nc][numelem] = idx; numelem++;}

		node_t * node = &nodes[idx];
		int j =0;
		while (j < node->neicount)
		{
			int nei = node->nei[j];
			if (! visited[nei] ){
				q.push_back(nei);
				visited[nei] = 1;
			} j++;
		}
	}
	comps[nc][numelem] = -1;
}

bool find(int* indices, int start, int steps, mask_t goal, mask_t cur)
{
	if ( steps == 0){
		return (cur & goal)==goal;
		
	}

	int i; 
	for (i=start; indices[i] != -1; i++){
		node_t *node = &nodes[indices[i]];
		bool b= find(indices,i+1, steps-1,goal, cur | node->mask);
		if (b) return b;
	}
	return false;
}

void doit()
{
	int ind[40];
	
	int i,j;
	for (i = 1; i <=n;i++){
		ind[i] = i;
	}
	qsort(&ind[1], n, sizeof(int), degcomp1);
	
	//eliminate redundant
	for (i=1;i <= n;i++){
		for (j = i+1; j <= n;j++){
			if ((nodes[ind[i]].mask & 
				nodes[ind[j]].mask) == nodes[ind[j]].mask){
				toremove[ind[j]] = 1;	
			}
		}
	}

	// find components
	int visited[40]={0};
	numcomp=0;
	for (i=1; i <= n;i++){
		if (visited[i]) continue;
		findcomp(numcomp,i,visited); numcomp++;
	}
	
	
	int ans=0;
	for (i = 0; i < numcomp;i++){
		int j; int *indices = &comps[i][0];
		 int k = 0;
		for ( ; indices[k] >= 0; k++){}
		qsort(indices, k, sizeof(int), degcomp1);

		for (j = 1; ; j++){
			bool b = find(indices, 0, j, compmasks[i], 0);
			if (b) break;
		}
		ans+=j;
	}
	printf("%d\n",ans);
}

int adj[40][40];

int main()
{
while (1){	
	scanf("%d%d",&n,&m);
	if (n+m==0) break;
	memset(toremove,0,sizeof(toremove));
	memset(compmasks,0,sizeof(compmasks));
	memset(nodes,0,sizeof(nodes));
	memset(adj,0,sizeof(adj));
	numcomp=0;

	int i,j,k;
	for (i=1; i <= n ;i++){
		nodes[i].mask |= (mask_t)1<<i;
	}
	for (i=0;i < m;i++){
		int a,b;
		scanf("%d%d", &a,&b);
		if (adj[a][b] || adj[b][a]) continue;
		adj[a][b] = adj[b][a] = 1;
		nodes[a].mask |= ((mask_t) 1 << b );
		nodes[a].nei[ nodes[a].neicount ++] = b;
		nodes[b].mask |= ((mask_t)1 << a);
		nodes[b].nei[ nodes[b].neicount ++] = a;
	}
	doit();
}
}

