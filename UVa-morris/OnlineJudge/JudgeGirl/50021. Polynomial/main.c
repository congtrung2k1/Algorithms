#include "polynomial.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

void test_spec0() {
	int n, m;
	int cmds, cmd, pid;
	int v[4096];
	scanf("%d", &n);
	Polynomial *p = (Polynomial*) malloc(sizeof(Polynomial)*n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &m);
		for (int j = 0; j < m; j++)
			scanf("%d", &v[j]);
		init(&p[i], v, m);
	}
	scanf("%d", &cmds);
	for (int i = 0; i < cmds; i++) {
		scanf("%d %d", &cmd, &pid);
		if (cmd == 1) {
			print(&p[pid]);
		} else {
			assert(0);
		}
	}
}
void test_spec1() {
	int n, m;
	int cmds, cmd, pid, pid2;
	int v[4096];
	scanf("%d", &n);
	Polynomial *p = (Polynomial*) malloc(sizeof(Polynomial)*n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &m);
		for (int j = 0; j < m; j++)
			scanf("%d", &v[j]);
		init(&p[i], v, m);
	}
	scanf("%d", &cmds);
	for (int i = 0; i < cmds; i++) {
		scanf("%d %d", &cmd, &pid);
		if (cmd == 1) {
			print(&p[pid]);
		} else if (cmd == 2) {
			scanf("%d", &pid2);
			Polynomial ret = add(&p[pid], &p[pid2]);
			print(&ret);
		} else {
			assert(0);
		}
	}
}
void test_spec2() {
	int n, m;
	int cmds, cmd, pid, pid2;
	int v[4096];
	scanf("%d", &n);
	Polynomial *p = (Polynomial*) malloc(sizeof(Polynomial)*n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &m);
		for (int j = 0; j < m; j++)
			scanf("%d", &v[j]);
		init(&p[i], v, m);
	}
	scanf("%d", &cmds);
	for (int i = 0; i < cmds; i++) {
		scanf("%d %d", &cmd, &pid);
		if (cmd == 1) {
			print(&p[pid]);
		} else if (cmd == 2) {
			scanf("%d", &pid2);
			Polynomial ret = add(&p[pid], &p[pid2]);
			print(&ret);
		} else if (cmd == 3) {
			scanf("%d", &pid2);
			Polynomial ret = multiply(&p[pid], &p[pid2]);
			print(&ret);
		} else {
			assert(0);
		}
	}
}
int main() {
	int spec;
	void (*FUNC[])() = {test_spec0, test_spec1, test_spec2, test_spec2};
	while (scanf("%d", &spec) == 1)
		FUNC[spec]();
	return 0;
}
/*
2
3
3 -3 2 3
2 0 1
3 1 0 1
6
1 0
1 1
1 2
2 0 1
3 0 1
3 0 2
*/
