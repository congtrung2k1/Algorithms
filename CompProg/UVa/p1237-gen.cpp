#include<iostream>
#include<cstdlib>
using namespace std;
int main(){
    cout << 1 << endl << 10000 << endl;
    for(int i=0;i<10000;i++)
        cout << "name" << i << " " << i*2 << ' ' << i*2+1 << endl;
    cout << 1000 << endl;
    for (int i=0;i<1000;i++)
        cout << i*2 << endl;
}
