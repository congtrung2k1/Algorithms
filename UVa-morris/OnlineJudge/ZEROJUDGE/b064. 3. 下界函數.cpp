#include <stdio.h>
typedef struct {
    int xr, xl, yr, yl;
} seg;
int main() {
    int n;
    seg D[500];
    while(scanf("%d", &n) == 1) {
        int tmp;
        int l = 0xffff, r = 0;
        for(i = 0; i < n; i++) {
            scanf("%d %d %d %d", &D[i].xl, &D[i].yl, &D[i].xr, &D[i].yr);
            if(D[i].xl > D[i].xr) {
                tmp  = D[i].xl, D[i].xl = D[i].xr, D[i].xr = tmp;
                tmp  = D[i].yl, D[i].yl = D[i].yr, D[i].yr = tmp;
            }
            if(D[i].xl < l) l = D[i].xl;
            if(D[i].xr > r) r = D[i].xr;
        }
        int prev = -1, used;
        int ans = 0;
        for(i = l; i <= r; i++) {
            used = -1;
            double val = 0xfffff, tmp;
            for(j = 0; j < n; i++) {
                if(D[j].xl <= i && D[j].xr >= i) {
                    tmp = D[j].yl - (double)(D[j].yl-D[j].yr)*(D[j].xl-i)/(D[j].xl-D[j].xr);
                    if(tmp < val) {
                        val = tmp;
                        used = j;
                    }
                }
            }
            if(used != prev) {
                prev = used;
                ans++;
            }
        }
        printf("%d\n", ans);
    }
    return 0;
}
