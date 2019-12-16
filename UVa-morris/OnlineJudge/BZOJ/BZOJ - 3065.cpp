#include <stdio.h>
#include <math.h>
#include <stack>
#include <assert.h>
#include <vector>
#include <limits.h>
#include <map>
#include <algorithm>
using namespace std;

const int MAXN = 65536;
const int MAXQ = 262144;

class UnrolledLinkedList {
public:
	struct Node {
		vector<int> A, B;
		Node *next, *alias;
		Node() {
			A.clear(), B.clear(), next = alias = NULL;
		}
		Node* real() {
			if (alias)	return alias;
			return this;
		}
		void insert(int x, int val) {
			if (alias) {
				A = alias->A, B = alias->B;
				alias = NULL;
			}
			A.insert(A.begin() + x, val);
			B.resize(A.size());
			B[A.size()-1] = val;
			for (int i = (int) A.size()-1; i > 0 && B[i] < B[i-1]; i--)
				swap(B[i], B[i-1]);
		}
		void erase(int x) {
			int val = A[x];
			A.erase(A.begin()+x);
			B.erase(lower_bound(B.begin(), B.end(), val));
		}
		void change(int x, int val) {
			int t = A[x];
			A[x] = val;
			B.erase(lower_bound(B.begin(), B.end(), t));
			B.resize(A.size());
			B[A.size()-1] = val;
			for (int i = (int) A.size()-1; i > 0 && B[i] < B[i-1]; i--)
				swap(B[i], B[i-1]);
		}
		void relax() {
			B = A;
			sort(B.begin(), B.end());
		}
	};
	int PSIZE;
	stack<Node*> mem;
	Node* init(int A[], int n) { // A[1:n]
		free();
		PSIZE = max((int) sqrt(n), 2);
		for (int i = 1; ; i <<= 1) {
			if (i >= PSIZE) {
				PSIZE = i;
				break;
			}
		}
		
		Node *u, *v, *head;
		
		head = newNode();
		u = head, v = NULL;
		for (int i = 1; i <= n; i++) {
			if (u->A.size() == PSIZE) {
				u->next = newNode();
				v = u, u = u->next;
			}
			u->A.push_back(A[i]);
		}
		for (u = head; u != NULL; u = u->next)
			u->relax();
		return head;
	}
	Node* newNode() {
		Node* p = new Node();
		mem.push(p);
		return p;
	}
	Node* cloneNode(Node *u) {
		Node *t = u->real();
		Node *p = new Node();
		*p = *t, p->next = u->next, mem.push(p);
		return p; 
	}
	Node* aliasNode(Node *u) {
		Node *t = u->real();
//		Node* p = new Node();
//		p->alias = t, p->next = u->next, mem.push(p);
//		return p;
		return u;
	}
	Node* erase(Node *ver, int x) {
		Node *a, *b, *u, *v, *t;
		u = ver, a = NULL;
		for (int l = 1, r; u; l = r+1, u = u->next) {
			r = l + u->real()->A.size() - 1;
			if (l <= x && x <= r) {
				t = cloneNode(u);
				if (a == NULL)
					a = t, b = a;
				else
					b->next = t, b = b->next;
				t->erase(x - l);
				t->next = u->next;
				break;
			} else {
				if (a == NULL)
					a = aliasNode(u), b = a;
				else
					b->next = aliasNode(u), b = b->next;
			}
		}
		return relaxList(a);
	}
	Node* insert(Node *ver, int x, int val) {
		Node *a, *b, *u, *v, *t;
		u = ver, a = NULL;
		for (int l = 1, r; u; l = r+1, u = u->next) {
			r = l + u->real()->A.size() - 1;
			if (l-1 <= x && x <= r) {
				t = cloneNode(u);
				if (a == NULL)
					a = t, b = a;
				else
					b->next = t, b = b->next;
				t->insert(x - l + 1, val);
				t->next = u->next;
				break;
			} else {
				if (a == NULL)
					a = aliasNode(u), b = a;
				else
					b->next = aliasNode(u), b = b->next;
			}
		}
		return relaxList(a);
	}
	Node* change(Node *ver, int x, int val) {
		Node *a, *b, *u, *v, *t;
		u = ver, a = NULL;
		for (int l = 1, r; u; l = r+1, u = u->next) {
			r = l + u->real()->A.size() - 1;
			if (l <= x && x <= r) {
				t = cloneNode(u);
				if (a == NULL)
					a = t, b = a;
				else
					b->next = t, b = b->next;
				t->change(x - l, val);
				t->next = u->next;
				break;
			} else {
				if (a == NULL)
					a = aliasNode(u), b = a;
				else
					b->next = aliasNode(u), b = b->next;
			}
		}
		return a;
	}
	int findRank(Node *ver, int L, int R, int val, int threshold = INT_MAX) {
		Node *u, *v;
		int ret = 0;
		u = ver;
		for (int l = 1, r; u != NULL; u = u->next, l = r+1) {
			r = l + u->real()->A.size() - 1;
			if (L <= l && r <= R) {
				ret += upper_bound(u->real()->B.begin(), u->real()->B.end(), val) - u->real()->B.begin();
				L = r + 1;
			} else if ((l <= L && L <= r) || (l <= R && R <= r)) {
				int i = L - l;
				while (i < u->real()->A.size() && L <= R) {
					if (u->real()->A[i] <= val)
						ret++;
					i++, L++;
				}
			}
			if (ret >= threshold)	return ret;
		}
		return ret;
	}
	int find(Node *ver, int L, int R, int k)  {	// kth-number
		int l = 0, r = 100005, mid, t = 0; // value in A[]
		while (l <= r) {
			mid = (l + r)/2;
			if (findRank(ver, L, R, mid, k) >= k)
				r = mid - 1, t = mid;
			else
				l = mid + 1;
		}
		return t;
	}
	Node* mergeNode(Node *u, Node *v) {
		Node *p, *q;
		Node *a = newNode();
		p = u->real(), q = v->real();
		a->next = v->next;
		a->A.insert(a->A.end(), p->A.begin(), p->A.end());
		a->A.insert(a->A.end(), q->A.begin(), q->A.end());
		a->B.resize(a->A.size());
		merge(p->B.begin(), p->B.end(), q->B.begin(), q->B.end(), a->B.begin());
		return a;
	}
	Node* splitNode(Node *u) {
		Node *t = u->real();
		Node *a = newNode(), *b = newNode();
		int n = t->A.size()/2;
		a->next = b, b->next = u->next;
		a->A.insert(a->A.begin(), t->A.begin(), t->A.begin()+n);
		b->A.insert(b->A.begin(), t->A.begin()+n, t->A.end());
		a->relax(), b->relax();
		return a;
	}
	Node* relaxList(Node *ver) {
	    Node *a, *b, *u, *v, *t;
	    int need = 0;
		for (u = ver, a = NULL; !need && u != NULL; u = u->next) {
	        if (u->next != NULL && u->real()->A.size() + u->next->real()->A.size() < (PSIZE<<1)) // merge
	        	need = 1;
	        if (u->real()->A.size() > (PSIZE<<1))	// split
	        	need = 1;
	    }
	    if (!need)
	    	return ver;
	    stack<Node*> remove;	// static used 
	    for (u = ver, a = NULL; u != NULL; u = u->next) {
	        if (u->next != NULL && u->real()->A.size() + u->next->real()->A.size() < (PSIZE<<1)) {	// merge
	        	if (a == NULL)
	        		a = mergeNode(u, u->next), b = a;
	        	else
	        		b->next = mergeNode(u, u->next), b = b->next;
	        	remove.push(u), remove.push(u->next); // static used  
				u = u->next;
	        } else if (u->real()->A.size() > (PSIZE<<1)) {	// split
	        	if (a == NULL)
	        		a = splitNode(u), b = a->next;
	        	else
	        		b->next = splitNode(u), b = b->next->next;
	        	remove.push(u); // static used  
	        } else {
	        	if (a == NULL)	
					a = aliasNode(u), b = a;
	        	else			
					b->next = aliasNode(u), b = b->next;
	        }
	    }
	    while (!remove.empty()) { // static used  
	    	u = remove.top(), remove.pop();
	    	delete u;
	    }	    	
	    return a;
	}
	void debug(Node *head) {
		Node *u = head;
		printf("[");
    	while (u != NULL) {
        	for(int i = 0; i < u->real()->A.size(); i++)
            	printf("%d%s", u->real()->A[i], i != u->real()->A.size()-1 ? " " : " ");
        	u = u->next;
    	}
    	puts("]");
	}
	void free() {
		return ;
		while (!mem.empty()) {
			Node *u = mem.top();
			mem.pop();
			delete u;
		}
	}
} dream; 

int A[MAXN], n, q;
UnrolledLinkedList::Node *ver[MAXQ];
int main() {
	int x, y, v;
	char cmd[10];
	while (scanf("%d", &n) == 1) {
		for (int i = 1; i <= n; i++)
			scanf("%d", &A[i]);
		ver[0] = dream.init(A, n);
//		dream.debug(ver[0]);
		int encrypt = 0;
		scanf("%d", &q);
		for (int i = 1; i <= q; i++) {
			scanf("%s", cmd);
			if (cmd[0] == 'I') {
				// insert A[x] = v
				scanf("%d %d", &x, &v);
				x ^= encrypt, v ^= encrypt;
				ver[i] = dream.insert(ver[i-1], x-1, v);
			} else if (cmd[0] == 'Q') {
				scanf("%d %d %d", &x, &y, &v);
				x ^= encrypt, y ^= encrypt, v ^= encrypt;
				int t = dream.find(ver[i-1], x, y, v);
				printf("%d\n", t);
				encrypt = t;
				ver[i] = ver[i-1];
			} else if (cmd[0] == 'M') {
				scanf("%d %d", &x, &v);
				x ^= encrypt, v ^= encrypt;
				ver[i] = dream.change(ver[i-1], x, v);
			}
//			dream.debug(ver[i]);
		}
	}
	return 0;
}
/*
5
1 2 3 4 5
9999
4 1 5 2
1 2 1
4 1 5 2
0 1
4 1 5 2
2 1
1 0 5
3 3 9
4 1 1 1

*/
