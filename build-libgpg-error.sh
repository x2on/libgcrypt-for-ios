#!/bin/bash

#  Automatic build script for libgpg-error 
#  for iPhoneOS and iPhoneSimulator
#
#  Created by Felix Schulze on 30.01.11.
#  Copyright 2010 Felix Schulze. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
###########################################################################
#  Change values here
#
VERSION="1.10"
SDKVERSION="6.1"
#
###########################################################################
#
# Don't change anything here
CURRENTPATH=`pwd`
ARCHS="i386 armv7 armv7s"
DEVELOPER=`xcode-select -print-path`

##########
set -e
if [ ! -e libgpg-error-${VERSION}.tar.gz ]; then
	echo "Downloading libgpg-error-${VERSION}.tar.gz"
    curl -O ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${VERSION}.tar.gz
else
	echo "Using libgpg-error-${VERSION}.tar.gz"
fi

mkdir -p bin
mkdir -p lib
mkdir -p src

for ARCH in ${ARCHS}
do
	if [ "${ARCH}" == "i386" ];
	then
		PLATFORM="iPhoneSimulator"
	else
		PLATFORM="iPhoneOS"
	fi
	echo "Building libgpg-error for ${PLATFORM} ${SDKVERSION} ${ARCH}"
	echo "Please stand by..."
	tar zxf libgpg-error-${VERSION}.tar.gz -C src
	cd src/libgpg-error-${VERSION}

	export BUILD_DEVROOT="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer"
	export BUILD_SDKROOT="${BUILD_DEVROOT}/SDKs/${PLATFORM}${SDKVERSION}.sdk"
	export LD=${BUILD_DEVROOT}/usr/bin/ld
	if [ "${ARCH}" == "i386" ];
	then
	export CC=${BUILD_DEVROOT}/usr/bin/gcc
		export CPP=${BUILD_DEVROOT}/usr/bin/cpp
		export CXX=${BUILD_DEVROOT}/usr/bin/g++
		export CXXCPP=$BUILD_DEVROOT/usr/bin/cpp
	else
		export CC=${BUILD_DEVROOT}/usr/bin/gcc
		export CXX=${BUILD_DEVROOT}/usr/bin/g++
	fi
	export AR=${BUILD_DEVROOT}/usr/bin/ar
	export AS=${BUILD_DEVROOT}/usr/bin/as
	export NM=${BUILD_DEVROOT}/usr/bin/nm
	export CXXCPP=$BUILD_DEVROOT/usr/bin/cpp
	export RANLIB=$BUILD_DEVROOT/usr/bin/ranlib
	export LDFLAGS="-arch ${ARCH} -pipe -no-cpp-precomp -isysroot ${BUILD_SDKROOT} -L${CURRENTPATH}/lib"
	export CFLAGS="-arch ${ARCH} -pipe -no-cpp-precomp -isysroot ${BUILD_SDKROOT} -I${CURRENTPATH}/include"
	export CXXFLAGS="-arch ${ARCH} -pipe -no-cpp-precomp -isysroot ${BUILD_SDKROOT} -I${CURRENTPATH}/include"

	mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk"

	LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk/build-libgpg-error-${VERSION}.log"

	./configure --host=${ARCH}-apple-darwin --prefix="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk" --disable-shared --enable-static >> "${LOG}" 2>&1

	make >> "${LOG}" 2>&1
	make install >> "${LOG}" 2>&1
	cd ${CURRENTPATH}
	rm -rf src/libgpg-error-${VERSION}
	
done

echo "Build library..."
lipo -create ${CURRENTPATH}/bin/iPhoneSimulator${SDKVERSION}-i386.sdk/lib/libgpg-error.a ${CURRENTPATH}/bin/iPhoneOS${SDKVERSION}-armv7.sdk/lib/libgpg-error.a ${CURRENTPATH}/bin/iPhoneOS${SDKVERSION}-armv7s.sdk/lib/libgpg-error.a -output ${CURRENTPATH}/lib/libgpg-error.a
mkdir -p ${CURRENTPATH}/include/libgpg-error
cp -R ${CURRENTPATH}/bin/iPhoneSimulator${SDKVERSION}-i386.sdk/include/ ${CURRENTPATH}/include/libgpg-error/
echo "Building done."