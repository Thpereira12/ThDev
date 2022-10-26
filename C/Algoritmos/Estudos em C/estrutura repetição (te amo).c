#include <stdio.h>
#include<stdlib.h>
#include<locale.h>

int main () {
	setlocale(LC_ALL,"PORTUGUESE");
	int cont;
	char nome[30];
	
	system("color E");
	
	printf(" ATENÇÃO!\n");
	printf(" digite o seu nome\n");
	scanf("%s",&nome);
	getchar();
	
	while(cont <= 4){
		
		printf(" %s EU TE AMO!\n",nome);
		cont++;
		sleep (1);
	}
	printf("\n\n");
	printf("TINHAMUUU\n");
	printf("\n\n");
	
	
	
	
	
	
	
	system("pause");
	return 0;
}
