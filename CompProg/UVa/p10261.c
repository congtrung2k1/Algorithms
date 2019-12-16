#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int f[205][10010];
int cars[205];
int rr[205][10010];
int n;

int maxcars(int idx, int len1, int len2)
{
	if (idx == n) return 0;

	if (f[idx][len1] > 0) { return f[idx][len1];}

	int k,k2,c = cars[idx];
	if (len1 >= c && len2 >= c){
		k = maxcars(idx+1,len1-c,len2);
		k2 = maxcars(idx+1,len1,len2-c);
		if (k>k2) {
            rr[idx][len1] = 0;
		}
		else {
        k=k2; rr[idx][len1]=1;
		 }
	}
	else if (len1 >= c) {
		k = maxcars( idx+1, len1-c, len2 );
		rr[idx][len1]=0;
	}
	else if(len2 >=c){
		k=maxcars(idx+1,len1,len2-c);
		rr[idx][len1]=1;
	}
	else return 0;

	return f[idx][len1]=k+1;
}

int main()
{
	int len,i,j,k; int nu;
	scanf("%d",&nu);
	int first = 1;
    
	while (nu--){

        if (!first) printf("\n");
        first=0;
            
		scanf("%d",&len);
		n=0;
		for (i=0;i <= 201 ;i++){
			scanf("%d",&cars[i]);
			if (cars[i]==0)break; 
			n++;
		}

		if (n == 0 || len*100 < cars[0]){ printf("0\n");continue;}
		if (n==1) {printf("1\nport\n"); continue;}
		
        memset(f,0,sizeof(f));
       
        int max = 1+maxcars(1,len*100-cars[0],len*100);
		printf("%d\n",max);
        
        int ll = len*100;
        rr[0][ll] = 0;
        
        for (i=0; i<max;i++){
            
            printf("%s\n", rr[i][ll]? "starboard" : "port");
            if (!rr[i][ll]) ll -= cars[i];
        }
	}
return 0;
}

