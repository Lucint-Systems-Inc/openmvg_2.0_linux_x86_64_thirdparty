#!/bin/bash

BUILD_DIR=`readlink -f ./cmake_build`
OUTPUT_DIR=`readlink -f ./built`
LSI_ROOT_DIR=`readlink -f ~/lsi/`

echo "Using build dir $BUILD_DIR"

rm -rf $BUILD_DIR
rm -rf $OUTPUT_DIR

mkdir -vp $BUILD_DIR
mkdir -vp $OUTPUT_DIR

cd $BUILD_DIR

cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="" \
    -D OpenMVG_BUILD_DOC=OFF \
    -D OpenMVG_BUILD_EXAMPLES=OFF \
    -D OpenMVG_BUILD_SOFTWARES=OFF \
    -D OpenMVG_BUILD_GUI_SOFTWARES=OFF \
    -D Eigen3_DIR=$LSI_THIRDPARTY_DIR/eigen_3.4.0_thirdparty/built/usr/local/share/eigen3/cmake \
    -D Ceres_DIR=$LSI_THIRDPARTY_DIR/ceres-solver_1.13.0_linux_x86_64_thirdparty/built/usr/local/lib/cmake/Ceres \
    ../src


make -j8 DESTDIR=$OUTPUT_DIR install
