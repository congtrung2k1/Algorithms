/**
Algorithm:
Straightforward

*/
#include<map>
#include<string>
#include<vector>
#include<string.h>
#include<stdio.h>
using namespace std;
vector<string> words;
map<string, bool> nouns;
map<string,bool>verbs;

inline bool isart(string&str){ return str =="a" 
|| str == "the";}

inline bool isverb(string&str){
    return verbs[str];
}
inline bool isnoun(string&str){
    return nouns[str];
}

inline bool isactor(int s, int e){
    if (e==s && isnoun(words[s])){
        return true;
    }
    if (e==s+1 && isnoun(words[e]) && isart(words[s])) return true;
    return false;
}

bool islist(int s, int e){
    if (isactor(s,e)) return true;
    int i,j;
    for (i=s; i<=e;i++){
        if (words[i] == "and" && 
            islist(s,i-1) && isactor(i+1,e))return true;
    }return false;
}

bool isact(int s, int e, vector<string>&words)
{
    int i,j;
    for (i=s; i <=e;i++){
        if (isverb( words[i] ) &&
            islist( s,i-1 ) && 
            islist(i+1,e)) return true;
    }
    return false;
}

bool isst(int s , int e , vector<string>& words){
    if (isact(s,e,words)) return true;
    int i,j;
    for (i=s; i <= e; i++){
        if ( words[i] == ",") {
            if (isst( s, i-1, words) && isact(i+1,e,words))return true;
        }
    } return false;
}

char in[9999999];
char in2[9999999];
#define m(s)  nouns.insert(std::make_pair(s,true));
#define q(s)  verbs.insert(std::make_pair(s,true));
int main(){
 m("tom"); m("jerry"); m("goofy");m("mickey");m("jimmy");
 m("dog"); m("cat"); m("mouse");
 q("hate"); q("love");q("like");q("know");
 q("hates"); q("loves");q("likes");q("knows");
    while (88){
        if (! gets(in)) break;
        int i,j; int p =0;
        for (i=0; in[i];i++){
            char c=  in[i];
            if (c==',' ){ // make sure there are spaces around a comma
                in2[p++] = ' ';
                in2[p++]=',';
                in2[p++] = ' ';
            }
            else in2[p++] = c;
        }words.clear();
        in2[p]=0;
        char * tok = strtok( in2, " ");
        while (tok){
            words.push_back (string(tok));
            tok = strtok(NULL , " ");
        }
        if (isst ( 0, words.size()-1, words)) printf("YES I WILL\n");
        else printf("NO I WON'T\n");
    }
}

