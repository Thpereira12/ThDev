#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
#include <conio.h>
int num, bin;
int main (void)

{

printf("Digite o numero pra ser convertido para binario:\n");
scanf("%d", &num);
while (num>0)

{ bin = num%2;
printf("%d", bin);
num = num/2;
}
getch();
}
