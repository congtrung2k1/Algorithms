/**
 * Algorithm:
 * Backtracking + brute force
 *
 * */
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
char * digits[] = {
    "0001101",
    "0011001",
    "0010011",
    "0111101",
    "0100011",
    "0110001",
    "0101111",
    "0111011",
    "0110111",
    "0001011"
};

char *rdigits[]={
    "1110010",
    "1100110",
    "1101100",
    "1000010",
    "1011100",
    "1001110",
    "1010000",
    "1000100",
    "1001000",
    "1110100"
};
int max;
char in[100]; // input of 1 & 0s
bool dblur[20]; // whether  digit i is not clear 
int out[10][15]; // soln in digits
int dstk[100]; // digits stack
int outcnt ;

int chksum(int*s){
    int sum=0;
    int i,j;
    for(i=0;i<12;i+=2){
        sum += s[i];
    }
    sum *= 3;
    for (i=1; i<10;i+=2){
        sum += s[i];
    }
    sum %= 10;
    return sum==0?0:(10-sum);
}

int comp(const void *a, const void *b){
    int i,j;
    int * aa = (int*)a;
    int * bb = (int*) b;
    for (i=0;i < 12;i++){
        if ( aa[i] != bb[i]) return aa[i]-bb[i];
    }
    return 0;
}

int find(int digitidx){
    if (digitidx == 12){
        int ss = chksum(dstk);
        if (ss == dstk[11]){
            memcpy (&out[outcnt][0], dstk, 12*sizeof(int));
            outcnt++;
        }
        return outcnt == max;
    }

        if (!dblur[digitidx]){
            return find(digitidx+1);
        }

    int i,j;
    int pos = 3+digitidx * 7;
    
    if (digitidx >= 6) { // R
        pos += 5;

    for (i=0; i <  10;i++){
        char * ss = rdigits[i];
        int mis = 0;
        for (j=0; j < 7;j++){
            if (ss[j] != in[pos+j] &&
                    in[pos+j] != '?'){mis++;break;}
        } if (mis) continue;
        dstk[digitidx] = i;
        if (find(digitidx+1)) return 1;
    }
        return 0;
    }

    // L
    for (i=0; i <  10;i++){
        char * ss = digits[i];
        int mis = 0;
        for (j=0; j < 7;j++){
            if (ss[j] != in[pos+j] &&
                    in[pos+j] != '?'){mis++;break;}
        }
        if (mis > 0) continue;
        dstk[digitidx] = i;
        if (find(digitidx+1)) return 1;
    }return 0;
}

void doit(){
    int i,j;
    if (strncmp(in, "101", 3) ||
            strncmp(&in[3+6*7], "01010",5)||
        strncmp(&in[92], "101", 3)) return ;

    memset(dblur, 1,sizeof(dblur));

        for (i=0;i < 12;i++){
            int pos = 3 + i * 7;
            char **a = digits;
            if (i>=6){
                a = rdigits;
            pos+= 5;}
            for (j=0;j < 10;j++){
            if (strncmp( a[j],  &in[pos], 7)==0){
                dblur[i]= false;
                dstk[i] = j;
                break;
            }}
        }

        find (0);
}
int main()
{
    int nu;scanf ("%d", &nu);
    while (nu--){ int cc;
        scanf ("%d", &cc);
        char s[999];
        gets(s); gets(s);
        int l = strlen(s);
        strcpy ( in, s);
        gets(& in[l]);
        int i,j;

        max =  9;
        outcnt=0; doit();
        l=strlen(in);
        for (i=0;i<= l/2;i++){
            char t = in[i];
            in[i] = in[l-1-i];
            in[l-i-1] = t;
        }
        max = 18;
        doit();

        qsort( out, outcnt, sizeof(out[0]), comp);
        int pp = outcnt;
        if (outcnt > 8) {outcnt = 9; pp =8;}
        printf("%d %d\n", cc, outcnt);
        for (i=0; i < pp;i++){
            for (j=0;j < 12;j++){
                printf("%d", out[i][j]);
            }
            printf ("\n");
        }

    }
}



