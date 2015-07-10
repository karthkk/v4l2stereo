# distutils: include_dirs = /usr/include/opencv

cdef extern from "libcam.h":
    cdef cppclass Camera:
        Camera(const char*, int , int , int )
        unsigned char *Get()

cdef class PyCamera:
    cdef Camera *thisptr
    def __cinit__(self, const char *n, int w, int h, int f):
        self.thisptr = new Camera(n, w, h, f)
    def __dealloc__(self):
        del self.thisptr
    def get(self):
        return self.thisptr.Get()
  
