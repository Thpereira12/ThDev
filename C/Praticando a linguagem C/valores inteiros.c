#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main (void)
{ 
setlocale(LC_ALL,"portuguese");
system("color 5");

float x, y, result;

x=0;
y=10;
result = (x=4*y);


printf("“O valor de x é:\nx = %f \n",result);

printf("“O valor de y é:\nx = %f",y);



return 0;
}

