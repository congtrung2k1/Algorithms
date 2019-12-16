/**
Algorithm:
Matrix multiplication

Theory:
If the graph has a diameter of > 3, then what would the complement's
diameter be ?

Gotchas:
- If # city == 1, then no airline should be bought.
  Output "0\n\n"
*/
#include<string.h>
#include<stdio.h>

int nnode;
int ncity;
int mat1[202][202];
int mat2[202][202];
int mat3[202][202];

void mul(int mat1[202][202], int mat2[202][202], int mat3[202][202]){
    int i,j;
    for (i=0;i < ncity; i++){
        for (int k = 0; k < ncity;k++){
                int sum = 0;
                for (j=  0; j <ncity;j++){
                    sum += mat1[i][j] * mat2[j][k];
                }
                mat3[i][k] = sum;
        }
    }
}

int main(){
    scanf("%d%d", &ncity, &nnode);
    int i,j; int p = 0;
    for (i=0;i < ncity; i++){
        for (j=0;j < ncity; j++){int k;
            scanf("%d", & k);
            if (k && k <= (1+nnode)/2){
                mat1[i][j] = 1;
                mat1[j][i] = 1;
            }
        }
        mat1[i][i] = 1;
    }

    bool k=true;
    mul(mat1, mat1, mat2);
    mul(mat2, mat1, mat3);
    for (i=0; i < ncity;i++){
        for (j = 0; j < ncity; j++){
            if (mat3[i][j] == 0){k=false; i=ncity;break;}
        }
    }

    int start = 1;
    int end = (1+nnode)/2;
    if (k){
        printf("%d\n",(1+nnode)/2);
         
    }else {
        printf("%d\n", nnode - (1+nnode)/2);
        start = (1+nnode)/2 + 1;
        end = nnode;
    }
  if (start<=end)  printf("%d",start);
    for (i = start+1; i <= end; i++){
        printf(" %d",i);
    }printf("\n");
}

