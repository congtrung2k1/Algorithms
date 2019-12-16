#include <map>
#include <string>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include<deque>
using namespace std;
map<string,int> nameMap;
map<int,string> idxMap;
int n;
int qq[1000];

// front / top
//
// back / bottom

void remove(int r)
{
	int num = qq[r];
	int i,j,k;

	int store = n-1;

	for(i=n-1; i>=0;i--){
		if (qq[i] > num){
			qq[store] = qq[i];
			store--;
		}
	}

	i = num;
	while (store >= 0){
		qq[store--] = i--;
	}

	for (i=num; i>=0;i--){
        printf("%s\n", idxMap[i].c_str());
	}
}

void doit()
{
    int i,j,k;
    int r;

   for (i=n-1;i >=0;i--){
		for (j=0; j < n;j++){
			if (qq[j] == i) break;
		}
		r=j;
		k=0;
		for (; j<n;j++){
			if (qq[j] > i)k++;
		}
		if (k != n-1-i) remove(r);
	}
  
}

char nn[1000][90];

int main()
{
    int nu;
    scanf("%d",&nu);
    while (nu--)
    {
        scanf("%d",&n);
        int i,j,k;char s[1000];gets(s);
        for (i=0;i<n;i++){
            gets(&nn[i][0]);
        }
        for (i=0;i<n;i++){
            gets(s);
            string name(s);
            nameMap[name] = i;
            idxMap[i] = name;
        }
        for (i=0;i<n;i++){
            string name(&nn[i][0]);
        	qq[i] = nameMap[name];
        }
        doit();
        printf("\n");
    }return 0;
}
