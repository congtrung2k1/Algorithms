/**
 * Algorithm:
 * Simple bitmasks manipulation
 * Well actually you don't really have to use a bitmask
 *
 * Gotchas:
 * - Make sure you type carefully!
 */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define bin(a,b,c,d,e,f,g) (a*64+b*32+c*16+d*8+e*4+f*2+g)

int masks[]={
bin(1,1,1,1,1,1,0),
bin(0,1,1,0,0,0,0),
bin(1,1,0,1,1,0,1),
bin(1,1,1,1,0,0,1),
bin(0,1,1,0,0,1,1),
bin(1,0,1,1,0,1,1),
bin(1,0,1,1,1,1,1),
bin(1,1,1,0,0,0,0),
bin(1,1,1,1,1,1,1),
bin(1,1,1,1,0,1,1)
};

// convert yes's/no's to mask
int tomask(char *c)
{
    int m = 0;
    int j = 64;
    for (int i=0;i<7;i++){
        if(c[i]=='Y') m |= j;
        j >>= 1;
    }return m;
}

int input[20];
int n;

// get mask: zeros mean bulbs definitely not working
// ones mean bulb *might* be working
int getworking(int d, int b)
{
    int c=d^b;
    return ((1<<7)-1) ^c;
}
bool is(int workingmask, int curidx, int expectN)
{

    int i,j;
    for (i=expectN;i>=0;i--){
        
        if (curidx==n)return true;
    
        int curmask=input[curidx];

        // whether the mask might be the digit segment
        if ((curmask&masks[i]) != curmask)return false;

        // make sure those marked as not working are
        // really not working
        if ((workingmask&curmask)!=curmask) return false;

        // update those not working
        int w = getworking(masks[i],curmask);

        workingmask &= w;
        curidx++;
    }
    return curidx==n;
}

bool find()
{
    int i,j;
    // find where the sequence starts
    for (i=9;i>=0;i--){
        if ((input[0] & masks[i])==input[0] &&
            is(getworking(masks[i],input[0]), 1,i-1)) return true;
    }
    return false;
}

int main()  
{
   while(1){
    scanf("%d",&n); if (!n)break;
    int i,j;
    for(i=0;i<n;i++){
        char s[90];scanf("%s",s);
        input[i]=tomask(s);
    }

        if (find())printf("MATCH\n");
        else printf("MISMATCH\n");
   }
}

