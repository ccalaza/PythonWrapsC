PyLIBS = $(shell python-config --includes)	# Tells the compiler where to look for Python and required libraries
CXX = g++	# Tells makefile which compiler to use to generate the .o and .so files
CXXFLAGS = -std=c++11 -O2 -fPIC -Wall	# Flags which are passed to CXX at compilation time

# Compile the two generated .o files into one .so shared object which we can import in our main Python code
hello_world.so: cpp_hello_world.o py_hello_world.o
	$(CXX) -shared cpp_hello_world.o py_hello_world.o -o py_hello_world.so

# Compile our cython_wrapper.pyx to cython_wrapper.cpp
py_hello_world.cpp: py_hello_world.pyx
	cython py_hello_world.pyx --cplus

# Compile cython_wrapper.cpp to .o object
py_hello_world.o: py_hello_world.cpp
	$(CXX) $(CXXFLAGS) $(PyLIBS) -c py_hello_world.cpp

# Compile user-written .cpp file containing the called C function to .o object
cpp_hello_world.o: cpp_hello_world.cpp
	$(CXX) $(CXXFLAGS) $(PyLIBS) -c cpp_hello_world.cpp



# Same as "make" would run the makefile, "make clean" removes generated files to start from scratch if something failed when compiling
.PHONY: clean 
clean: 		
	-rm -f *.o *.so *~ .*.cache py_hello_world.cpp
