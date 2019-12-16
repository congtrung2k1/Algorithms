/**
 * Maintain an array of books and a map from title to book index.
 * Change the status of the books as you go along.
 */
#include<iostream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<map>
using namespace std;

// 0: in lib, 1: borrowed, 2: returned
struct book{string title,author; char status;};
map<string,int> m;
book books[99999];

int comp(const void*a, const void*b){
    book&b1 = *(book*)a;
    book&b2 = *(book*)b;
    int k= strcasecmp(b1.author.c_str(),b2.author.c_str());
    if(k!=0)return k;
    return strcasecmp(b1.title.c_str(),b2.title.c_str());
}

int main(){
    char line[999];
    int nbooks=0;
    int i,j;
    while(1){
        cin.getline(line,sizeof line);
        if(strcasecmp(line,"END")==0)break;
        string &title=books[nbooks].title;
        for(i=0;line[i]!='"';i++);
        for(i++;line[i]!='"';i++)
            title.append(1,line[i]);
        string &author=books[nbooks].author;
        for(;line[i]!='y';i++);
        for(i+=2;line[i];i++)
            author.append(1,line[i]);
        nbooks++;
    }
    qsort(books,nbooks,sizeof books[0],comp);
    for(i=0;i<nbooks;i++)
        m[books[i].title]=i;
    string s,title;
    while(1){
        cin>>s;
        bool borrow=s=="BORROW";
        if(borrow||s=="RETURN"){
            cin.getline(line,sizeof line);
            title.clear();
            for(i=0;line[i]!='"';i++);
            for(i++;line[i]!='"';i++)
                title.append(1,line[i]);
            int idx = (m.find(title)->second);
            books[idx].status=borrow?1:2;

        }
        else if(s=="SHELVE"){
            int last=-1;
            for(i=0;i<nbooks;i++){
                book &b=books[i];
                if(b.status==2){
                    if(last>=0){
                        cout<<"Put \""<<b.title<<"\" after \""<<books[last].title<<"\""<<endl;
                    }else
                        cout<<"Put \""<<b.title<<"\" first"<<endl;
                    b.status=0;
                }
                if(b.status!=1)
                    last=i;
            }
            cout<<"END"<<endl;
        }else break;
    }
}
