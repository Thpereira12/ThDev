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
  	 printf("Voc� � maior de idade!\n ");
  	 printf("Parab�ns!\n");
  }
  else
  {
  	printf("Ent�o voc� � menor de idade!\n");
  }


  system("pause");	
  return 0;	
}




