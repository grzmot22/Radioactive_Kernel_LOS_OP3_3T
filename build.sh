#!/bin/bash
rm .version
make mrproper
make clean
# Kernel Details
VER="_V1.2.4_oneplus3-3T"
BASE_AK_VER="Radioactive"

# Vars
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=acuicultor
export KBUILD_BUILD_HOST=NuclearPowerPlant

#paths
KERNEL_DIR="/run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/cm14.1/kernel/oneplus/radioActive"
ZIP_MOVE="/run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/android/releases"
ZIMAGE_DIR="/run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/cm14.1/kernel/oneplus/radioActive/arch/arm64/boot"
MODULES_DIR="/run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/cm14.1/kernel/oneplus/lazyflasher"

#build info 
THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
export CROSS_COMPILE=/run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/android/aarch64-linux-android-4.9/bin/aarch64-linux-android-
AK_VER="$BASE_AK_VER$VER"
export LOCALVERSION=~`echo $AK_VER`
export LOCALVERSION=~`echo $AK_VER`
DEFCONFIG="radioactive_defconfig"
make $DEFCONFIG
make $THREAD

#make our zips
cp -vr $ZIMAGE_DIR/Image.gz-dtb /run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/android/lazyflasher/zImage
find $KERNEL_DIR -name '*.ko' -exec cp -v {} $MODULES_DIR \;
cd /run/media/grzmot22/58b717ea-9909-499b-95aa-12b8c4d0f82f/cm14.1/kernel/oneplus/lazyflasher
make VERSION=$VER NAME=$BASE_AK_VER
cd $KERNEL_DIR
