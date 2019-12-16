/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation

 */

#include <string>
#include<vector>
using namespace std;
class NestedInteger {
  public:
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    bool isInteger() const;

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    int getInteger() const;

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    const vector<NestedInteger> &getList() const;
};

typedef vector<NestedInteger>  ints;
class NestedIterator {
public:
    vector<ints::const_iterator> stack;
    vector<ints::const_iterator> stackIter;
    bool hasNext2;
    int nextN;

    NestedIterator(vector<NestedInteger> &nestedList) {
        stack.push_back(nestedList.cend());
        stackIter.push_back(nestedList.cbegin());
        hasNext2=false;
        getNext();
    }

    int next(){
        int oldNext = nextN;
        hasNext2 = false;
        getNext();
        return oldNext;
    }

    void getNext() {
        while(stackIter.size()){
            ints::const_iterator & iter = stackIter.back();
            if(iter ==  stack.back()){
                stack.pop_back();
                stackIter.pop_back();
                continue;
            }

            const NestedInteger & last = *iter;
            iter++;
            if (!last.isInteger()){
                stack.push_back(last.getList().cend());
                stackIter.push_back(last.getList().cbegin());
            }
            else{
                nextN = last.getInteger();
                hasNext2 = true;
                break;
            }
        }
    }

    bool hasNext() {
        return hasNext2;
    }
};

/**
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i(nestedList);
 * while (i.hasNext()) cout << i.next();
 */
