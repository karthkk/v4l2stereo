from cffi import FFI

ffi = FFI()

#ffi.set_source('v4lcamera', """
##include "libcam.h"
#""", libraries=[], include_dirs = ["/usr/include/opencv"])

C = ffi.dlopen("../libcam.so")
if __name__ == '__main__':
    ffi.compile()
