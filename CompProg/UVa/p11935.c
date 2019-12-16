/**
Algorithm:
Simple simulation


*/
#include<stdio.h>
#include<string.h>
double leak;
double consum;
double total;

int main(){

    while (9){ int dist; int i, j,k; char s[999];
        scanf("%d%s%s%d", & i, s, s, &k);
        if (k==0) break;
        consum  = k;
        total=0;
        int last = 0;
        double max = 0;
        leak = 0;
        while (9){
            scanf("%d%s", &dist,s);
            
            total += (dist - last)/100.0*consum +
                (dist-last)*leak;
            if (total > max) max = total;
            if (strcmp(s,"Goal")==0){
                break;
            }
            else if (strcmp(s,"Fuel")==0){
                scanf("%s%d", s, &k);
                consum = k;
            }
            else if (strcmp(s,"Leak")==0){
                leak += 1;
            }
            else if (strcmp(s, "Gas")==0){
                scanf ("%s", s); // dummy
                total=0;
            }else if (strcmp(s, "Mechanic")==0){
                leak = 0;
            }last = dist;
        }
        printf("%.3lf\n", max);
    }

}


