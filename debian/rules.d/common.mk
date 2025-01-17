## Kernel information
KERNEL_MAJMIN=$(shell ./scripts/version.sh -n)
KERNEL_VER=$(shell ./scripts/version.sh -L)

## Debian package information
PKG_DISTRIBUTOR ?= PVE Port
PKG_RELEASE = $(shell ./scripts/version.sh -r)
PKG_DATE := $(shell dpkg-parsechangelog -SDate)
PKG_DATE_UTC_ISO := $(shell date -u -d '$(PKG_DATE)' +%Y-%m-%d)
PKG_GIT_VERSION := $(shell git rev-parse HEAD)

# Build settings
PVE_KERNEL_CC ?= ${CC}
PVE_ZFS_CC ?= ${CC}

### Debian package names
DEB_DISTRIBUTION=dlc-generic
EXTRAVERSION=-${DEB_DISTRIBUTION}
KVNAME=${KERNEL_VER}-${DEB_DISTRIBUTION}

PVE_KERNEL_PKG=pve-kernel-${KVNAME}
PVE_HEADER_PKG=pve-headers-${KVNAME}
PVE_USR_HEADER_PKG=pve-kernel-libc-dev
LINUX_TOOLS_PKG=linux-tools-${KERNEL_MAJMIN}
