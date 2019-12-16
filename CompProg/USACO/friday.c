/*
User: tbhtan31
LANG: C
TASK: friday
*/


#include <stdio.h>

int freq[10] = {0};
int days[] = {

31, /*jan*/
28,
31, /*mar*/
30,
31,
30, /*june*/
31,
31,
30,
31,
30,
31
};
void main()
{
	FILE * in = fopen("friday.in", "r");
	FILE *out =fopen("friday.out", "w");
	int N;

	fscanf(in,"%d",&N);

	int i;
	int dow = 2;
	int year = 1900;
	for (i=0;i <N;i++)
	{
		year = 1900+i;
		if (year % 400 == 0 ||(
 year % 100 != 0 && year % 4==0)) days[1] = 29;
else days[1] = 28;
 int j;
		for (j=0;j<12;j++)
		{
			freq[(dow + 12)%7] ++;
			dow = (dow + days[j]) % 7;
		}		
	}
for (i=0;i<7;i++) {
fprintf(out, "%d",freq[i]);
if (i<6) fprintf(out, " ");
}
fprintf(out,"\n");
exit(0);
}

