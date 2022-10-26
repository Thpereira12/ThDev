#include <stdio.h>
#include<stdlib.h>
#include<locale.h>

int main(){
	setlocale(LC_ALL,"PORTUGUESE");
	system("color E");
	
	int tab,num;
	num = 1;
	
	printf(" Qual tabuada você quer aprender ?");
	scanf("%d,",&tab);
	
	printf("--------------------------------\n");
	printf("*** TABUADA DO %d ***\n ",tab);
	printf("--------------------------------\n");
	
	while (num <=10){
		printf("%d x %2d = %2d\n",tab,num,tab*num);
		num++;
		sleep(1);
		
		
	}
	printf("--------------------------------\n");
	
	
	
	
	
	
	
	
	system("PAUSE");
	return 0;
}




