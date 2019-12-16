#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <iostream>
using namespace std;

class node
{
	public:
		int x;
		int y;
 		node *next;

};

class Stack {
      node *top;
public:
      Stack();
      void push(int x, int y);
      node *pop();
      void walk(int maze[][10], int x, int y);
};

Stack::Stack(){
    //cout << "Constructor\n";
    top=NULL;
}

//���|��ƪ��s�J
void Stack::push(int x, int y)
{
	node *new_node;

	new_node = new node;
    if( new_node == NULL){ //�P�_�t�m�O�_���\
		cout << "�O����t�m����!\n";
		exit(-1);
	}
	new_node->x = x;
	new_node->y = y;
	new_node->next = top;
	top = new_node;
}

// ���|��ƪ����X
node *Stack::pop()
{
	node *temp;
	node *ptr;

	if( top != NULL ) //�P�_���|�O�_���Ū�
	{
       //��stop, temp, stack����
       ptr = top;
       top = top->next;
       temp = ptr;
       free(ptr);
       return temp;
	}
	else
		return NULL;
}

void Stack::walk(int maze[][10], int x, int y)
{
		while( x!=8 || y!=5 ) // �O�_���X�f
	{
        cout << x << " " << y << endl;
 		maze[y][x] = 2; // �Хܬ����L����
		if( maze[y-1][x] == 0 ) // ���W�訫
		{
			y--;
			push(x, y);
			cout << "���W after insert: x=" << x << ", y=" << y << endl;
		}
		else if( maze[y+1][x] == 0 ) // ���U�訫
		{
			y++;
			push(x, y);
			cout << "���U after insert: x=" << x << ", y=" << y << endl;
		}
		else if( maze[y][x-1] == 0 ) // �����訫
		{
			x--;
			push(x, y);
			cout << "���� after insert: x=" << x << ", y=" << y << endl;
		}
		else if( maze[y][x+1] == 0 ) // ���k�訫
		{
			x++;
			push(x, y);
			cout << "���k after insert: x=" << x << ", y=" << y << endl;
		}
		else // �L���i�� => �^��
		{
            cout << "�L���i�� ready for pop()\n";
			maze[y][x] = 3;
			pop(); // �h�^�@�B
			if(top==NULL) break;
            x = top->x;
			y = top->y;
            cout << "after pop: top->x=" << top->x << ", top->y=" << top->y << endl;
		}
	}
	maze[y][x] = 2; // �Х̫ܳ�@�I
}

// �D�{��
int main()
{
	// �ŧi
	int i, j;
	Stack s;

/*
	int maze[7][7];
    int n=0; int m=0;
  	freopen("maze.in.txt", "r", stdin);
    //freopen("maze.out.txt", "w", stdout);
    string line;

	while(getline(cin, line)) {
        stringstream sin(line);
        m = 0;
        while(sin >> maze[n][m])
            m++;
        n++;
    }
*/
	// ��J
	int maze[7][10] = // x=10, y=7
	{
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 1, 0, 1, 0, 0, 0, 0, 1,
		1, 0, 1, 0, 1, 0, 1, 1, 0, 1,
		1, 0, 1, 0, 1, 1, 1, 0, 0, 1,
		1, 0, 1, 0, 0, 0, 0, 0, 1, 1,
		1, 0, 0, 0, 1, 1, 1, 0, 0, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	};


	// �p��q1,1����8,5
	s.walk(maze, 1, 1);
   //0�i��, 1���ਫ, 3����, 2���T���|

	// ��X
	cout<<"�g�c���|��:\n";
	for(i=0; i<7; i++)
	{
		for(j=0; j<7; j++)
			cout << maze[i][j] << " ";
		cout << endl;
	}

	// ����
   system("pause");
	return 0;
}
