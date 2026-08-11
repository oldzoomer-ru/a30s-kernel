########################################################################
# Kernel settings
########################################################################

# Galaxy A30s (SM-A307FN/G/GT) - Exynos 7904
# Android 11 (OneUI 3.x) kernel, non-GKI

# Kernel variant. This is currently used only on the Source package name.
# Use 'android' for Android kernels ("downstream") or 'mainline' for upstream
# kernels.
VARIANT = android

# Kernel base version (from Makefile: VERSION=4, PATCHLEVEL=4, SUBLEVEL=302)
KERNEL_BASE_VERSION = 4.4.302

# The kernel cmdline to use.
# Extracted from stock boot.img: "androidboot.selinux=permissive"
# Appended "console=tty0 droidian.lvm.prefer" as required by the guide.
# No "systempart" entry in stock cmdline to remove.
KERNEL_BOOTIMAGE_CMDLINE = androidboot.selinux=permissive console=tty0 droidian.lvm.prefer

# Slug for the device vendor. This is going to be used in the KERNELRELASE
# and package names.
DEVICE_VENDOR = samsung

# Slug for the device model. Like above.
DEVICE_MODEL = a30s

# Slug for the device platform. If unsure, keep this commented.
DEVICE_PLATFORM = exynos7904

# Marketing-friendly full-name. This will be used inside package descriptions
DEVICE_FULL_NAME = Samsung Galaxy A30s

# Whether to use configuration fragments to augment the kernel configuration.
# Droidian fragments are already present in the droidian/ directory.
KERNEL_CONFIG_USE_FRAGMENTS = 1

# Enable kernel config device extra fragments
# Uses the existing halium, droidian, container and debug config fragments
# KERNEL_CONFIG_EXTRA_FRAGMENTS = example.conf

# Whether to use diffconfig to generate the device-specific configuration.
# If you enable this, you should set KERNEL_CONFIG_USE_FRAGMENTS to 1.
# If unsure, keep this to 0.
KERNEL_CONFIG_USE_DIFFCONFIG = 0

# The diffconfig to apply. Only used when KERNEL_CONFIG_USE_DIFFCONFIG is
# enabled.
# KERNEL_PRODUCT_DIFFCONFIG = my_diffconfig

# Defconfig to use
KERNEL_DEFCONFIG = exynos7885-a30s_defconfig

# Whether to include DTBs with the image. Use 0 (no) or 1.
# GKI devices should set this to 0
KERNEL_IMAGE_WITH_DTB = 1

# Path to the DTB.
KERNEL_IMAGE_DTB = arch/arm64/boot/dts/exynos/dtbo/exynos7885.dtb

# Whether to include a DTB Overlay. Use 0 (no) or 1.
# GKI devices should set this to 0
KERNEL_IMAGE_WITH_DTB_OVERLAY = 1

# Path to the DTB overlay.
# KERNEL_IMAGE_DTB_OVERLAY = arch/arm64/boot/dts/exynos/dtbo/example.dtb

# Whether to include the DTB Overlay into the kernel image
# Use 0 (no, default) or 1.
# dtbo.img will always be shipped in the linux-bootimage- package.
# GKI devices should set this to 0
KERNEL_IMAGE_WITH_DTB_OVERLAY_IN_KERNEL = 1

# Path to a specific configuration file for mkdtboimg.
KERNEL_IMAGE_DTB_OVERLAY_CONFIGURATION = debian/dtbo.cfg

# Path to the DTB directory. Only define if KERNEL_IMAGE_DTB_OVERLAY_CONFIGURATION
# is defined too.
KERNEL_IMAGE_DTB_OVERLAY_DTB_DIRECTORY = arch/arm64/boot/dts/exynos/dtbo

# Path to the prebuilt DT image. Should only be defined on header version 1 and below.
# Mostly used on Samsung devices. Default is to leave it undefined.
# KERNEL_PREBUILT_DT = debian/dt.img

# Various other settings that will be passed straight to mkbootimg
# All offsets below are verified from stock boot.img via unpackbootimg:
#   unpackbootimg -i boot.img
# kernel load address: 0x10008000  →  BASE_OFFSET(0x10000000) + KERNEL_OFFSET(0x00008000)
# kernel tags load address: 0x10000100  →  BASE_OFFSET(0x10000000) + TAGS_OFFSET(0x00000100)
# page size: 2048
# GKI devices can leave BASE_OFFSET, KERNEL_OFFSET, INITRAMFS_OFFSET, SECOND_OFFSET and TAGS_OFFSET empty
KERNEL_BOOTIMAGE_PAGE_SIZE = 2048
KERNEL_BOOTIMAGE_BASE_OFFSET = 0x10000000
KERNEL_BOOTIMAGE_KERNEL_OFFSET = 0x00008000
KERNEL_BOOTIMAGE_INITRAMFS_OFFSET = 0x01000000
KERNEL_BOOTIMAGE_SECONDIMAGE_OFFSET = 0x00f00000
KERNEL_BOOTIMAGE_TAGS_OFFSET = 0x00000100

# Specify boot image security patch level if needed
# Verified from stock boot.img: os patch level = 2023-08
KERNEL_BOOTIMAGE_PATCH_LEVEL = 2023-08

# Specify boot image OS version if needed
# Verified from stock boot.img: os version = 11.0.0
KERNEL_BOOTIMAGE_OS_VERSION = 11.0.0

# Required for header version 2, ignore otherwise
# Galaxy A30s stock boot.img is header version 1, so DTB_OFFSET is not needed.
# GKI devices should leave this offset empty
# KERNEL_BOOTIMAGE_DTB_OFFSET = 0x1f00000

# Kernel bootimage version. Defaults to 0 (legacy header).
# Galaxy A30s: stock boot.img reports header version 1 (Android 11 / OneUI 3.x).
# As a rule of thumb:
# Devices launched with Android 8 and lower: version 0
# Devices launched with Android 9: version 1
# Devices launched with Android 10: version 2
# Devices launched with Android 11: version 2 or 3 (GKI)
# Devices launched with Android 12: version 3 (GKI) or 4 (GKI)
# Devices launched with Android 13: version 3 (GKI) or 4 (GKI)
KERNEL_BOOTIMAGE_VERSION = 1

# Kernel initramfs compression. Defaults to gzip.
# All non-gki devices need a gzip (gz) initramfs
# For devices launched with a GKI kernel it can be either gzip (gz) or lz4 (lz4)
KERNEL_INITRAMFS_COMPRESSION = gz

# Whether to generate a vendor_boot image. Supported since
# bootimage version 3.
# vendor_boot images will contain the required kernel modules that
# are to be loaded during the initramfs stage.
# If building for a device with bootimage version >= 3, you
# should probably want to enable it.
#
# Module list should be added in KERNEL_DIR/droidian/modules.load.
KERNEL_BOOTIMAGE_GENERATE_VENDOR_BOOT = 0

# The cmdline for the vendor_boot image
KERNEL_BOOTIMAGE_VENDOR_CMDLINE = 

########################################################################
# Android verified boot
########################################################################

# Whether to build a flashable vbmeta.img. Please note that currently
# only empty vbmeta images (disabling verified boot) can be generated.
# Use 0 (no) or 1 (default).
DEVICE_VBMETA_REQUIRED = 1

# Samsung devices require a special flag. Enable the following if your
# device is a Samsung device that requires flag 0 to be present
# Use 0 (no, default) or 1.
DEVICE_VBMETA_IS_SAMSUNG = 1

# boot partition size. If specified, an AVB footer will be added at the
# end of the bootimage.
# KERNEL_BOOTIMAGE_PARTITION_SIZE = 37748736

########################################################################
# Automatic flashing on package upgrades
########################################################################

# Whether to enable kernel upgrades on package upgrades. Use 0 (no) or 1.
FLASH_ENABLED = 1

# If your device is treble-ized, but aonly, you should set the following to
# 1 (yes).
FLASH_IS_AONLY = 0

# `flash-bootimage` defaults are enough for most recent devices, but legacy
# devices won't work out of the box.
# If you set the following to 1, this package will set `flash-bootimage`'s
# DEVICE_IS_AB and BOOTIMAGE_SLOT_A accordingly, thus enabling flashing
# on older devices.
FLASH_IS_LEGACY_DEVICE = 0

# On some exynos devices partition names are capitalized (boot is BOOT and so on)
# This flag makes the kernel to get flashed to the correct partition on updates.
# Galaxy A30s uses Exynos SoC, so this must be enabled.
FLASH_IS_EXYNOS = 1

# On some devices flashing userdata.img via fastboot fails and telnet should
# be used instead. Set to 1 for telnet and 0 for fastboot
FLASH_USE_TELNET = 0

# Device manufacturer. This must match the `ro.product.vendor.manufacturer`
# Android property. If you don't want to specify this, leave it undefined,
# FLASH_INFO_CPU will be checked instead.
FLASH_INFO_MANUFACTURER = samsung

# Device model. This must match the `ro.product.vendor.model`
# Android property. If you don't want to specify this, leave it undefined,
# FLASH_INFO_CPU will be checked instead.
# Verify this on a running Droidian/Android system:
#   android_getprop ro.product.vendor.model
FLASH_INFO_MODEL = SM-A307FN

# Device CPU. This will be grepped against /proc/cpuinfo to check if
# we're running on the specific device. Note this is a last-resort
# method, specifying FLASH_INFO_MANUFACTURER and FLASH_INFO_MODEL is
# recommended.
FLASH_INFO_CPU = Exynos7904

# Space-separated list of supported device ids as reported by fastboot
# Verify with: fastboot getvar product
FLASH_INFO_DEVICE_IDS = a30s a30sxx SM-A307FN SM-A307G SM-A307GT

########################################################################
# Kernel build settings
########################################################################

# Whether to cross-build. Use 0 (no) or 1.
BUILD_CROSS = 1

# (Cross-build only) The build triplet to use. You'll probably want to
# use aarch64-linux-android- if building Android kernels.
# might need to use aarch64-linux-gnu- with newer kernels such as GKI
BUILD_TRIPLET = aarch64-linux-android-

# (Cross-build only) The build triplet to use with clang. You'll probably
# want to use aarch64-linux-gnu- here.
BUILD_CLANG_TRIPLET = aarch64-linux-gnu-

# The compiler to use. Recent Android kernels are built with clang.
# For Android 11 kernels, clang is recommended.
# If the build fails with clang, try: BUILD_CC = aarch64-linux-android-gcc-4.9
BUILD_CC = a8fe5040-2585-11e9-9684-4b547fbede22

# Use llvm instead of gcc. Recent Android kernels (past android 12) need llvm.
BUILD_LLVM = 0

# Set to 1 to skip modules packaging if CONFIG_MODULES is disabled in defconfig
# CONFIG_MODULES=y is set in the A30s defconfig, so modules will be built.
BUILD_SKIP_MODULES = 0

# Set clang version
# Android 11 kernel - using clang-android-10.0-r370808
# If the build fails, you can also try:
#   CLANG_VERSION = 12.0-r416183b  (Android 12 toolchain, compatible with 4.4)
#   CLANG_VERSION = 9.0-r353983c   (Android 10 toolchain)
CLANG_VERSION = 10.0-r370808
# Set to 1 to use a manually installed toolchain
# Remember to update the path in BUILD_PATH
CLANG_CUSTOM = 1

# Extra paths to prepend to the PATH variable. You'll probably want
# to specify the clang path here (the default).
BUILD_PATH = /buildd/sources/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin

# Extra packages to add to the Build-Depends section. Mainline builds
# can have this section empty, unless cross-building.
# Added clang-android-10.0-r370808 for Android 11 kernel compilation.
# gcc-4.9 toolchain is kept for binutils/linking support.
DEB_TOOLCHAIN = linux-initramfs-halium-generic:arm64, binutils-aarch64-linux-gnu

# Where we're building on
DEB_BUILD_ON = amd64

# Where we're going to run this kernel on
DEB_BUILD_FOR = arm64

# Target kernel architecture
KERNEL_ARCH = arm64

# Kernel target to build
KERNEL_BUILD_TARGET = Image
