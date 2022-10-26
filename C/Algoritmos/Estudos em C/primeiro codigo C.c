#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main ()
{ 
setlocale(LC_ALL,"portuguese");
system("color 1E");
int n1 = 5000;
int n2 = 2;
float result;

result = (float) n1/n2;
printf("resultado de R$= %.2f\n",result);

return 0;
}

