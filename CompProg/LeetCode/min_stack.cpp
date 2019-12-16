/*
1-deque solution:
Save current min for every pushed elem.

2-deque solution:
Save min in a separate deque only when necessary.
May use less memory than 1-deque.
*/
#include <deque>
using namespace std;

class MinStack {
public:
    deque<int> stack;
    deque<int> mins;

    void push(int x) {
        int themin = mins.size() ? mins.back() : x;
        stack.push_back(x);
        if (x<=themin)
            mins.push_back(x);
    }

    void pop() {
        if (stack.back()==mins.back())
            mins.pop_back();
        stack.pop_back();
    }

    int top() {
        return stack.back();
    }

    int getMin() {
        return mins.back();
    }
};

class MinStack1 {
public:
    typedef pair<int,int> pairt;
    deque<pairt> stack;

    void push(int x) {
        if (stack.size())
            stack.push_back(make_pair(x, min(x,getMin()) ));
        else
            stack.push_back(make_pair(x, x));
    }

    void pop() {
        stack.pop_back();
    }

    int top() {
        return stack.back().first;
    }

    int getMin() {
        return stack.back().second;
    }
};

