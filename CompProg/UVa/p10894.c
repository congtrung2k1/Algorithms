/**
Algorithm:
Simple programming but tedious...

*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>


const char *letters[][5] = {
    {"*****",        
     "*....",
     "*****",
     "....*",
     "*****"
    },
    {".***.",
     "*...*",
     "*****",
     "*...*",
     "*...*"},
    {"*...*",
     "*...*",
     "*...*",
     ".*.*.",
     "..*.."},
    {"*****",
     "*....",
     "***..",
     "*....",
     "*****"},
    {"*...*",
     "*...*",
     "*****",
     "*...*",
     "*...*"},
     {"*****",
      "*...*",
      "*****",
      "*.*..",
      "*..**"},
     {"*****",
      "..*..",
      "..*..",
      "..*..",
      "*****"
     },
     {
      "***  ",
      "*  * ",
      "*   *",
      "*  * ",
      "***  "
     },
     {
     "*****",
     "*   *",
     "*   *",
     "*   *",
     "*****"
     },
     {
     "*   *",
     " * * ",
     "  *  ",
     "  *  ",
     "  *  "
     }
};

const int num = 10; // 10 letters
#define TRANS(s) (s==' '? '.' : s)
// draw hori
void draw(int size)
{
      int i,j,k,l; int p;
      for (i=0; i < 5;i++){
       for(p=0;p<size;p++){
        for (j = 0; j < num ; j ++){
             const char*s = letters[j][i];
            for (l=0;l < 5;l++){ char c = TRANS(s[l]);
             for (k=0;k<size;k++){
                printf("%c", c);
             }
            }
            if (j == 3){ for(k=0;k < size;k++)printf("..."); }
            else if (j !=num-1){for(k=0;k<size;k++)printf(".");}

        }
      printf("\n");
      }
      }
}


void drawV(int size)
{

      int i,j,k,l; int p;
    for (j = 0; j < num ; j ++){
        
        for (i=0; i < 5;i++){
           const char*s = letters[j][i];
           for (p=0;p<size;p++){
            for (l=0;l < 5;l++){ char c = TRANS(s[l]);
             for (k=0;k<size;k++){
                printf("%c", c);
             }
            } printf("\n");
           }
        }

        for (p=0;p<size;p++){
        if (j == 3){for (l=0;l<3;l++){
                for(k=0;k < size;k++)printf("....."); printf("\n"); }}
         else if (j !=num-1){for(k=0;k<size;k++)printf(".....");printf("\n");}
      }}
}

int main()
{
    while (1){int n;
        scanf("%d", &n); if (n==0)break;
        if (n<0){ drawV(-n); printf("\n\n");}
        else {draw(n); printf("\n\n");}
        
    }
}

