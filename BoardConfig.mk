#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/dreamlte

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := dreamlte

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display
TARGET_SCREEN_DENSITY := 480

# Fingerprint
TARGET_SEC_FP_HAS_FINGERPRINT_GESTURES := true

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Glove mode
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/glove/glove_manifest.xml

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/system.prop

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos8895
TARGET_BOOTLOADER_BOARD_NAME := universal8895
BOARD_VENDOR := samsung

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

# Secondary Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

# Binder
TARGET_USES_64_BIT_BINDER := true

# Extracted with libbootimg
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_BASE := 0x10000000
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := Image
#BOARD_KERNEL_CMDLINE := The bootloader ignores the cmdline from the boot.img
BOARD_KERNEL_SEPARATED_DT := true
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos
BOARD_ROOT_EXTRA_FOLDERS += efs cpefs
BOARD_USES_FULL_RECOVERY_IMAGE := false

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := exynos8895-dreamlte_defconfig
KERNEL_SUPPORTS_LLVM_TOOLS := true
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := clang-proton
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_SOURCE := kernel/samsung/universal8895
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    LLVM=1 \
    LLVM_IAS=1 \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument -Wno-reorder-init-list -Wno-implicit-fallthrough -Wno-c99-designator -Wno-implicit-int-float-conversion -Wno-int-in-bool-context -Wno-alloca -Wno-dangling-gsl -Wno-pointer-compare -Wno-final-dtor-non-final-class -Wno-incomplete-setjmp-declaration -Wno-sizeof-array-div -Wno-xor-used-as-pow -fsplit-lto-unit -Wno-c++17-extensions -flax-vector-conversions=all  -Wno-tautological-overlap-compare -Wno-range-loop-analysis -Wno-invalid-partial-specialization -Wno-deprecated-copy -Wno-misleading-indentation -Wno-zero-as-null-pointer-constant -Wno-deprecated-enum-enum-conversion -Wno-deprecated-anon-enum-enum-conversion -Wno-bool-operation -Wno-unused-comparison -Wno-string-compare -Wno-wrong-info -Wno-thread-safety-analysis -Wno-unsequenced -Wno-unknown-warning-option"
    KBUILD_BUILD_USER=$(BUILD_USERNAME) KBUILD_BUILD_HOST=$(BUILD_HOSTNAME)

# Allow LZ4 compression
BOARD_RAMDISK_USE_LZ4 := true

# Use these flags if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     :=  41943040 #(40960 sda7)
BOARD_RECOVERYIMAGE_PARTITION_SIZE :=  48234496 #(47104 sda8)
BOARD_SYSTEMIMAGE_PARTITION_SIZE   :=  4508876800 #(4454400 sda17)
BOARD_USERDATAIMAGE_PARTITION_SIZE :=  58556678144 #(57184256 sda24)
BOARD_CACHEIMAGE_PARTITION_SIZE    :=  524288000 #(512000 sda18)
BOARD_FLASH_BLOCK_SIZE := 4096

# Manifest
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/hidl/manifest.xml

# Vendor separation
TARGET_COPY_OUT_VENDOR := system/vendor

# Device Tree
BOARD_USES_DT := true

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriverArm.so

# Samsung HALs
TARGET_POWERHAL_VARIANT := samsung

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true

# Backlight
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/ramdisk/etc/fstab.samsungexynos8895

# Wifi
TARGET_USES_64_BIT_BCMDHD        := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_USE_HIDL          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# MACLOADER
BOARD_HAVE_SAMSUNG_WIFI          := true

# Sepolicy
include device/banana/sepolicy/exynos/sepolicy.mk
BOARD_SEPOLICY_TEE_FLAVOR := mobicore
include device/samsung_slsi/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/samsung/dreamlte/sepolicy/vendor
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Ril
ENABLE_VENDOR_RIL_SERVICE := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/lib/libexynoscamera.so|/vendor/lib/libexynoscamera_shim.so \
    /system/lib64/libexynoscamera.so|/vendor/lib64/libexynoscamera_shim.so \
    /system/lib/libblurdetection_interface.so|/vendor/lib/idev0_shim.so \
    /system/lib64/libblurdetection_interface.so|/vendor/lib64/idev0_shim.so \
    /system/lib/libfocuspeaking_interface.so|/vendor/lib/idev0_shim.so \
    /system/lib64/libfocuspeaking_interface.so|/vendor/lib64/idev0_shim.so \
    /system/vendor/lib64/libexynosdisplay.so|/system/vendor/lib64/libexynosdisplay_shim.so \
    /system/vendor/lib/libexynosdisplay.so|/system/vendor/lib/libexynosdisplay_shim.so \
    /system/vendor/lib64/hw/hwcomposer.exynos5.so|/system/vendor/lib64/libexynosdisplay_shim.so \
    /system/vendor/lib/hw/hwcomposer.exynos5.so|/system/vendor/lib/libexynosdisplay_shim.so

# Inherit from vendor dreamlte
include vendor/samsung/dreamlte/BoardConfigVendor.mk
