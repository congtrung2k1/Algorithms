#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char num[200][50];
int k[2300];

int main()
{
    int i,j;

    memset(k, 0, sizeof(k));
    for (i = 0; i < 100; i ++)
    {
        scanf("%s", num[i]);
    }

    int carry = 0;
    for (i = 49;  i >= 0; i --)
    {
        int sum = carry;
        for (j = 0; j < 100;j++)
        {
            sum += num[j][i]-'0';

        }

        k[i] = sum%10;
        carry = (sum/10);
    }

    k[0] += carry*10;

    char ans[200];

    sprintf(ans, "%d", k[0]);

    int len = strlen(ans);
    j=1;
    for (; len < 10;)
      ans[len++] = k[j++]+'0';


    ans[len] = 0;

    printf("%s\n",ans);
}

