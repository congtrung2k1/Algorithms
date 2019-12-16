/**
 * It is a DP problem, and from the DP recursion you can see that the solution
 * is Fibonacci. Simply apply the Fib formula.
 */
#include<cmath>
using namespace std;
class Solution {
public:
    int climbStairs(int n) {
        double sqr5=sqrt(5), p1=(1+sqr5)/2, p2=1-p1;
        return (int)(.5+(pow(p1,n+1)-pow(p2,n+1))/sqr5);
    }
};
