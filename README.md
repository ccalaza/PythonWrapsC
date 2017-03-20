# PythonWrapsC: Wrapping C/C++ functions in Python using cython 


(Warning: this example was tested in Linux systems and requires GCC or at least 
g++ to be installed in your machine. Modifications to the "CXX" variable in the 
Makefile to make it point to a different compiler might make it Windows-compatible).

In this commented example we illustrate how to import a function written in C/C++ in a Python
script, how to pass input arguments to it and have the output returned to your Python 
code. 

This can be helpful if you have a long C function which you want to use in your
Python app, but you don't want to invest the time and pain translating it and
testing that everything has been ported right.

Another scenario in which this method would be useful is if you are targetting to
increase the performance of your Python code. Sure, you can write 
your hotspot function in cython, compile it to C and this would probably already 
speed up your code a bit. But if you really want to get C performance, writing your 
own C function and compiling it as detailed in this tutorial is the way to go.

### The dummy examples provided in this tutorial have been built as follows:

1. The C/C++ functions were defined in "cpp_hello_world.cpp";
2. a header file "cpp_hello_world.h" for the .cpp file was created (optional but recommended);
3. a cython script "py_hello_world.pyx" was written to link the .py and .h files;
4. the Python main code "run_code.py" calling the cython-wrapped C function was created;
5. "Makefile" was created to compile...:
    1. ... "py_hello_world.pyx" to "py_hello_world.cpp",
    2. ... "py_hello_world.cpp" to "py_hello_world.o" (object file),
    3. ... "cpp_hello_world.cpp" to "cpp_hello_world.o"
    4. ... and "py_hello_world.o" and "cpp_hello_world.o" to "py_hello_world.so" (shared object to be imported from Python's side).
           

### And should be compiled as follows:

1. Open a terminal and go to the directory containing these files,
2. run "make" command to execute "Makefile",


### Testing the compilation:

Check that the above described .o (x2) and .so (x1) files have been generated
in the current directory. If it worked you are ready to run run_code.py with "python run_code.py". The 
output should now show: 

"""
hello world

[ 33.  66.  99.]
"""

If something went wrong you can run the "make clean" command to remove the unwanted output and try 
again with different compiler flags.
