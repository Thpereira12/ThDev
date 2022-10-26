#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main (void)
{ 
setlocale(LC_ALL,"portuguese");
system("color 3");

   {
    float a, b, result;
    
	printf("a: ");
    scanf("%f", &a);
    printf("b: ");
    scanf("%f", &b);
    
	result = b / a;
   
    printf("o resultado da divisão é  = %f\n", result);

return 0;
}
}
