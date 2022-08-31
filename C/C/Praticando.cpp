#include <stdio.h>
#include<stdlib.h>
#include<locale.h>
#include <windows.h> // para usar Sleep


int main(){
	setlocale(LC_ALL,"PORTUGUESE");
	system("color E");
	
	int tab,num,sim,nao,resp;
	num = 1;
	
	printf(" Qual tabuada você quer aprender ?");
	scanf("%d,",&tab);
	
	printf("--------------------------------\n");
	printf("*** TABUADA DO %d ***\n ",tab);
	printf("--------------------------------\n");
	
	while (num <=10){
		printf("%d x %2d = %2d\n",tab,num,tab*num);
		num++;
		Sleep(600);	
		
	}
	printf("--------------------------------\n");
	
	printf(" ");
	
		printf(" quer mais uma tabuada [1]SIM [2]NÃO  ");
	scanf("%d",&resp);
	
	
				printf(" Qual tabuada você quer aprender ?");
	scanf("%d,",&tab);
	
	printf("--------------------------------\n");
	printf("*** TABUADA DO %d ***\n ",tab);
	printf("--------------------------------\n");
	
	 while (num <=10){
		printf("%d x %2d = %2d\n",tab,num,tab*num);
		num++;
		Sleep(600);	
	
	}

	
	system("PAUSE");
	return 0;
}




