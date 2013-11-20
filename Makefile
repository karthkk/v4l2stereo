APP=v4l2stereo
VERSION=0.1
RELEASE=1
ARCH_TYPE=`uname -m`
PREFIX?=/usr/local

all:
	g++ -std=c++11 -O3 -o ${APP} src/*.cpp src/calibration/*.cpp src/elas/*.cpp -Isrc -I/usr/include/opencv -L/usr/lib `pkg-config opencv --cflags --libs` -msse3 -Wall -pedantic -fopenmp

gstreamer:
	g++ -std=c++11 -O3 -o ${APP} src/*.cpp src/calibration/*.cpp src/elas/*.cpp -Isrc -I/usr/include/opencv -L/usr/lib `pkg-config --cflags --libs gstreamer-0.10` `pkg-config opencv --cflags --libs` `pkg-config --cflags --libs glib-2.0` `pkg-config --cflags --libs gstreamer-plugins-base-0.10` -msse3 -lgstapp-0.10 -Wall -pedantic -fopenmp

debug:
	g++ -std=c++11 -g -o ${APP} *.cpp calibration/*.cpp elas/*.cpp -Isrc -I/usr/include/opencv -L/usr/lib `pkg-config opencv --cflags --libs` -msse3 -Wall -pedantic -fopenmp

clean:
	rm -f v4l2stereo

install:
	install -m 755 --strip ${APP} ${DESTDIR}${PREFIX}/bin
