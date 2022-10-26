#include<stdio.h>
#include<stdlib.h>
#include<locale.h>

int main ()
{
	setlocale(LC_ALL,"Portuguese");
	printf("O teste é de acentuação \n\n");
	printf("texto com acentuação.\n");
	system("pause");
	return 0;
}
