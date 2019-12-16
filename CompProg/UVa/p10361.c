#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char s1[10000];
char s2[10000];

void doit()
{
    int len1 = strlen(s1);
    int len2 = strlen(s2);

    char out1[1000];
    int i;
    
    char s[6][1000];
    memset(s,0,sizeof(s));
    char s3[1000];
    char s4[1000]; int outp = 0;
    char s5[1000]; int k = 1;
    int open = 0; int a =0;
    for(i=0;i<len1;i++){
        char c = s1[i];
            if (c == '<')
            {
                open=1;a=0; k++;
            }
            else if (c=='>'){
                open =0;a=0; k++;
            }
        else{

            out1[outp ++]=c;
            if ( k>= 2 ){ s[k][a++] = c; }
        }
    }
out1[outp]=0;

    char out2[1000];
    char * ss = strstr( s2, "...");
    memset(out2,0,sizeof(out2));
    memcpy(out2, s2, len2);
    *ss=0;
    sprintf(&out2[0]+(int)(ss-&s2[0]), "%s%s%s%s",& s[4][0], &s[3][0], &s[2][0], &s[5][0]);
//        for(i=0;i < len2;i++){
            
  //      }
    
    printf("%s\n",out1);
    printf("%s\n",out2);

}
int main()
{
     int nu;
     scanf("%d", &nu);
char s[999];gets(s);    while (nu--){
        if (!gets(s1)) break;
        gets(s2);

        doit();
    }
}
