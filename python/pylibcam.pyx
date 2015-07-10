        # distutils: include_dirs = /usr/include/opencv
# distutils: sources = libcam.cpp
from libcpp cimport bool

cdef extern from "libcam.h":
     cdef cppclass Camera:
         Camera(const char *name, int w, int h, int f);
         bool Update(unsigned int t, int timeout_ms);
         bool Update(Camera *c2, unsigned int t, int timeout_ms);
         void toRGB(unsigned char * img);
         void toMono(unsigned char * img);

         void StopCam();

         int minBrightness();
         int maxBrightness();
         int defaultBrightness();
         int minContrast();

         int maxContrast();
         int defaultContrast();
         int minSaturation();
         int maxSaturation();
         int defaultSaturation();
         int minHue();
         int maxHue();
         int defaultHue();
         bool isHueAuto();
         int minSharpness();
         int maxSharpness();
         int defaultSharpness();

         int setBrightness(int v);
         int setContrast(int v);
         int setSaturation(int v);
         int setHue(int v);
         int setHueAuto(bool v);
         int setSharpness(int v);
         int setExposureAuto();
         int setExposureAutoPriority(int v);
         int getExposure();
         int setExposure(int v);
         int setExposureAutoOff();


cdef class PyCamera:
     cdef Camera *thisptr
     def __cinit__(self, const char *n, int w, int h, int f):
         self.thisptr = new Camera(n, w, h, f)
     def __dealloc__(self):
         del self.thisptr
     def update(self, t, timeout):
         self.thisptr.Update(t, timeout)
