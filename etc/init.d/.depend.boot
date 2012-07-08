TARGETS = mountkernfs.sh mountdevsubfs.sh bootlogd hwclock.sh hostname.sh checkroot.sh mtab.sh kmod checkfs.sh mountall.sh mountall-bootclean.sh mountoverflowtmp networking urandom procps rpcbind nfs-common mountnfs.sh mountnfs-bootclean.sh bootmisc.sh stop-bootlogd-single fuse screen-cleanup
INTERACTIVE = checkroot.sh checkfs.sh
mountdevsubfs.sh: mountkernfs.sh
bootlogd: mountdevsubfs.sh
hwclock.sh: mountdevsubfs.sh bootlogd
hostname.sh: bootlogd
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh bootlogd
mtab.sh: checkroot.sh
kmod: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
mountall.sh: checkfs.sh
mountall-bootclean.sh: mountall.sh
mountoverflowtmp: mountall-bootclean.sh
networking: mountkernfs.sh mountall.sh mountoverflowtmp
urandom: mountall.sh mountoverflowtmp
procps: mountkernfs.sh mountall.sh mountoverflowtmp bootlogd
rpcbind: networking mountall.sh mountoverflowtmp
nfs-common: rpcbind hwclock.sh
mountnfs.sh: mountall.sh mountoverflowtmp networking rpcbind nfs-common
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
stop-bootlogd-single: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh hwclock.sh networking mountkernfs.sh urandom mountdevsubfs.sh checkroot.sh rpcbind nfs-common hostname.sh procps bootlogd mtab.sh checkfs.sh mountall-bootclean.sh bootmisc.sh kmod fuse screen-cleanup
fuse: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
screen-cleanup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
