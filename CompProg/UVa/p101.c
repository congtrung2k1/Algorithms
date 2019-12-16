/**
* Algorithm:
* Normal linked list manipulation
*
* Gotchas:
* - I didn't use a linked list . Instead I used an array based approach
*   which took me longer than usual... Frankly I don't expect any one to
*   understand the code below =p
*/

#include <stdio.h>
#include <stdlib.h>

#include <string.h>

int world[30][30];
int loc[30];
int nblocks ;


void ret(int a)
{
	int aloc = loc[a];
	int i,j;
	int s = 0;
	for (i=0; ; i++)
	{
		int k = world[aloc][i];

		if (k == a)
		{
			break;	
		}
	}

	for (i++; ; i++)
	{
		int k=  world[aloc][i];
		if (k < 0) break;
		loc[k] = k;
		world[k][0] = k;
		world[k][1] = -1;
	}
	/*	else if (k == -1 ) break;
		else if (ret)
		{

			loc[k] = world[aloc][i];
			
			world[aloc][i] = -1;
			
			}
	}*/
	
}

void remove1(int a)
{
	int i,j,k;
	int aloc= loc[a];
	for (i = 0; ;i++)
	{
		if (world[aloc][i] == a)
		{
			world[aloc][i]=-1;
			break;
		}
	}
}

void move(int a, int b, int isonto)
{
int i,j,k;
	if (a==b) return;
	if (a < 0|| a>=nblocks || b <0 || b >=nblocks) return;
	if (loc[a] == loc[b] ) return;
	if (isonto)
	{
		ret(a);
		remove1(a);ret(b);
		int bloc = loc[b];
		for (i  =0;;i++)
		{
			if (world[bloc][i] == b)
			{
				world[bloc][i+1] = a;
				world[bloc][i+2] = -1;
				loc[a] =bloc; break;
			}
		}	
		return;
	}
	
		int bloc = loc[b];
	ret(a);
	remove1(a);
	
		for (i  =0;;i++)
		{
			if (world[bloc][i] == -1)
			{
				world[bloc][i] = a;
				world[bloc][i+1]=-1;
				loc[a] =bloc; break;
			}
		}	
}

void pile(int a, int b, int isonto)
{
int aindex;
int aindex_e;
int i,j,k;
int aloc = loc[a];
int bloc = loc[b];
	if (a==b) return;
	if (a < 0|| a>=nblocks || b <0 || b >=nblocks) return;
	if (loc[a] == loc[b] ) return;
	if (isonto)
	{
		ret(b);

		for (i = 0; ; i++)
		{
			if (world[aloc][i] == a)
			{
				aindex = i; 
break;			}		
		}
		for (;;i++)
		{
			
			if (world[aloc][i] == -1){aindex_e =i-1; break;}
			loc[ world[aloc][i] ] = bloc;		
		}	
		for (i=0; ;i++)
		{
			if (world[bloc][i] == b)
			{
				memcpy(&world[bloc][i+1], 
 				&world[aloc][aindex],
				4*(aindex_e - aindex + 1));
				world[bloc][i+1+aindex_e-aindex+1]=-1;break;
			}
		}
		world[aloc][aindex] = -1;
		return;
	}

	
		for (i = 0; ; i++)
		{
			if (world[aloc][i] == a)
			{
				aindex = i; 
break;			}		
		}
		for (;;i++)
		{
			
			if (world[aloc][i] == -1){aindex_e =i-1; break;}
			loc[ world[aloc][i] ] = bloc;		
		}	
		for (i=0; ;i++)
		{
			if (world[bloc][i] == -1)
			{
				memcpy(&world[bloc][i], 
 				&world[aloc][aindex],
				4*(aindex_e - aindex + 1));
				world[bloc][i+aindex_e-aindex+1]=-1;break;
			}
		}
		world[aloc][aindex] = -1;
}

int main()
{
	int j;
	int i;
	scanf("%d",&nblocks);


		/* init world */
	for (i=0;i < nblocks;i++)
	{
		loc[i] = i;
		world[i][0] = i;
		world[i][1] = -1;
	}
	for (i = 0;;i++)
	{
		char cmd[100]; 
		char onto[100];
		int a, b;
		int isonto;
		scanf("%s%d%s%d", cmd, &a, onto, &b);
		if (0==strcmp(cmd,"quit")) break;
		isonto = (0==strcmp(onto,"onto"));
		if (0==strcmp(cmd,"move"))
		{
			move(a,b,isonto);
		}
		if (0==strcmp(cmd,"pile"))
			pile(a,b,isonto);
		
	}

	for (i=  0; i < nblocks;i++)
	{
		printf("%d:",i);
		for (j=0; world[i][j]!=-1;j++)
		{
			printf(" %d", world[i][j]);
		}	
		printf("\n");
	}

	return 0;
}


