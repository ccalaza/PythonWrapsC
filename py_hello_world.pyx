"""Cython interface between Python main script "run_code.py" and C functions in "cpp_hello_world.cpp" """

cimport numpy as np # Imports numpy as a cython module
import numpy as np  #and also as a Python module


cdef extern from "cpp_hello_world.h": #Imports the C functions from the header file as cython functions
    void hello_world()
    void array_factor_multiplication(double*, int, double, double*)

def cpp_hello_world(): # Defines the Python wrapper which calls the cython function, in this case with no arguments passed
    hello_world()

def cpp_array_factor_multiplication(np.ndarray[double, ndim=1, mode="c"] input not None, double factor): # This time passing a vector and a scalar as arguments
    length = input.shape[0] # Gives the cython function the length of the input vector
    cdef np.ndarray[double, ndim=1, mode="c"] output = np.empty(length, dtype=np.float64) # Initializes Python object to which to write the output
    array_factor_multiplication(&input[0], length, factor, &output[0]) # Calls cython function with C-style arguments after importing in the "cdef extern" block above
    return output
