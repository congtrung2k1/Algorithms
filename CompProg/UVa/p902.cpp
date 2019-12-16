#include <string>
#include <iostream>
#include <map>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
char msg[1000000];
 using namespace std;
int main()
{
	int n;
	map<string ,int> m;

	while (1)
	{
		int p =scanf("%d%s", &n,msg);
		if (p < 2) break;
		string str(msg,strlen(msg));
		int s = str.size();
		int i,j,max=0;string maxsub;
		for (i = 0; i < s - n+1;i++)
		{
			string sub = str.substr(i,n);
			int f = ++m[sub];
			if (f > max){max = f; maxsub =sub;}
		}

		std::cout << maxsub<<endl;
	}

}
