#include<iostream>
#include<cmath>
using namespace std;

class Solution {
public:
    // k is zero-based: invariant is k < m + n.
    // k is halved in at most 2 calls.
    // Thus, runtime is O(log(m+n)).
    int findkth(int k, int A[], int m, int B[], int n){
        if(m==0)return B[k];
        if(n==0)return A[k];
        if(k==0)return min(A[0],B[0]);
        int x=min(m,(k+1)/2);
        int y=min(n,(k+1)/2);
        if(A[x-1]<=B[y-1])
            // eliminate A[0..x-1]
            return findkth(k-x,A+x,m-x,B,n);
        // swap A and B to exploit symmetry.
        return findkth(k,B,n,A,m);
    }
    double findMedianSortedArrays(int A[], int m, int B[], int n) {
        // returns the average of the medians.
        // if m+n is odd, then both k's are the same.
        // else both k's differ by 1.
        return (findkth((m+n-1)/2, A,m,B,n) + findkth((m+n)/2,A,m,B,n))*.5;
    }
};
bool equal(double a, double b){
	return abs(a-b)<0.00001;
}

int main(){
	int A[]={0,1,2,3,4,5,1,2};
	int B[]={2,3,4,5,6,7,1,2};
    Solution s;
	cout<<(equal(s.findMedianSortedArrays(A,0,B,1),2))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,1,B,0),0))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,1,B,1),1))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,6,B,6),3.5))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,5,B,5),3))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,6,B,3),3))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,1,B,3),2.5))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,1,B,6),4))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A,6,B,1),2))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A+4,2,A+1,3),3))<<endl;
	cout<<(equal(s.findMedianSortedArrays(A+6,2,B+6,2),1.5))<<endl;
}
