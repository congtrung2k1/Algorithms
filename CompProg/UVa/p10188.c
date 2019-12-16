#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char cor[200000];
char tochk[200000];
char corN[200000];
char tochkN[200000];

int corLen, tochkLen, corNLen, tochkNLen;

void read(char *buf, int lines, int* len, char*buf2, int*len2){
	int i,j,k;
	for (i=0;i<lines;i++){
		gets(&buf[*len]);
		int l = strlen(&buf[*len]);
		buf[*len+l]='\n';
		*len +=1+ l;
		
	}
	for (i=0;i< *len;i++){
		char c=buf[i];
		if ('0' <=c && c <= '9'){ buf2[*len2]=c; *len2 += 1;}
	}
}
int nu=0;
void p(const char*c)
{
	nu++;
printf("Run #%d: %s\n",nu,c);
}
void trim(char *s){
	int l =strlen(s);
	if(l==0)return;
	if (s[l-1] == '\n') s[l-1]=0;
}
int main (){

	while (1){
		int corLines;char s[9000];
	if (!	gets(s))break; trim(s);corLines = atoi(s);
	
	if (!corLines) break;
		int i,j,k;
		corLen=0; corNLen=0;
		read(cor,corLines,&corLen,corN, &corNLen);
		int tochkLines;
		gets(s);trim(s);tochkLines=atoi(s);tochkLen=tochkNLen=0;
		read(tochk,tochkLines,&tochkLen,tochkN, &tochkNLen);
		if (tochkNLen != corNLen ){ p("Wrong Answer"); continue; }
		for (i=0;i<corNLen;i++){
			if (corN[i] != tochkN[i]){p("Wrong Answer");corNLen--;
			break;}
		} 
		if (tochkNLen != corNLen){ continue; }
		if (tochkLen != corLen){ p("Presentation Error"); continue; }
		for (i=0;i <tochkLen;i++){
			if (cor[i] !=tochk[i]){p("Presentation Error");
			i=-1; break;}
		}
		if (i<0){continue;  }
		p("Accepted");
	}return 0;
}
