/* The C functions to be called from run_code.py are defined here */ 

#include <iostream>
#include "cpp_hello_world.h"	/* Creating a header file is optional, but recommended */

void hello_world(){		/* "hello world" is printed from the C function to the Python console */
    std::cout << std::endl << "hello world" << std::endl << std::endl;          
} 

void array_factor_multiplication(double * in, int length, double factor, double * out) {
	for (int i = 0; i < length; ++i) {
		out[i] = in[i] * factor;
	}
}
