/*
user: tbhtan31
LANG: C
TASK: beads
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

char beads[10000];
int nb;
int rgn[10000]={0};
char cc[1000];

int getbeads()
{
	FILE *in = fopen("beads.in", "r");
	fscanf	(in,"%d%s",&nb, beads);
int i;
char prev = beads[0];
int rgnidx = 0;
rgn[0] = 1;
cc[0] = prev;

for ( i = 1; i < nb;i++)
{
	char b= beads[i];
	if (b==prev)
	{
		rgn[rgnidx]++;
	}
	else
	{
		if (rgnidx >= 1 && cc[rgnidx-1] == b&&prev == 'w')
		{
			rgn[rgnidx-1] += 1+rgn[rgnidx];
			rgnidx--;	
		}
		else
		{
			rgnidx++;
			rgn[rgnidx] = 1;
			cc[rgnidx] =b ;
		}
	}
	prev = b;
} 

rgnidx++;
/*
for (i=0;i<rgnidx;i++)
{
	printf("%c:%d ", cc[i],rgn[i]);
}
exit(0);
*/
/* fix end case */
if ( rgnidx > 1 && cc[rgnidx-1] == cc[0])
{
	rgn[0] += rgn[rgnidx-1];
	rgnidx--;
}


if (rgnidx == 1)
{
	return rgn[0];
}

if (rgnidx == 2)
{
	return rgn[0] + rgn[1];
}

if (cc[rgnidx-1] == 'w' &&
    cc[rgnidx-2] == cc[0])
{
	rgn[0] += rgn[rgnidx-1] + rgn[rgnidx-2];
	rgnidx -= 2;
}

if (rgnidx ==1)return rgn[0];
if (rgnidx == 2 ) return rgn[0] + rgn[1];

if (cc[rgnidx-1] == cc[1] && cc[0] =='w')
{
	cc[0] = cc[1];
	rgn[0] += rgn[1] + rgn[rgnidx-1];
	memmove(&cc[1], &cc[2], sizeof(int)*rgnidx);
	memmove(&rgn[1],&rgn[2], sizeof(int)*rgnidx);
	rgnidx-=2;	
}

if (rgnidx ==1)return rgn[0];
if (rgnidx == 2 ) return rgn[0] + rgn[1];

int max = -1;
for ( i = 0; i < rgnidx;i++)
{
	int idxleft = (rgnidx+i-1)%rgnidx;
	int left = rgn[i];
	if (cc[idxleft] == 'w' || cc[i] == 'w')
		left += rgn[idxleft];

	int idxright  = (i+2)%rgnidx;
	int right = rgn[(i+1)%rgnidx];
	if (cc[idxright] == 'w' || cc[(i+1)%rgnidx] =='w')
		right += rgn[idxright];

	if (left+ right>max)max=left+right; 
}

return max>nb ? nb : max;
}


void main()
{
	FILE*out = fopen("beads.out","w");
	fprintf(out, "%d\n", getbeads());
	exit(0);
}


