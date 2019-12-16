#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <algorithm>
using namespace std;

struct SuffixArray {
    int sa[1005], h[1005], n;
    int w[1005], ta[1005], tb[1005];
    char str[1005];
    void sort(int *x, int *y, int m) {
        static int i;
        for(i = 0; i < m; i++)
            w[i] = 0;
        for(i = 0; i < n; i++)
            w[x[y[i]]]++;
        for(i = 1; i < m; i++)
            w[i] += w[i-1];
        for(i = n-1; i >= 0; i--)
            sa[--w[x[y[i]]]] = y[i];
    }
    bool cmp(int *r, int a, int b, int l) {
        if(r[a] == r[b]) {
            if(a+l >= n || b+l >= n)
                return false;
            return r[a+l] == r[b+l];
        }
        return false;
    }
    void build_h() {
        int i, j, k;
        for(i = 0; i < n; i++)  ta[sa[i]] = i;
        for(i = 0; i < n; i++) {
            if(ta[i] == 0) {
                h[ta[i]] = 0;
                continue;
            }
            if(i == 0 || h[ta[i-1]] <= 1)
                k = 0;
            else
                k = h[ta[i-1]]-1;
            while(str[sa[ta[i]-1]+k] == str[sa[ta[i]]+k])
                k++;
            h[ta[i]] = k;
        }
    }
    void build() {// x: rank, y: second key
        int i, k, m = 128, p;
        int *x = ta, *y = tb, *z;
        n = strlen(str);
        x[n] = 0;
        for(i = 0; i < n; i++)
            x[i] = str[i], y[i] = i;
        sort(x, y, m);
        for(k = 1, p = 1; p < n; k *= 2, m = p) {
            for(p = 0, i = n-k; i < n; i++)
                y[p++] = i;
            for(i = 0; i < n; i++) {
                if(sa[i] >= k) {
                    y[p++] = sa[i]-k;
                }
            }
            sort(x, y, m);
            z = x, x = y, y = z;
            for(i = 1, p = 1, x[sa[0]] = 0; i < n; i++)
                x[sa[i]] = cmp(y, sa[i-1], sa[i], k) ? p-1 : p++;
        }
    }
};
int main() {
    SuffixArray in;
    while(gets(in.str) && in.str[0] != '\0') {
    	int n = 0;
    	for(int i = 0; in.str[i]; i++)
    		if(in.str[i] != ' ')
    			in.str[n++] = in.str[i];
    	in.str[n] = '\0';
    	
        in.build();
        in.build_h();
        
        if(n == 0)
        	puts("0");
        for(int i = 1; i <= in.n; i++) {
        	int cnt = 0, ret = 0;
        	for(int j = 0; j < in.n; j++) {
        		if(in.h[j] >= i)
        			cnt++;
        		else
        			ret = max(ret, cnt), cnt = 0;
        	}
        	ret = max(ret, cnt);
        	if(ret <= 0)
        		break;
        	printf("%d\n", ret + 1);
        }
        puts("");
    }
    return 0;
}
