#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main (void)
{ 
setlocale(LC_ALL,"portuguese");
system("color 3");
  
  int valor = 18;
  

  int *ptr;
  
  
  ptr = &valor;
  
  printf("Valor e endere�o de memoria\n\n");
  printf ("valor da variavel valor: %d\n", valor);
  printf ("Endere�o da variavel valor: %x \n", &valor);
  
  
  getch();
  return(0);
}
