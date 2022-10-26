#include <stdio.h>
#include<stdlib.h>
#include<locale.h>

int main () {
	setlocale(LC_ALL,"PORTUGUESE");
	float n1,n2,media;
	
	printf(" digite a primeira nota:  ");
	scanf("%f",&n1);
	printf(" digite a segunda nota:  ");
	scanf("%f",&n2);
	
	media=(n1+n2)/2,0;
	printf("media= %.2f\n",media);
	
	if(media >= 6,0){ //sem virgiula aqui
		printf(" aprovado \n");
	}
	else{ //sem virgiula aqui tbm
		printf(" reprovado \n");
	}
	system("pause");
	return 0;
}
