#include <iostream>

int main(int ac, char **av)
{
	std::cout << "Hello World !" << std::endl;
	for (unsigned int i = 0; i <= 1024; ++i)
		std::cout << i << (i == 1024 ? "\n" : ", ");
	return (0);
}
