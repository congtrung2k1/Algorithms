#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int m[100][101];
int f[100][101];
int r[100][101];
int nr,nc;

int paths[101][330];

int comp(const void *a,const void *b)
{
	int i,j;
	int *ia = (int*)a;
	int *ib = (int*)b;
	for (i=0;i<nc;i++)
	{
		if (ia[i] != ib[i]) return ia[i]-ib[i];
	}
	return 0;
}

void doit()
{
	int i,j,k;
	for (i = 0; i < nr ;i++) {f[i][nc-1]=m[i][nc-1];r[i][nc-1] = i;}
	for (j =nc-2; j >=0;j--){
		int a = f[nr-1][j+1];
		int b = f[0][j+1];
		int c = f[1%nr][j+1];
		int min =b, minidx=0;
		if (c < min){min=c;minidx = 1%nr;}
		if (a<min){min=a;minidx=nr-1;}
		f[0][j] = m[0][j]+min;
		r[0][j] = minidx;
		for (i=1;i < nr-1;i++){
			 a = f[(i+nr-1)%nr][j+1];
			 b = f[i][j+1];
			 c = f[(i+1)%nr][j+1];
			 min = a;
			 minidx = (i+nr-1)%nr;
			if (b < min) {min = b; minidx = i;}
			if (c <min){min=c; minidx = (i+1)%nr;} 
			f[i][j] =m[i][j]+ min;
			r[i][j]=minidx;
		}
	
		if (nr-2 >= 0){
			i = nr-1;
			 a = f[(i+nr-1)%nr][j+1];
			 b = f[i][j+1];
			 c = f[(i+1)%nr][j+1];
			 min = c;
			 minidx = 0;
			if (a < min) {min = a; minidx = (i+nr-1)%nr;}
			if (b <min){min=b; minidx = (i)%nr;} 
			f[i][j] =m[i][j]+ min;
			r[i][j]=minidx;
		}
	}
	int minidx = 0;
	int min = f[0][0];
	for (i=1;i<nr;i++){
		if (f[i][0] < min){min=f[i][0]; minidx=i;}
	}
	int kk=0;int numpaths = 0;
//	for(i=0;i<nr;i++){
//		if (f[i][nc-1] != min) continue;
//		minidx = i;
/*		kk=nc-1;
		paths[numpaths][kk--] = minidx+1;
		for (j = nc-1; j >=1;j--){
			minidx = r[minidx][j];
			paths[numpaths][kk--]=minidx+1;
		}
		numpaths++;
	}
	qsort(paths,numpaths,sizeof(paths[0]),comp);
*/
		printf("%d",minidx+1);
		for (i=0;i<nc-1;i++){
			//if (i!=0)printf(" ");
			minidx = r[minidx][i];
			printf(" %d",minidx+1);
		}
	

	printf("\n");
		printf("%d\n",min);
	
}

int main()
{
	int i,j,k;
	while(1){
		k=scanf("%d%d",&nr,&nc);
		if (k<2 || nr == 0 ) break;
	
		for (i=0;i < nr ;i++){
			for (j=0;j < nc;j++){
				scanf("%d", &m[i][j]);
			}
		}
		doit();
	}
	return 0;
}

