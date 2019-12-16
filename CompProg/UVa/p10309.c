/**
 * Algorithm:
 * Brute force first row and clear row by row subsequently.
 *
 * Theory:
 * The minimal solution consists of a sequence of moves.
 * Think of these moves as a series of XOR operations.
 * The usual associativity and XOR-the-same-thing-cancels-out properties
 * still apply.
 * So no two move should be on the same cell otherwise their effects
 * cancel each other out.
 * Due to associativity, we can apply moves from the sequence 
 * in any order and still be able to get the board cleared.
 *
 * We exploit associativity here by finding the correct moves 
 * starting from the top most to bottom most row.
 * We brute force on the first row by considering all 2^10 possibilities.
 * And one of these possibilities must be part of the minimal solution.
 * The second row of the minimal solution must then clear any remaining
 * lighted cells in the first row. And so on ...
 *
 * */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>


char board[11][11]; // 1 => on / O
int ngoal = 0; // # off

void click(int r, int c)
{
    if (c > 0){ if (board[r][c-1]^= 1)ngoal--; else ngoal++;  }
    if (r > 0){ if (board[r-1][c]^= 1)ngoal--; else ngoal++;  }
    if (c <9){ if (board[r][c+1]^= 1)ngoal--; else ngoal++;  }
    if (r <9){ if (board[r+1][c]^= 1)ngoal--; else ngoal++;  }
    if (board[r][c] ^= 1) ngoal --; else ngoal++;
}
char name[999];

int find()
{
    int i,j; int m = 0;
    for (i=1; i < 10;i++){
        for (j=0;j<10;j++){
            if (board[i-1][j]!=0 ){ click(i,j);m++;
                if (m > 100) return 101;
            }
                
        }
    }
    if (ngoal == 100)
        return m;

    return 101;
}

void doit()
{
    int i,j;
    char real[11][11];
    int orig = ngoal;
    int minmoves = 101;
    memcpy(real, board, sizeof(board));
    for (i=0;i < (1<<10);i++){
        
        memcpy(board, real, sizeof(board));
        ngoal = orig;
        int m=0;
        for (j=0; j < 10;j++){
            if ( i & (1<<j)) {m++;click(0, j);}
        }
        
        m += find();
        if (m<minmoves)minmoves=m;
    }
    printf("%s %d\n", name, minmoves >= 101 ? -1 : minmoves);
}

int main()
{
    while(11){
        scanf("%s", name);
        if (strcmp(name,"end")==0)break;
        int i,j;
            ngoal=100;
        for(i=0;i<10;i++){
                char s[100];
            scanf("%s", s);
            for (j=0;j<10;j++){
                if (s[j] == '#'){board[i][j] = 0;}
                else {board[i][j]=1; ngoal--;}
            }
        }
        doit();
    }
}

