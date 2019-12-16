#include <stdio.h>
#include <stdlib.h>
#include<string.h>
char s[10000];
int count[30];
int main(){
int casen=0;
    int n;
    scanf("%d",&n);gets(s);
    while (n--){
        gets(s);
        int len = strlen(s);
        memset( count,0,sizeof count);
        for  (int i = 0; i < len ;i++){
            char c = s[i];
            if ('A'<=c&&c<='Z')
            count[c-'A']++;
        }

// H
// A
// C 2
// K
// E
// R
// U
// P
        int times=0;
        while ( count[ 'H'-'A'] && count [0] && count['C'-'A'] >= 2
         && count['K'-'A'] && count['E'-'A'] && count['R'-'A']
         && count['U'-'A'] && count ['P'-'A'] ){
         
         count[ 'H'-'A'] --;
          count [0] --;
           (count['C'-'A'] -= 2);
         count['K'-'A']-- ; 
         count['E'-'A']-- ;
          count['R'-'A']--
         ; count['U'-'A']-- ;;count ['P'-'A']--;// ){
        times++;            
         }
         casen++;
         printf("Case #%d: %d\n",casen, times);;
    }
}
