#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    string simplifyPath(string path) {
        int i,j,prev=0;
        vector<string> v;
        for(i=1;i<=path.size();i++){
            char c = i==path.size()?'/':path[i];
            if(c!='/')continue;
            string s=path.substr(prev+1, i-prev-1);
            prev=i;
            if(s==""||s==".")continue;
            if(s==".."){
                if(v.size())v.pop_back();
            }
            else
                v.emplace_back(s);
        }
        if(!v.size()){
            path.resize(1);
            return path;
        }
        path.clear();
        for(i=0;i<v.size();i++){
            path.append(1,'/');
            path.append(v[i]);
        }
        return path;
    }
};

int main(){
    Solution s;
    cout<<(s.simplifyPath("/")=="/")<<endl;
    cout<<(s.simplifyPath("/a")=="/a")<<endl;
    cout<<(s.simplifyPath("/a/")=="/a")<<endl;
    cout<<(s.simplifyPath("/abc")=="/abc")<<endl;
    cout<<(s.simplifyPath("/a/./")=="/a")<<endl;
    cout<<(s.simplifyPath("/a/./b/")=="/a/b")<<endl;
    cout<<(s.simplifyPath("/a/./..")=="/")<<endl;
    cout<<(s.simplifyPath("/a/./../..")=="/")<<endl;
    cout<<(s.simplifyPath("/a/.//..////..")=="/")<<endl;
    cout<<(s.simplifyPath("/../")=="/")<<endl;
    cout<<(s.simplifyPath("/.")=="/")<<endl;
}
