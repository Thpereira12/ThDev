#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main ()
{ 
setlocale(LC_ALL,"portuguese");
system("color 1");

float num, dec, hexa, octa;

num=82;

dec=(num);

hexa=(num/16) /16;

octa=(num/8) /8 /8;


printf("O valor decimal �: %f \n",dec);

printf("O valor hexadecimal �:\nx = %f \n",hexa);

printf("O valor octal �:\nx = %f",octa);

return 0;
}

