class Solution {
public:
    double pow(double x, int n) {
        if(n==-1)return 1/x;
        if(n==0)return 1;
        if(n==1)return x;
        double d=pow(x,n/2);
        if(n%2)return d*pow(x,n-n/2);
        return d*d;
    }
};