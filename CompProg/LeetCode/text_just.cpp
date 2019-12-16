#include<vector>
#include<iostream>
#include<string>
using namespace std;

class Solution {
public:
    vector<string> fullJustify(vector<string> &words, int L) {
        int i,j,k;
        vector<string> ans;
        const int n=words.size();
        for(i=0;i<n;){
            int sum=0,nwords=0;
            for(j=i;j<n;j++){
                const string&s=words[j];
                k=s.size()+1;
                if(sum+k>L+1)
                    break;
                sum+=k;
                nwords++;
            }
            int extra=L-sum+nwords, limit=extra%(nwords>1?nwords-1:1);
            string line;
            bool lastline=j==n;
            for(k=0;i<j;i++,k++){
                const string&s=words[i];
                line.append(s);
                if (lastline){
                    if(i<j-1)
                        line.append(1, ' ');
                    else
                        line.append(L-line.size(), ' ');
                }
                else if(nwords==1)
                    line.append(extra,' ');
                else if(i<j-1)
                    line.append((extra)/(nwords-1)+(k<limit),' ');
            }
            ans.push_back(line);
        }
        return ans;
    }
};


int main(){
    vector<string> words={"This", "is", "an", "example", "of", "text", "justification.", "So", "yeah!"};
    Solution s;
    int i,j,k;
    vector<string> lines=s.fullJustify(words,16);
    for(i=0;i<lines.size();i++)
        cout<<lines[i]<<"|"<<endl;
}
