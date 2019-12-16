/*
Algorithm:
Brute force

Pre-generate all words from length 1 to 7

To improve speed: pre-calculate the arrays cache1 and total1

Gotchas:
- Must compare with words that have same first letter
*/
#include<string.h>
#include<stdio.h>

typedef long long ll;

ll p[30] = {
   1253, 142, 468, 586, 1368, 69, 101,70,625,44,0,
   497,315,671,868,251,88,687,798,463,393,90,2,22,90,52
}; // P of each letter, 0=>A
ll cache1[27][8];  // sum SBC of words of length i
int total1[27][8]; // total[a][i] = # of words of length i, start with a
char cnt[30];

void doit(){
    int i,j,k,l,m,n,o,q;
    const char *odd = "bcdfghjklmnpqrstvwxyz";
    const char *even="aeiou";
    char oo[30];
    char ee[30];
    for (i=0; i<21; i++){
        oo[i] = odd[i]- 'a';
    }
    for (i=0;i<5;i++){
        ee[i] = even[i] - 'a';
    }
    for (i=0;i<21;i++){
        char c0 = oo[i]; cnt[c0]++;
        ll sum = p[c0];
        ll * cache = &cache1[c0][0];
        int *total = &total1[c0][0];
        for (j = 0; j <5;j++){
            char c1 = ee[j]; cnt[c1]++;
            sum += 2*p[c1];

            for (k = 0; k < 21; k++){
            
                char c2 = oo[k]; cnt[c2]++;
                sum += 3*p[c2];

                for (l=0;l<5;l++){
                
                    char c3 = ee[l]; cnt[c3]++;
                    sum += 4*p[c3];

                    for (m=0;m<21;m++){
                    

                        char c4 = oo[m];
                        if (cnt[c4]>=2)continue;
                        cnt[c4]++;
                        sum+=5*p[c4];

                        for (n =0; n<5;n++){
                        

                            char c5 = ee[n];
                            if (cnt[c5]>=2)continue;
                            cnt[c5]++;sum+=6*p[c5];

                            for (o = 0; o < 21;o++){
                                char c6 = oo[o];
                                if(cnt[c6]>=2)continue;
                                sum+=7*p[c6];
                            
                                cache[7] += sum;
                                total[7]++;
                                sum -= 7*p[c6];
                            }

                            cnt[c5]--; cache[6] += sum;
                            total[6]++; sum-=6*p[c5];
                        }

                        cnt[c4]--; cache[5] += sum;
                        total[5]++; sum-=5*p[c4];
                    }
                        cnt[c3]--; cache[4] += sum;
                        total[4]++; sum-=4*p[c3];
                }
                        cnt[c2]--; cache[3] += sum;
                        total[3]++; sum-=3*p[c2];

            }
                        cnt[c1]--; cache[2] += sum;
                        total[2]++; sum-=2*p[c1];
        }
                        cnt[c0]--; cache[1] += sum;
                        total[1]++; sum-=p[c0];
    }
}

int main(){

    doit();
    int nu;scanf("%d", &nu);

    while (nu--){
        char s[999];
        scanf("%s", s);
        int i,j; ll sum=0; 
        int len=0; char first = s[0]-'a';
        for (i=0; s[i];i++){
        len++;    sum += (i+1) *p[s[i]-'a'];
        }
        ll w = total1[first][len] * sum ;
        if (w < cache1[first][len]) printf("below\n");
        else printf("above or equal\n");
    }
}

