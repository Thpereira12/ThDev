#include<stdio.h>
#include<conio.h>
int main ()
{

	int x= 25, y=5,z;
	for(z=0;x>=y;x=x-y,z++);
	printf("x=%d,y=%d,z=%d\n",x,y,z);
	return 0
}
