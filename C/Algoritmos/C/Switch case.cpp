#include <stdio.h>
#include<stdlib.h>
#include<locale.h>

int main () {
	setlocale(LC_ALL,"PORTUGUESE");
	int sim,nao,resp;
	
	printf(" quer mais uma tabuada [1]SIM [2]NÃO  ");
	scanf("%d",&resp);
	
	switch (resp)
	{
		case 1 :
				printf("Ok me diga o valor\n");
				break;
		case 2 :
				printf("Obrigado !\n");
				break;		
    }
  return 0;  
}
