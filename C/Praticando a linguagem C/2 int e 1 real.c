#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main (void)
{ 
setlocale(LC_ALL,"portuguese");
system("color 3");

   {
int a, b;
    float c, result;
    
	printf("a: ");
    scanf("%d", &a);
    printf("b: ");
    scanf("%d", &b);
    printf("c: ");
    scanf("%f", &c);
    
	result = a + b + c;
   
    printf("o resultado  = %f\n", result);
printf("os valores somados são tres valores que são fornecidos pelo usuario via teclado a soma de dois valores inteiros e um real \n ");
printf("esse foi um codigo em C");
return 0;
}
}


