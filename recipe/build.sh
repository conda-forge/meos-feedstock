#!/bin/bash
set -e

mkdir -p build && cd build

cmake ${CMAKE_ARGS} \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=${PREFIX} \
        -D CMAKE_INSTALL_LIBDIR=lib \
        -D MEOS=on \
        -D GSL_INCLUDE_DIR=${PREFIX}/include \
        -D GSL_LIBRARY=${PREFIX}/lib/libgsl${SHLIB_EXT} \
        -D GSL_CBLAS_LIBRARY=${PREFIX}/lib/libgslcblas${SHLIB_EXT} \
        -D PROJ_INCLUDE_DIRS=${PREFIX}/include \
        -D PROJ_LIBRARIES=${PREFIX}/lib/libproj${SHLIB_EXT} \
        -D GEOS_INCLUDE_DIR=${PREFIX}/include \
        -D GEOS_LIBRARY=${PREFIX}/lib/libgeos_c${SHLIB_EXT} \
        -D JSON-C_INCLUDE_DIRS=${PREFIX}/include/json-c \
        -D JSON-C_LIBRARIES=${PREFIX}/lib/libjson-c${SHLIB_EXT} \
        ${SRC_DIR}

make -j
make install