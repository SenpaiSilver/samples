#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int main(int ac, char **av)
{
	unsigned int i;

	for (i = 0; i <= 1024; ++i)
		printf("%d%s", i, (i == 1024 ? "\n" : ", "));
	return (EXIT_SUCCESS);
}
