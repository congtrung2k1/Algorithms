#include<stdio.h>
#include<string.h>
#include <stdlib.h>

char frag[400][600];
int nfrags;
int len[400];
char used[400];
int perlen;

int start(char *s1, char*s2){
	int i=0;
	while (s1[i]==s2[i]){
		i++;
	}
	return s2[i]==0;
}
int end(char *s1, char*s2, int k,int l){
	int i=0;
	while (s1[k]==s2[l]&&k>=0&&l>=0){
		k--;l--;
	}
	return l<0;
}

int search(char*s){
	int doit=0;
	int i,j;
	for(i=1;i<nfrags;i++){
		if (used[i]) continue;
	doit=1;	
		if (strncmp(&frag[i][0],s,len[i])==0) {
		used[i]=1;
		for(j=1;j<nfrags;j++){
			if (used[j]||len[j]+len[i]!=perlen) continue;
			if (strncmp(&frag[j][0],&s[len[i]],len[j])!=0)continue;
			used[j]=1;
			if (search(s)) return 1;
			used[j]=0;
		}
		used[i]=0;
		}
		
		else if (strncmp(&frag[i][0],&s[perlen-len[i]],len[i])==0) {
		used[i]=1;
		for(j=1;j<nfrags;j++){
			if (used[j]||len[j]+len[i]!=perlen) continue;
			if (strncmp(&frag[j][0],&s[0],len[j])!=0)continue;
			used[j]=1;
			if (search(s)) return 1;
			used[j]=0;
		}
		used[i]=0;
		}
	}
	
	if (!doit){ printf("%s\n",s); return 1; }

	return 0;
}

int main(){
	int nu;char s[1000];
	gets(s); nu=atoi(s); 
	gets(s); int hh=0;
	while(nu--){ 
		if (hh) printf("\n"); hh=1;
		int i,j,k, tlen=0;
		for (i=0;;i++){
			if (!gets(&frag[i][0]))break;
			if (frag[i][0]==0)break;
			len[i] = strlen(&frag[i][0]);
			tlen+=len[i];
		}
		nfrags=i;
		 perlen = (tlen)/(nfrags/2);
		memset(used,0,sizeof(used));
			
			s[0]=0; strcpy(s,&frag[0][0]);
			used[0]=1;
			for(j=1;j<nfrags;j++){
				if(len[0]+len[j]!=perlen) continue;

				strcpy(&s[len[0]],&frag[j][0]);
				used[j]=1;
				if(search(s)){perlen=0;break;}
				used[j]=0;
			}
			if (!perlen)continue;
			s[0]=0; memcpy(&s[perlen-len[0]],&frag[0][0],len[0]);
			used[0]=1;
			for(j=1;j<nfrags;j++){
				if(len[0]+len[j]!=perlen) continue;

				memcpy(&s[0],&frag[j][0],len[j]);
				used[j]=1;
				if(search(s)){perlen=0;break;}
				used[j]=0;
			}
		
	}return 0;
}
