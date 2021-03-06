all: KinectVideoHandler

CFLAGS=-fPIC -g -Wall `pkg-config --cflags opencv`
LIBS = `pkg-config --libs opencv`
INCLUDE = -I/usr/local/include/libfreenect -I/Applications/MATLAB/MATLAB_Compiler_Runtime/v81/extern/include
FREE_LIBS = -L/usr/local/lib -lfreenect -L/Applications/MATLAB/MATLAB_Compiler_Runtime/v81/runtime/maci64 -L/Users/giu/Documents/GRobot/Code/video/lib -lmwmclmcrrt -lmwmclmcrrt.8.1 -lsegmentImage
CXX = c++

KinectVideoHandler:  KinectVideoHandler.cpp
	$(CXX) $(INCLUDE) $(CFLAGS) $? -o $@  $(LIBS) $(FREE_LIBS)

%.o: %.cpp
	$(CXX) -c $(CFLAGS) $< -o $@

clean:
	rm -rf *.o KinectVideoHandler

install: 
	cp ./lib/libsegmentImage.dylib /usr/lib
	cp /Applications/MATLAB/MATLAB_Compiler_Runtime/v81/runtime/maci64/libmwmclmcrrt.8.1.dylib /usr/lib
	cp /Applications/MATLAB/MATLAB_Compiler_Runtime/v81/runtime/maci64/libmwmclmcrrt.dylib /usr/lib
