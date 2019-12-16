#include <cstdlib>
#include <iostream>
#include "HASH.h"
using namespace std;

int main(int argc, char *argv[])
{
	int op, k, M, n, list;
	while(printf("�п�J��Ӿ�� : "), scanf("%d %d", &k, &M) == 2) {
		printf("���U�ӷ|��%d���ާ@ Hash[%d]\n", k, M);
		HASH use;
		use.IniHash(M);
		while(k--) {
			puts("(1)Insert (2)Delete (3)PrintList (4)PrintAll :"), scanf("%d", &op);
			switch(op) {
				case 1:scanf("%d", &n);
						if(use.InsHash(n))
							puts("Access");
						else
							puts("Fail");
						break;
				case 2:scanf("%d", &n);
						if(use.DelHash(n))
							puts("Access");
						else
							puts("Fail");
						break;
				case 4:scanf("%d", &list);
						use.PrintHashList(list); 
						break;
				case 3:use.PrintHash();
						break;
			}
		}
	}
    system("PAUSE");
    return EXIT_SUCCESS;
}
