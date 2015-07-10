        # distutils: include_dirs = /usr/include/opencv
# distutils: sources = libcam.cpp
from libcpp cimport bool
cimport numpy as np
from cpython.mem cimport PyMem_Malloc, PyMem_Realloc, PyMem_Free

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
     cdef unsigned char* mem
     def __cinit__(self, const char *n, int w, int h, int f):
         self.thisptr = new Camera(n, w, h, f)
         self.mem = <unsigned char*> PyMem_Malloc(3 * w * h * sizeof(unsigned char))

     def __dealloc__(self):
         del self.thisptr
         PyMem_Free(self.mem)

     def update(self, t, timeout):
         return self.thisptr.Update(t, timeout)
#     def Update(self, c2, t, timeout_ms):
#         return self.thisptr.Update(c2.thisptr, t, timeout_ms)

     def toRGB(self, dest_arr):
         v = self.thisptr.toRGB(self.mem)
         return (v, self.mem)

     def toMono(self, img):
         return self.thisptr.toMono(img)

     def StopCam(self ):
         self.thisptr.StopCam()

     def StopCam(self ):
         self.thisptr.StopCam()
     
     def minBrightness(self ):
         self.thisptr.minBrightness()
     def maxBrightness(self ):
         self.thisptr.maxBrightness()
     def defaultBrightness(self ):
         self.thisptr.defaultBrightness()
     def minContrast(self ):
         self.thisptr.minContrast()

     def maxContrast(self ):
         self.thisptr.maxContrast()
     def defaultContrast(self ):
         self.thisptr.defaultContrast()
     def minSaturation(self ):
         self.thisptr.minSaturation()
     def maxSaturation(self ):
         self.thisptr.maxSaturation()
     def defaultSaturation(self ):
         self.thisptr.defaultSaturation()
     def minHue(self ):
         self.thisptr.minHue()
     def maxHue(self ):
         self.thisptr.maxHue()
     def defaultHue(self ):
         self.thisptr.defaultHue()

     def isHueAuto(self ):
         self.thisptr.isHueAuto()
     def minSharpness(self ):
         self.thisptr.minSharpness()
     def maxSharpness(self ):
         self.thisptr.maxSharpness()
     def defaultSharpness(self ):
         self.thisptr.defaultSharpness()

     def setBrightness(self, v):
         self.thisptr.setBrightness(v)
     def setContrast(self, v):
         self.thisptr.setContrast(v)
     def setSaturation(self, v):
         self.thisptr.setSaturation(v)
     def setHue(self, v):
         self.thisptr.setHue(v)
     def setHueAuto(self, v):
         self.thisptr.setHueAuto(v)
     def setSharpness(self, v):
         self.thisptr.setSharpness(v)
     def setExposureAuto(self ):
         self.thisptr.setExposureAuto()
     def setExposureAutoPriority(self, v):
         self.thisptr.setExposureAutoPriority(v)
     def getExposure(self ):
         self.thisptr.getExposure()
     def setExposure(self, v):
         self.thisptr.setExposure(v)
     def setExposureAutoOff(self ):
         self.thisptr.setExposureAutoOff()
