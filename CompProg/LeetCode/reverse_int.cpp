class Solution {
public:
    int reverse(int x) {
        int n=0;
        int sign=x<0?-1:1;
        x=abs(x);
        while(x){
            int d=x%10;
            n=n*10+d;
            x/=10;
            
        }
        return n*sign;
    }
};