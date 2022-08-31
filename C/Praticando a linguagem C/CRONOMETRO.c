#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

int main (void)
{
	int segundo = 0, minuto = 0, hora = 0;

	while (1 == 1) {
	
	Sleep (500);
	segundo++;
	system("cls");
	
	if (segundo > 59) {
	minuto++;
	segundo = 0;
}
    if (minuto > 59) {
	hora++;
	minuto = 0;
}
    if (hora > 23) {
	hora = 0;
}
    printf("%d: %d: %d", hora, minuto, segundo);
}
	return 0; 
}

