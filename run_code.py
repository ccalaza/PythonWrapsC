'''
Python script calling the C/C++ functions defined in cpp_hello_world.cpp

'''

import py_hello_world as hw              # This file is compiled as a shared object (.so) in Makefile in order to be imported similarly to a Python module
import numpy as np

hw.cpp_hello_world()                                    # Functions defined in the .so file generated from the cython and C code can be called as Python functions...

a = np.array([10,20,30], dtype="float64")               
result = hw.cpp_array_factor_multiplication(a, 3.3)     # ...and we can also pass arguments to them

print result                                            
