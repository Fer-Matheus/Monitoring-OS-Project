#include <iostream>

int fibonacci(int number){
	if (number == 1 || number == 0) return 1;
	return fibonacci(number-1)+fibonacci(number-2);
}

int main(){
	int number;
	std::cin>>number;
	for (int i = 0; i <= number; i++){
		if (i == number){
			std::cout<<fibonacci(i)<<std::endl;
			continue;
		}
		std::cout<<fibonacci(i)<<" ";	
	}
	return 0;
}
