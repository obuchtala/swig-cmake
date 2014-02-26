SWIG CMake
==========

This project intends to provide a basis for a CMake configured build for SWIG.
The original source tree is not touched.

Prerequisites
-------------

Download the SWIG repository:

	$ git clone -b <branch> https://github.com/swig/swig.git

Adapt the version in `CMakeLists.txt`.

	set(SWIG_VERSION 3.0.0-beta1)

Build
-----

Create a build directory for Debug and Release

	$ mkdir build
	$ cd build
	$ mkdir Debug
	$ mkdir Release

Create the build configurations

	$ cd Debug
	$ cmake -DCMAKE_BUILD_TYPE=Debug ../..
	$ cd ../Release
	$ cmake ../..

You can choose different CMake generators.

	$ cmake --help

E.g., a Unix Makefile configuration is created with:

	$ cmake -G "Unix Makefiles" ../..

or for Visual Studio 2010

	$ cmake -G "Visual Studio 2010" ../..

After configuration start the build:

	$ cd build/Release
	$ make

Installation under posix-like systems (Linux, MacOSX):

	$ make install
