SWIG CMake
==========

> **DISCLAIMER**: This is an unofficial personal experiment.

I am using this for easier builds on Windows using Visual Studio 2010.
The problem with CMake is that it is rather ugly to use regarding tasks that are not just C/C++ builds.
Particularly, creating a configuration for the test-suite is not feasible.
Also there are limitations coming from IDEs: having a single target for each test-case blows up the project
beyond tolerability.

However, if you want to hack on a Swig Module in Visual Studio, feel free to use this configuration.


Prerequisites
-------------

Download the SWIG repository (into the root of swig-cmake):

	$ git clone -b <branch> https://github.com/swig/swig.git

Maybe you want to adapt the version in `CMakeLists.txt` according to your cloned branch. For instance:

	set(SWIG_VERSION 3.0.0)


Build
-----

Create a build directory

	$ mkdir build
	$ cd build

Create the build configurations

	$ cmake -G "Visual Studio 10" ..

If you want a debug version:

	$ cmake -DCMAKE_BUILD_TYPE=Debug

You can choose between different CMake generators. See the CMake help:

	$ cmake --help

E.g., a Unix Makefile configuration is created with:

	$ cmake -G "Unix Makefiles" ../..

or for Visual Studio 2010

	$ cmake -G "Visual Studio 2010" ../..

After configuration start the build (or open your IDE project file):

	$ cd build/Release
	$ make
