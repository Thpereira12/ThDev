#include <stdio.h>
#include<stdlib.h>
#include<locale.h>

int main(){
	setlocale(LC_ALL,"PORTUGUESE");
	int idade;
	
	printf(" qual sua idade? ");
	scanf("%d",&idade);
	if (idade >= 18)
  {
  	 printf("Você é maior de idade!\n ");
  	 printf("Parabéns!\n");
  }
  else
  {
  	printf("Então você é menor de idade!\n");
  }


  system("pause");	
  return 0;	
}




