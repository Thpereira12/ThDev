#include<stdio.h>
#include<stdlib.h>
#include<locale.h>

int main ()
{
	setlocale(LC_ALL,"Portuguese");
	printf("O teste � de acentua��o \n\n");
	printf("texto com acentua��o.\n");
	system("pause");
	return 0;
}
