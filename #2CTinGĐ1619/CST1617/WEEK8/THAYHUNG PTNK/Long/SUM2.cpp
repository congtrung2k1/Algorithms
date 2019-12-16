#include <iostream>
#include <queue>

#define maxn 100003
using namespace std;

int n, a, l, r, sum, res;
queue<int> q;

int main()
{
 	ios::sync_with_stdio(false);

 	cin >> n >> l >> r;

 	for(int i = 1; i <= n; i++)
 	{
 		cin >> a;

 		while(q.size() >= r)
 		{
 			sum -= q.front();
 			q.pop();
 		}

 		q.push(a);
 		sum += a;

 		if(q.size() >= l && q.size() <= r) res = max(res, sum);

 		while(!q.empty() && q.size() >= l && (sum < 0 || q.front() < 0))
 		{
 			sum -= q.front();
 			q.pop();
 		}
 	}

 	cout << res;


	return 0;
}