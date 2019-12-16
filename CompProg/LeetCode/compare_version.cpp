/**
 * Compare component by component until there is a difference.
 * For the shorter version string, missing components are treated as 0.
 */
#include<cstdlib>
#include<string>
using namespace std;
class Solution {
public:
   int compareVersion(string version1, string version2) {
        // Assumes pointers are >= 2.
        const char *p1 = version1.c_str()-1;
        const char *p2 = version2.c_str()-1;
        while(p1||p2){
            int v1 = 0, v2 =0;
            if (p1){
                v1=atoi(p1+1);
                p1 = strchr(p1+1, '.');
            }
            if (p2){
                v2=atoi(p2+1);
                p2 = strchr(p2+1, '.');
            }
            if (v1<v2) return -1;
            if (v2<v1) return 1;
        }
        return 0;
    }
};
