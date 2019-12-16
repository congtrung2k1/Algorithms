#include <stdio.h>
#include <stdlib.h>

int main()
{
    int days[]={31,28,31,30,31,30,31,31,30,31,30,31};

    int mon = 0;
    int year = 1900;
    int num = 0;
    int dow = 0; // mon

    while  (year != 2000 || mon!=11)
    {
       int d = days[mon];
       if ( year % 400 == 0 ||
           (year % 4 == 0 && year %100!=0)
       ) { if (mon == 1) d ++; }

       dow = (dow + d ) % 7;

       if (dow == 6&& year>=1901) num++;
       mon++;
       if (mon==12) {year++;mon=0;}

    }
    printf("%d\n",num);
}
