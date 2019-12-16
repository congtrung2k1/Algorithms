/**
 * Algorithm:
 * Brute force by trying all permutations
 *
 */

#include<stdio.h>
#include<string.h>

char f[10];
char f2[10];
char* r[4][6]; // [axis][face]

// rotate around an axis
void swap(char ** r){
    int i;
    char t = *( r[3]);
    for (i=3; i > 0;i--){
        *(r[i]) = *(r[i-1]);
    }
    *(r[i]) = t;
}

bool chk(char*fo){
// try all 24 permutations
// some are repeated but doesn't matter
    int i,j,k;
            strcpy(f, fo);
            for (i=0;i <4;i++){
                swap(&r[1][0]);
                for (j=0; j < 4;j++){
                    swap(&r[2][0]);
                    if (strcmp(f, f2)==0) return true;
                }
            }
            strcpy(f, fo);
            for (i=0;i <4;i++){
                swap(&r[0][0]);
                for (j=0; j < 4;j++){
                    swap(&r[2][0]);
                    if (strcmp(f, f2)==0) return true;
                }
            }
return false;
}

int main(){
r[0][0] = &f[0];
r[0][1] = &f[5];
r[0][2] = &f[1];
r[0][3] = &f[3];

r[1][0] = &f[0];
r[1][1] = &f[2];
r[1][2] = &f[1];
r[1][3] = &f[4];

r[2][0] = &f[2];
r[2][1] = &f[5];
r[2][2] = &f[4];
r[2][3] = &f[3];

        int nu;
         scanf("%d", &nu);
         while (nu--){ char fo[90];
            scanf("%s%s", fo, f2);
            if (chk(fo)) printf("Equal\n");
            else printf("Not Equal\n");
         }
}

